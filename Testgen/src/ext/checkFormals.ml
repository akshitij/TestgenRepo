(*
 * This feature is used to check the parameters 
 * of the function under test. If one of the 
 * argument is of structure type then flatten 
 * it that is, break in to its fields.
 *     If any parameter is pointer consider it
 * as array and use a global variable to store 
 * the trace for this parameter.
*)


open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl


let alist : varinfo list ref = ref []
let preinstr : instr list ref = ref []
let ptrVar : varinfo list ref = ref []
let fi : fieldinfo list ref = ref []
let stmtlist : stmt list ref = ref []

(* varinfo -> exp *)
let v2e (v : varinfo) : exp = Lval(var v)


let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 


let rec checkExpForStruct e (fd : fundec) : exp = 
   match e with
  | UnOp(op,e1,t) -> UnOp(op, (checkExpForStruct e1 fd),t)
  | BinOp(op, e1, e2, t) -> BinOp(op, (checkExpForStruct e1 fd), (checkExpForStruct e2 fd), t);
  | Lval(_,Field(_,_)) -> let tmp = makeTempVar fd intType in
                             let st = mkStmtOneInstr (Set((var tmp), e, locUnknown)) in
                              stmtlist := !stmtlist @ [st];
                               e
  |_ -> e


(* visitor *)

class checkFormalsVisitorClass (fdec : fundec) = object
  inherit nopCilVisitor     

 method vstmt (s : stmt) = begin
 let action s =
      match s.skind with
        
       |If(e,tb,fb,l) -> stmtlist := [];
                          let e1 = (checkExpForStruct e fdec) in
                           tb.bstmts <- !stmtlist @ tb.bstmts;
                           s.skind <- (If(e1,tb,fb,l));
                            s

       | _ -> s

 in 
       ChangeDoChildrenPost(s,action)
  end

end


let rec flatten (f : fieldinfo) : varinfo list =
   match f.ftype with
   | TComp(c , []) -> List.concat (List.map (fun v -> (flatten v)) c.cfields)
   | _ -> [(makeVarinfo false f.fname f.ftype)]


(* function to initialize Arrays *)
let initArray (v : lval) (local : varinfo) (e : exp) (rhs : lval) : stmt list =
      let preset = mkStmtOneInstr (Set((var local), (integer 0), !currentLoc)) in
       let s = mkStmt (Break(!currentLoc)) in
        let v2 = addOffsetLval (Index((v2e local) ,NoOffset)) rhs in
         let st1 = mkStmtOneInstr (Set(v, Lval(v2), !currentLoc)) in                 
          let st2 = mkStmtOneInstr (Set((var local), (BinOp(PlusA, (v2e local), (integer 1), intType)), !currentLoc)) in
           let preif = mkStmt (If(BinOp(Ge, (v2e local), e ,intType) ,(mkBlock [s]), (mkBlock [st1; st2]),!currentLoc)) in
            let loopblk = mkBlock [preif] in
             let loopStmt = mkStmt (Loop(loopblk, !currentLoc, None ,None)) in
             [preset; loopStmt]



(* get offset for structure inside structures *)
let rec getOffset (fi : fieldinfo list) (off : offset) : offset =
  if (List.length fi)>0 then
      getOffset  (List.tl fi) (addOffset (Field((List.hd fi) ,NoOffset)) off)
  else
    off


(* function to redirect and initialize flattened structure fields *)
let rec directStructFields (fi : fieldinfo list ref) (mainCi : varinfo) (currCi :compinfo) (local :varinfo) : stmt list =
 List.concat (List.map (fun v -> match v.ftype with
                      | TComp(c, _) ->
                                       fi := !fi @ [v];
                                       directStructFields fi mainCi c local

                      | TArray(_,Some e,_) ->
                                let vi = makeVarinfo true v.fname v.ftype  in
                                let off = addOffset (Field(v,NoOffset)) (getOffset !fi NoOffset) in
                                let off1 = addOffset (Index((v2e local),NoOffset)) off in
                                 initArray (addOffsetLval off1 (var mainCi)) local e (var vi)                                     

                      | _ -> 

                        let off = addOffset (Field(v,NoOffset)) (getOffset !fi NoOffset) in
                           let pre1 = Set((addOffsetLval off (var mainCi)),(v2e (makeVarinfo false v.fname v.ftype)),!currentLoc) in
                                     [(mkStmtOneInstr pre1)] 


            ) currCi.cfields)
 




let checkFormals (f: file) : unit =
 (* function name under test *)
  let su = read_line () in
    
  let doGlobal = function
    | GFun (fdec, loc) when fdec.svar.vname=su -> 

   if List.length fdec.sformals>0 then
   begin
         (* loop through argument list and check for components or pointer in it *)
        
      let local = makeLocalVar fdec "i" intType in       
        let temp =  makeLocalVar fdec "temp" intType in  
         let newFormal = List.concat (List.map (fun v-> match v.vtype with
                                     | TComp(ci, [])-> 
                                          let p = makeLocalVar fdec v.vname v.vtype in
                                 
      List.map (fun a -> match a.ftype with                

                        | TArray(_,Some e,_) ->
                                let vi = makeVarinfo true a.fname a.ftype  in
                                let st = initArray ((addOffsetLval (Field(a,(Index((v2e local),NoOffset)))) (var v))) local e (var vi) in 
                                     fdec.sbody.bstmts <-  st @ fdec.sbody.bstmts 

                        | TComp(ci,_) -> fi := !fi @ [a];
                                         let st = directStructFields fi p ci local in
                                         fdec.sbody.bstmts <- st @ fdec.sbody.bstmts

                        | _ -> 
                           let pre1 = Set((addOffsetLval (Field(a,NoOffset)) (var p)),(v2e (makeVarinfo false a.fname a.ftype)),!currentLoc) in
                                     fdec.sbody.bstmts <-  [mkStmtOneInstr pre1] @ fdec.sbody.bstmts 
               ) ci.cfields;
                                           
                       List.concat (List.map (fun v -> (flatten v)) ci.cfields)
                                  
                                   
                                     | _ -> [v]
                     )fdec.sformals) in
          
               fdec.sformals <- newFormal;

 end;

  let f = List.concat (List.map (fun v -> match v.vtype with
                                           |TArray(TComp(_,_),_,_) -> []
                                           |TArray(_,_,_) -> [v]
                                           |_ -> []
                    ) fdec.slocals) in

  fdec.sformals <- fdec.sformals @ f;

  fdec.slocals <- List.concat (List.map (fun v -> match v.vtype with
                                           |TArray(TComp(_,_),_,_) -> [v]
                                           |TArray(_,_,_) -> []
                                           |_ -> [v]
                    ) fdec.slocals) ;

 (* call to visitor *)
let checkFormalsVisitor = new checkFormalsVisitorClass fdec in
        ignore (visitCilFunction checkFormalsVisitor fdec) 


                   
    | _ -> ()
  in
  Stats.time "checkFormals" (iterGlobals f) doGlobal 
  
   

let feature : featureDescr = 
  { fd_name = "checkFormals";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = checkFormals;
    fd_post_check = true
  } 

