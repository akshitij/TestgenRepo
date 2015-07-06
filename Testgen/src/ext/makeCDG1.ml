(* Feature to construct Control Dependency graph using reverse CFG and Post dominator relationship *)
open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let out_file = "CDG.dot"

(* Hashtables are used to determine the true/false side of parent node X , Y needs to be added *)
let labelToBlock : (label list, block) Hashtbl.t = (Hashtbl.create 500)
let edges : ((int * int), int) Hashtbl.t = (Hashtbl.create 500)

let stmtlist : stmt list ref = ref []
let predStmt : stmt list ref = ref []
let domStmt : stmt list ref = ref []
let flag = ref 0
let trueFalseFlag = ref 1
let outcome = ref 1
let printFunctionName = ref "printf"
let addProto = ref false

let v2e (v : varinfo) : exp = Lval(var v)

let printf: varinfo option ref = ref None
                                     
let makePrintfFunction () : varinfo = 
  match !printf with 
    Some v -> v
  | None ->
     begin 
       let v = makeGlobalVar
                 !printFunctionName 
                 ( TFun(
                       voidType,
                       Some [("format", charPtrType, [])],
                       true,
                       []
                     )
                 )
       in
       printf := Some v;
       addProto := true;
       v
     end

let mkPrint (format: string) (args: exp list) : instr = 
  let p: varinfo = makePrintfFunction () in 
  Call(None, Lval(var p), (mkString format) :: args, !currentLoc)

let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 

let currentFunc: string ref = ref ""

(* Protoype for addtoCDGnode function *)
let makeaddCDGFunction () : varinfo = 
  let v = makeGlobalVar
            "addtoCDGnode"
            ( TFun (
                  voidType,
                  Some [("id", intType, []);
                        ("pid",intType, []);
                        ("branch", intType, [])
                       ],
                  true,
                  []
                )
            )
  in
  v
(* Return call to function to add a CDG Node *)
let mkaddCDGfxn (id: int) (pid : int) (branch : int) : instr = 
  let i: varinfo = makeaddCDGFunction () in 
  Call(None, Lval(var i), [integer id; integer pid; integer branch], !currentLoc)

(* Prototype for adding predicate expression of a conditional statement
   in array of statement id and char pointer
*)
let makesetArrayFunction () : varinfo = 
  let v = makeGlobalVar
            "setArray"
            (TFun (
                 voidType,
                 Some [("id", intType, []);
                       ("expr", charPtrType, [])
                      ],
                 true,
                 []
               )
            )
  in
  v

(* Return call to above function *)
let mksetarrayfxn (id: int) (expr : string) : instr = 
  let i: varinfo = makesetArrayFunction () in 
  Call(None, Lval(var i), [integer id; mkString expr], !currentLoc)

(* Expressions without array indexes *)
let rec checkExpForArray e : exp = 
  match e with
  | Lval((Var v), (Index(e, NoOffset))) -> 
     let s = makeVarinfo true (v.vname ^ "_" ^ (d_string "%a" d_exp e)) v.vtype
     in
     (v2e s)
  | UnOp(op,e1,t) -> UnOp(op, checkExpForArray e1,t)
  | BinOp(op, e1, e2, t) -> BinOp(op, checkExpForArray e1, checkExpForArray e2, t); 
  | _ -> e

(* Function to get S expressions from infix expressions  *)
let rec getSExp (e : exp)  = 
  match e with
  | BinOp(op,e1,e2,l) ->
     begin
       match op with
       |Eq -> ("(=" ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ ")")
       |Ne -> ("(! (=" ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ "))")
       | _ -> ("(" ^ (d_string "%a" d_binop op) ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ ")")
     end

  | UnOp(op,e1,_) ->  ("(" ^ (d_string "%a" d_unop op) ^ " " ^ (getSExp e1) ^ ")")

  | _ -> (d_string "%a" d_exp e)

