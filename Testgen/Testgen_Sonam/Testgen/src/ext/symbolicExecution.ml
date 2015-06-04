(* pathSymbol feature is used for symbolic execution.
 * Each temporary variable is implemented in terms of
 * symbolic variables.*)

open Pretty
open Cil
open Trace
open Printf
module E = Errormsg
module H = Hashtbl
module L = List


(* switches *)
let printFunctionName = ref "printf"
let htinsertFunctionName = ref "ht_insert"
let inputTermsFunctionName = ref "inputTerms"
let ptrUpdateFunctionName = ref "hashptr_update"
let insertFunctionName0 = ref "pInputTerms"
let insertFunctionName1 = ref "handleMalloc"


let addProto = ref false
let hinstrns: stmt list ref = ref [] 


let printf: varinfo option ref = ref None

(* prototype for printf function *)
let makePrintfFunction () : varinfo = 
    match !printf with 
      Some v -> v
    | None -> begin 
        let v = makeGlobalVar !printFunctionName 
                     (TFun(voidType, Some [("format", charPtrType, [])],
                             true, [])) in
        printf := Some v;
        addProto := true;
        v
    end


let mkPrint (format: string) (args: exp list) : instr = 
  let p: varinfo = makePrintfFunction () in 
  Call(None, Lval(var p), (mkString format) :: args, !currentLoc)



(* prototype for ht_insert function *)
let makeHashInsertFunction () : varinfo = 
        let v = makeGlobalVar !htinsertFunctionName 
                    (TFun(voidType, Some [("key", charPtrType, []);
                                          ("val", charPtrType, []);
                                          ("state", intType, [])],
                             true, [])) in
         v

let mkhashinsertfxn (key: string) (value : string) (args : exp list) : instr = 
  let i: varinfo = makeHashInsertFunction () in 
  Call(None, Lval(var i), [mkString key; mkString value] @ args, !currentLoc)


(*prototype for inputTerms function *)
let makeInputTermsFunction () : varinfo = 
         let v = makeGlobalVar !inputTermsFunctionName 
                    (TFun(voidType, Some [("lhs", charPtrType, []);
                                          ("rhs", charPtrType, [])],
                             true, [])) in
         v

let mkinputtermsfxn (lhs: string) (rhs: string) (args: exp list) : instr = 
  let i: varinfo = makeInputTermsFunction () in 
  Call(None, Lval(var i), [mkString lhs; mkString rhs] @ args, !currentLoc)



(* Prototype for hashptr_update *)
let makeHashPtrUpdateFunction () : varinfo = 
        let v = makeGlobalVar !ptrUpdateFunctionName 
                    (TFun(voidType, Some [("key", charPtrType, []);
                                          ("val", intType, [])],
                             true, [])) in
         v

let mkhashPtrupdatefxn (key: string) (value : int) : instr = 
  let i: varinfo = makeHashPtrUpdateFunction () in 
  Call(None, Lval(var i), [mkString key; integer value], !currentLoc)


(* Prototype for PInputTerms function *)
let makePInputTermsFunction () : varinfo = 
         let v = makeGlobalVar !insertFunctionName0 
                    (TFun(voidType, Some [("lhs", charPtrType, []);
                                          ("rhs", charPtrType, [])],
                             true, [])) in
         v


let mkpinputtermsfxn (lhs: string) (rhs: string)  : instr = 
  let i: varinfo = makePInputTermsFunction () in 
  Call(None, Lval(var i), [mkString lhs; mkString rhs], locUnknown)


(* Prototype for handleMalloc function *)
let makehandleMallocFunction () : varinfo = 
         let v = makeGlobalVar !insertFunctionName1 
                    (TFun(voidType, Some [("lhs", charPtrType, []);
                                          ("rhs", charPtrType, []);
                                          ("value", intType, [])],
                             true, [])) in
         v


let mkhandlemallocfxn (lhs: string) (rhs: string) (value: int)  : instr = 
  let i: varinfo = makehandleMallocFunction () in 
  Call(None, Lval(var i), [mkString lhs; mkString rhs; integer value], locUnknown)


(* Pretty printer for cil types to string *)
let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 


(* Function to convert infix expressions in to S-Expression format *)
let rec getSExp (e : exp)  = 
 match e with
   | BinOp(op,e1,e2,l) -> begin
                              match op with
                               |Eq -> ("(=" ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ ")")
                               |Ne -> ("(! (=" ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ "))")
                               | _ -> ("(" ^ (d_string "%a" d_binop op) ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ ")")
                         end

   | UnOp(op,e1,_) ->  ("(" ^ (d_string "%a" d_unop op) ^ " " ^ (getSExp e1) ^ ")")
                     

   | _ -> (d_string "%a" d_exp e)



(* function to get expression without dereference operator in case of pointers in conditions *)
let rec checkExp e : exp = 
   match e with
    | Lval(Mem(e1), NoOffset) -> checkExp e1
    | UnOp(op,e1,t) -> UnOp(op, checkExp e1,t)
    | BinOp(op, e1, e2, t) -> BinOp(op, checkExp e1, checkExp e2, t); 
    | _ -> e


(* Function to count number of times a pointer is dereferenced *)
let rec countRef e cnt  = 
  match e with
    | Lval(Mem(e1), NoOffset) -> countRef e1 (cnt+1)
    | UnOp(op,e1,t) -> countRef e1 cnt
    | BinOp(op, e1, e2, t) -> countRef e1 cnt; countRef e2 cnt
    | _ -> if cnt != 0 then
            let pre =  mkhashPtrupdatefxn (d_string "%a" d_exp e) cnt in
               hinstrns := !hinstrns @ [mkStmtOneInstr pre];
           E.log "Expression %a is referenced %d times \n" d_exp e cnt