(* function to check body of IF statement if there is any Return statement *)
let rec chkForReturn (v: stmt) =
  match v.skind with
  |If(e, tb, fb, l) ->
    List.iter (fun a -> chkForReturn a) tb.bstmts;
    List.iter (fun a -> chkForReturn a) fb.bstmts

  |Block(b) ->
    List.iter (fun a -> chkForReturn a) b.bstmts

  |Return(_) -> trueFalseFlag := 1

  |Goto(s , _) ->
    let blk = Hashtbl.find labelToBlock !s.labels in
    List.iter (fun a -> chkForReturn a) blk.bstmts

  |_ -> ()

(* Function to check if statement X is a direct child of statement Y *)
let rec checkForChild (v: stmt) (id: int) (iftrue: int) (iffalse: int) =
  match v.skind with
  |If(e, tb, fb, l) ->
    List.iter (
        fun a ->
        if a.sid=id then
          (flag:=1; outcome:=1);
        checkForChild a id 1 0) tb.bstmts;
    List.iter (
        fun a ->
        if a.sid=id then
          (flag:=1; outcome:=0);
        checkForChild a id 0 1) fb.bstmts
              
  |Block(b) -> List.iter (
                   fun a ->
                   if a.sid=id then
                     (   flag:=1;
                         if iftrue=1 && iffalse=0 then
                           outcome:=1
                         else if iftrue=0 && iffalse=1 then
                           outcome:=0; );
                   checkForChild a id iftrue iffalse
                 ) b.bstmts;

  |Goto(s,_) ->
    let blk = Hashtbl.find labelToBlock !s.labels in
    List.iter (
        fun a ->
        if a.sid=id then
          (   flag:=1;
              if iftrue=1 && iffalse=0 then
                outcome:=1
              else if iftrue=0 && iffalse=1 then
                outcome:=0; );
        checkForChild a id iftrue iffalse
      ) blk.bstmts

  |_ -> ()

(* Add entries to the hashtable (labels -> block) *)
class makeCDGVisitorClass (fdec : fundec) = object
  inherit nopCilVisitor                        
            
  method vblock (b : block) = begin

      List.iter (
          fun s ->
          if (List.length s.labels)>0 then
            Hashtbl.add labelToBlock s.labels b
          else
            ()
        ) b.bstmts;
      
      DoChildren

    end
end

(* Checks if s2 is substring of s1 *)
let contains s1 s2 =
  let re = Str.regexp_string s2
  in
  try ignore (Str.search_forward re s1 0); true
  with Not_found -> false

(* Checks if the given statement is already marked with dummyLabel *)
let isMarked s =
  List.exists (
    fun x ->
      match x with
      | Label(name, l, b)
          when contains name "dummyLabel" -> true
      | _ -> false
  ) s.labels


(* Protoype for isCopyOf function *)
let isCopyOfCall (copysid: int) (orgsid : int) : instr = 
  let v = makeGlobalVar
            "isCopyOf"
            ( TFun (
                  voidType,
                  Some [("copysid", intType, []);
                        ("orgsid", intType, [])
                       ],
                  true,
                  []
                )
            )
  in 
  Call(None, Lval(var v), [integer copysid; integer orgsid], !currentLoc)

(* Protoype for SID initializer function *)
let initSIDCall = 
  let v = makeGlobalVar
            "initSID"
            ( TFun (
                  voidType,
                  Some [],
                  true,
                  []
                )
            )
  in 
  Call(None, Lval(var v), [], !currentLoc)

(* Collects the SIDs of the statements which are the copies of each other *)
let collateCopies stmts =
  let copies = Hashtbl.create 300
  in 
  List.iter (
    fun s ->
      match s.skind with
      | If(e, _, _, _) ->
        s.labels <- List.filter (
          fun l ->
            match l with
            | Label ( name, loc, b ) ->
              begin
                try
                  if ( true = contains name "dummyLabel") then
                    let copyList = Hashtbl.find copies name
                    in
                    Hashtbl.replace copies name (copyList @ [s.sid]);
                    false
                  else
                    true
                with Not_found ->
                  Hashtbl.add copies name [s.sid];
                  false
                | _ -> false
              end
            | _ -> false
        ) s.labels;
        ()
      | _ -> ()
  ) stmts;
  copies