(* Visitor *)
class pathSymbolVisitorClass (fdec : fundec) = object (self)
  inherit nopCilVisitor                        

 method vstmt (s : stmt) = begin
 let action s =
      match s.skind with

          | If(BinOp(op ,CastE( t1 , e1) ,CastE( t2 , CastE(t, e2)) , t3),tb,fb,l)-> 
             (*  E.log "\n\nthere2\n";
                    let rhs = (d_string "%a" d_exp (BinOp(op, e1, e2, t3))) in
                       let pre = mkifelsetermsfxn "IF" rhs in
                         let pre1 = mkifelsetermsfxn "ELSE" ("!" ^ rhs) in                   
                            let tblk = mkBlock ( mkStmtOneInstr pre :: tb.bstmts) in
                              let fblk = mkBlock ( mkStmtOneInstr pre1 :: fb.bstmts) in            
                                let nb = mkBlock [mkStmt (If(BinOp(op ,CastE(t1 , e1) ,CastE(t2 , e2) , t3), tblk ,fblk,l))] in
                       s.skind <- Block nb;*)
                 s

            
  
           | If(e,tb,fb,l)-> 
                       countRef e 0;
                            
                       let tblk = mkBlock ( List.append !hinstrns tb.bstmts) in
                        let fblk = mkBlock (List.append !hinstrns fb.bstmts) in            
                          let nb = mkBlock ([mkStmt (If (e, tblk , fblk,l))])  in
                                              s.skind <- Block nb;
                                              hinstrns := [];
                              s
                         
       | _ -> s
     in 
       ChangeDoChildrenPost(s,action)

    end 



   method vinst i = begin
    match i with
 
     | Set((Var vi, NoOffset), AddrOf(v) , loc) ->  
            
           let lhs = (d_string "%s" vi.vname) in
             let rhs = "addr##_" ^ (d_string "%a" d_lval v) in
              let pre1 = mkpinputtermsfxn rhs (d_string "%a" d_lval v) in
               let pre = mkhashinsertfxn lhs rhs [Lval(var vi)] in
                      ChangeTo [i ; pre; pre1]

     | Set(lv,CastE(TPtr(_, []), e) ,loc) ->

            let lhs = (d_string "%a" d_lval lv) in
             let rhs = "addr##_malloc"^lhs in
             (* let pre1 = mkpinputtermsfxn rhs (d_string "%a" d_lval v) in*)
               let pre = mkhashinsertfxn lhs rhs [(integer 0)] in
                      ChangeTo [i ; pre]

    
     |Set((Mem vi, NoOffset),  Const(CInt64(n, _, _)) , loc) ->
                
                  let lhs = (d_string "%a" d_exp vi) in
                     let rhs =  (i64_to_int n) in
                       let pre = mkhandlemallocfxn lhs "Constant"  rhs  in 
                             ChangeTo [i ; pre]


                 
    |Set((Var vi, NoOffset),  Const(CInt64(n, _, _)) , loc) ->
                
                  let lhs = (d_string "%s" vi.vname) in
                     let rhs =  (i64_to_int n) in
                       let pre = mkhashinsertfxn lhs lhs [(integer rhs)]  in 
                             ChangeTo [i ; pre]

    |Set(lv, Lval (Var vi, Index(e, NoOffset)), loc) -> 
                         ChangeTo [i]


    | Set(lv,CastE(TComp(_, []), e) ,loc) ->

            let lhs = (d_string "%a" d_lval lv) in
             let rhs = (d_string "%a" d_exp e) in
             (* let pre1 = mkpinputtermsfxn rhs (d_string "%a" d_lval v) in*)
               let pre = mkhashinsertfxn lhs rhs [(integer 0)] in
                      ChangeTo [i ; pre]


    |Set((Var vi, NoOffset), CastE(TComp(_, []), e1) , loc) ->

                  let rhs = (d_string "%a" d_exp e1) in
                  let lhs = (d_string "%s" vi.vname) in
                  let pre1 = mkPrint (d_string "value updated %%d \n") [Lval(var vi)] in

                if (String.rcontains_from rhs ((String.length rhs)-1) '.') then
                     ChangeTo [i]
                else
                   let pre = mkinputtermsfxn lhs rhs [Lval(var vi)]in 
                             ChangeTo [i ; pre1 ; pre]

     |Set((Var vi, NoOffset), Lval(lv) , loc) ->
       E.log "here\n";
         ( match lv with
           |(_,Field(_,_)) -> let pre = mkinputtermsfxn vi.vname vi.vname [Lval(var vi)]in 
                                         ChangeTo [i ; pre]
           |((Mem e), (Field(_,_))) ->  E.log"here1..\n";let pre = mkinputtermsfxn vi.vname vi.vname [Lval(var vi)]in 
                                         ChangeTo [i ; pre]

           | _ ->
                  E.log "HERE lval type = %a lval=%a\n" d_type (typeOfLval lv) d_lval lv;
                   
                  let rhs = getSExp (Lval(lv)) in
                  let lhs = (d_string "%s" vi.vname) in
                  let pre1 = mkPrint (d_string "value updated %%d \n") [Lval(var vi)] in

                if (String.rcontains_from rhs ((String.length rhs)-1) '.') then
                     ChangeTo [i]
                else
                   let pre = mkinputtermsfxn lhs rhs [Lval(var vi)]in 
                             ChangeTo [i ; pre1 ; pre])

              

     |Call(Some (Var vi, NoOffset), nm, _, _) ->
               let lhs = (d_string "%s" vi.vname) in
                 if (d_string "%a" d_exp nm)="malloc" then
                  begin
                      (*let pre = mkhashinsertfxn lhs "Function" [CastE(TInt(IInt,[]) ,Lval(var vi))] in *)
                             ChangeTo [i]
                 end
            
              else
                 begin
                      let pre = mkhashinsertfxn lhs "Function" [Lval(var vi)] in 
                             ChangeTo [i ; pre]
                 end

    | _ -> DoChildren
  end
     
end   
 

let pathSymbol (f: file) : unit =
  let fname = read_line () in
  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) when fdec.svar.vname = fname->              

   let pathSymbolVisitor = new pathSymbolVisitorClass fdec in
        ignore (visitCilFunction pathSymbolVisitor fdec)
                   

    | _ -> ()
  in
  Stats.time "pathSymbol" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
         f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "pathSymbol";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = pathSymbol;
    fd_post_check = true
  } 