let isCopyOfCallList c =
  let callList = ref []
  in
  Hashtbl.iter (
    fun label copyList->
      let orgsid = List.hd copyList
      in
      List.iter (
        fun sid ->
          callList := !callList @ [mkStmtOneInstr (isCopyOfCall sid orgsid)]
      ) copyList;
  ) c;
  mkBlock !callList

let insertIsCopyOfHolder c f funName=
  let fn = emptyFunction "isCopyOfHolder"
  in
  fn.sbody <- isCopyOfCallList c;

  f.globals <- List.concat (
    List.map (fun g -> match g with
    | GFun(fdec, _) when fdec.svar.vname = funName ->
      GFun(fn, locUnknown) :: [g]
    | GFun(fdec, _) when fdec.svar.vname = "main" ->
      fdec.sbody.bstmts <-  [mkStmtOneInstr( Call(None, Lval(var fn.svar), [], !currentLoc))] @ fdec.sbody.bstmts; 
      fdec.sbody.bstmts <-  [mkStmtOneInstr initSIDCall] @ fdec.sbody.bstmts;   
      [g]
    | _ -> [g]
    ) f.globals);
  ()

let makeCDG (f: file) : unit =
  let oc = open_out out_file in
  let fname = !Param.func in

  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
       if !printf = None then
         printf := Some v

    | GFun (fdec, loc) when fdec.svar.vname=fname ->

       ignore(Cfg.clearCFGinfo fdec);
       fdec.sbody.bstmts <- fdec.sbody.bstmts @ [dummyStmt];

       (* Create control flow graph *)
       ignore(Cfg.cfgFun fdec);

       (* Reverse edges of CFG *)
       List.iter (
           fun v ->
           let temp = v.preds in
           v.preds <- v.succs;
           v.succs <- temp
         ) fdec.sallstmts;

       (* Add a dummy node which will act as the entry point for the revese cfg *)
       let dummy = List.hd (List.rev fdec.sallstmts) in
       let x = List.concat (
                   List.map (
                       fun v ->
                       match v.skind with
                       |Return(_) -> v.preds <- [dummy]; [v]
                       | _ -> []
                     ) fdec.sallstmts
                 )
       in
       dummy.succs <- x; 

       (* Populate labels -> block hashtable *)
       let makeCDGVisitor = new makeCDGVisitorClass fdec in
       ignore (visitCilFunction makeCDGVisitor fdec) ;

       (* Reversing the statements *)
       fdec.sbody.bstmts <- List.rev fdec.sbody.bstmts;

       fprintf oc "%s\n" "digraph CDG {"; 

       (* Get post dominator relationship i.e. forward dominator on reverse cfg *)
       let ipdom,tree = Dominators.computeDomTree ~doCFG:false fdec in
       
       List.iter (
           fun v ->
           let temp = v.preds in
           v.preds <- v.succs;
           v.succs <- temp
         ) fdec.sallstmts;

       let s = List.hd fdec.sallstmts in
       (match s.skind with 
        |If(e,tb,fb,l) ->
          fprintf oc "%s\n" ((d_string "%d " s.sid)^"[shape=diamond, color=red]");
          stmtlist :=  [mkStmtOneInstr (mksetarrayfxn s.sid (getSExp (checkExpForArray e)))];()
                                                                                               
        |_ ->()
       );            
       fprintf oc "%s\n" ("ENTRY -> 1");

       stmtlist := [mkStmtOneInstr (mkaddCDGfxn 0 0 0); mkStmtOneInstr (mkaddCDGfxn 1 0 1)] @ !stmtlist;
       
       List.iter (
           fun v -> 
           List.iter (
               fun a ->
               (* E.log "v = %d, a = %d\n" v.sid a.sid; *)
               
               match a.skind with
               |If(e,tb,fb,l) ->

                 fprintf oc "%s\n" ((d_string "%d " a.sid)^"[shape=diamond, color=red]");
                 
                 if (Dominators.dominates ipdom a v) then
                   ( 
                     predStmt := a.preds;
                     flag := 0;

                     while (List.length !predStmt)>0 && (Dominators.dominates ipdom a (List.hd !predStmt)) do
                       let x = List.hd !predStmt in
                       predStmt :=  x.preds @ (List.tl !predStmt) ;
                     done;

                     if (List.length !predStmt)=0 && (not(Hashtbl.mem edges (0,a.sid)))  then
                       (fprintf oc "%s\n" ("ENTRY -> " ^ (d_string "%d" a.sid));
                        Hashtbl.add edges (0, a.sid);
                        stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid 0 1)];
                        stmtlist := !stmtlist @ [mkStmtOneInstr (mksetarrayfxn a.sid (getSExp (checkExpForArray e)))];
                        predStmt := [];) ;
                     
                     if (List.length !predStmt)>0 && (not(Hashtbl.mem edges ((List.hd !predStmt).sid, a.sid))) then
                       (let y = List.hd !predStmt in
                        fprintf oc "%s\n" ((d_string "%d" y.sid)  ^ "-> " ^ (d_string "%d" a.sid));
                        trueFalseFlag := 0;
                        flag:=0;
                        outcome := 1;
                        let res=( match y.skind with
                                  |If(e1,tb1,fb2,l) ->
                                    List.iter (fun z -> chkForReturn z) tb1.bstmts;
                                    if !trueFalseFlag=0 then
                                      (List.iter (fun z -> chkForReturn z) fb2.bstmts;
                                       if !trueFalseFlag=1 then 1
                                       else 0
                                      )
                                    else 0
                                  | _ -> 1
                                )
                        in
                        checkForChild y a.sid 0 0;
                        (* E.log "1. v=%d, a=%d, res=%d, flag=%d outcome=%d \n" y.sid a.sid res !flag !outcome;  *)
                        if !flag=0 then  
                          stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid y.sid res)]
                        else if !flag=1 then
                          stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid y.sid !outcome)]
                        else
                          stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid y.sid res)];
                        Hashtbl.add edges (y.sid, a.sid);
                        stmtlist := !stmtlist @ [mkStmtOneInstr (mksetarrayfxn a.sid (getSExp (checkExpForArray e)))];
                        predStmt := [];)
                         
                   )                                               
                 else if (not(Hashtbl.mem edges (v.sid ,a.sid))) then                                          
                   (fprintf oc "%s\n" ((d_string "%d" v.sid)  ^ "-> " ^ (d_string "%d" a.sid));
                    trueFalseFlag := 0;
                    flag:=0;
                    outcome:=1;
                    let res=( match v.skind with
                              |If(e1,tb1,fb2,l) ->
                                List.iter (fun z -> chkForReturn z) tb1.bstmts;
                                if !trueFalseFlag=0 then
                                  (List.iter (fun z -> chkForReturn z) fb2.bstmts;
                                   if !trueFalseFlag=1 then 1
                                   else 0
                                  )
                                else 0
                              | _ -> 1) in


                    checkForChild v a.sid 0 0;
                    (* E.log "2. v=%d, a=%d, res=%d, flag=%d outcome=%d\n" v.sid a.sid res !flag !outcome; *)
                    Hashtbl.add edges (v.sid, a.sid);
                    if !flag=0 then  
                      stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid v.sid res)]
                    else if !flag=1 then
                      stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid v.sid !outcome)]
                    else
                      stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid v.sid res)];

                    stmtlist := !stmtlist @ [mkStmtOneInstr (mksetarrayfxn a.sid (getSExp (checkExpForArray e)))];
                    predStmt := [];)
                     

               | _ ->  
                  if (Dominators.dominates ipdom a v) then
                    ( 
                      predStmt := a.preds;
                      while (List.length !predStmt)>0 && (Dominators.dominates ipdom a (List.hd !predStmt)) do 
                        let x = List.hd !predStmt in
                        predStmt :=  x.preds @(List.tl !predStmt)
                      done;

                      if (List.length !predStmt)=0 && (not(Hashtbl.mem edges (0,a.sid)))then
                        (fprintf oc "%s\n" ("ENTRY -> " ^ (d_string "%d" a.sid));
                         Hashtbl.add edges (0, a.sid);
                         stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid 0 1)];
                         predStmt := [];) ;
                      
                      if (List.length !predStmt)>0 && (not(Hashtbl.mem edges ((List.hd !predStmt).sid ,a.sid)))then
                        (let y = List.hd !predStmt in
                         fprintf oc "%s\n" ((d_string "%d" y.sid)  ^ "-> " ^ (d_string "%d" a.sid));

                         trueFalseFlag := 0;
                         flag := 0;
                         outcome := 1;
                         let res=( match y.skind with
                                   |If(e1,tb1,fb2,l) ->
                                     List.iter (fun z -> chkForReturn z) tb1.bstmts;
                                     if !trueFalseFlag=0 then
                                       (List.iter (fun z -> chkForReturn z) fb2.bstmts;
                                        if !trueFalseFlag=1 then 1
                                        else 0
                                       )
                                     else 0
                                   | _ -> 1)
                         in
                         checkForChild y a.sid 0 0;
                         
                         if !flag=0  then 
                           stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid y.sid res)]
                         else if !flag=1 then
                           stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid y.sid !outcome)]
                         else
                           stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid y.sid res)];
                         Hashtbl.add edges (y.sid, a.sid);
                         predStmt := [];) 
                          
                    )                                               
                  else if (not(Hashtbl.mem edges (v.sid ,a.sid))) then                                            
                    (fprintf oc "%s\n" ((d_string "%d" v.sid)  ^ "-> " ^ (d_string "%d" a.sid));
                     trueFalseFlag := 0;
                     flag:=0;
                     outcome:=0;
                     let res=( match v.skind with
                               |If(e1,tb1,fb2,l) ->
                                 List.iter (fun z -> chkForReturn z) tb1.bstmts;
                                 if !trueFalseFlag=0 then
                                   (List.iter (fun z -> chkForReturn z) fb2.bstmts;
                                    if !trueFalseFlag=1 then 1
                                    else 0
                                   )
                                 else 0
                               | _ -> 1) in


                     checkForChild v a.sid 0 0;
                     if !flag=0  then  
                       stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid v.sid res)]
                     else if !flag=1 then
                       stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid v.sid !outcome)]
                     else
                       stmtlist := !stmtlist @ [mkStmtOneInstr (mkaddCDGfxn a.sid v.sid res)];
                     Hashtbl.add edges (v.sid, a.sid);
                     predStmt := [];) 
             ) v.succs;
           
         ) fdec.sallstmts;

       fprintf oc "%s\n" "}\n"; 
       close_out oc;
       fdec.sbody.bstmts <- (List.rev (List.tl fdec.sbody.bstmts))

    | _ -> ()
  in
  Stats.time "makeCDG" (iterGlobals f) doGlobal;
  let fd = (emptyFunction "createCDG")
  in
  f.globals <-  List.concat (
    List.map (
      fun g -> match g with
      |GFun(fdec,_) when fdec.svar.vname = fname ->
        GFun(fd, locUnknown) :: [g]
      | _ -> [g]
        
    ) f.globals) ;
  fd.sbody  <- mkBlock !stmtlist;
  let doGlobal2 = function
    | GFun (fdec, loc) ->
       if fdec.svar.vname = fname then
         begin
           let copies = collateCopies fdec.sallstmts in  
           insertIsCopyOfHolder copies f fname;                  
           ()
         end   

    | _ -> ()
  in
  Stats.time "loopUnroll" (iterGlobals f) doGlobal2

let feature : featureDescr = {
  fd_name = "makeCDG";
  fd_enabled = ref false;
  fd_description = "";
  fd_extraopt = [];
  fd_doit = makeCDG;
  fd_post_check = true
} 
  

