(* Feature is used to give levels to various
 * if expressions and create a tree by maintaining
 * parent child relation which depicts the path
 * condition obtained.
 *)

open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

(* Hash table for mapping expressions of conditional statement to level *)
let levelH : (int, int) Hashtbl.t = (Hashtbl.create 100)

(* Hash table for mapping child id to parent id *)
let parH : (int, int) Hashtbl.t = (Hashtbl.create 100)

let leftStmt = ref dummyStmt
let parentExp = ref ""
let parentId = ref 0
let save  = ref []
let testNesting = ref 0
let stmtlist : stmt list ref = ref []
let countif = ref 0
let aindex = ref 0
let function1 = ref "addToTree"
let function2 = ref "setBranchInfo"
let function3 = ref "setTrueExpr"
let function4 = ref "setFalseExpr"

(* Prototype for addToTree function *)
let makeaddtotreeFunction () : varinfo = 
  let v = makeGlobalVar
            !function1 
            (TFun(
                 voidType,
                 Some [
                     ("sid", intType, []);
                     ("level", intType, []);
                     ("texp", charPtrType,[]);
                     ("fexp", charPtrType, []);
                     ("pid", intType, []);
                     ("outcome", intType, [])
                   ],
                 true,
                 []
               )
            )
  in
  v

(* Returns call instruction to the addToTree function *)
let mkaddtotreefxn (sid: int) (level : int) (te : string) (fe : string) (pid : int) (outcome : int) : instr = 
  let i: varinfo = makeaddtotreeFunction () in 
  Call(None, Lval(var i), [integer sid; integer level; mkString te; mkString fe; integer pid; integer outcome], !currentLoc)

(* Prototype for setBranchInfo function *)
let makeSetBranchInfoFunction () : varinfo = 
  let v = makeGlobalVar
            !function2
            (TFun(
                 voidType,
                 Some [
                     ("sid", intType, []);
                     ("tblock", intType, []);
                     ("fblock", intType, [])
                   ],
                 true,
                 []
               )
            )
  in
  v

(* Returns call instruction to the setBranchInfo function *)
let mksetBranchInfofxn (sid: int) (tblock : int) (fblock : int) : instr = 
  let i: varinfo = makeSetBranchInfoFunction () in 
  Call(None, Lval(var i), [integer sid; integer tblock; integer fblock], !currentLoc)

(* Prototype for setTrueExpr function *)
let makeSetTrueExprFunction () : varinfo = 
  let v = makeGlobalVar
            !function3
            (TFun(
                 voidType,
                 Some [
                     ("sid", intType, []);
                     ("expr", charPtrType, [])
                   ],
                 true,
                 []
               )
            )
  in
  v

(* Returns call instruction to the setTrueExpr function *)    
let mksetTrueExprfxn (sid: int) (e : string) : instr = 
  let i: varinfo = makeSetTrueExprFunction () in 
  Call(None, Lval(var i), [integer sid; mkString e], !currentLoc)

(* Prototype for setFalseExpr function *)
let makeSetFalseExprFunction () : varinfo = 
  let v = makeGlobalVar
            !function4
            (TFun(
                 voidType,
                 Some [
                     ("sid", intType, []);
                     ("expr", charPtrType, [])
                   ],
                 true,
                 []
               )
            )
  in
  v

(* Returns call instruction to the setFalseExpr function *)        
let mksetFalseExprfxn (sid: int) (e : string) : instr = 
  let i: varinfo = makeSetFalseExprFunction () in 
  Call(None, Lval(var i), [integer sid; mkString e], !currentLoc)

(* Prototype for getConditionalOutcome function *)
let makeConditionalOutcomeFunction () : varinfo = 
  let v = makeGlobalVar
            "getConditionalOutcome"
            (TFun(
                 voidType,
                 Some [
                     ("sid", intType, []);
                     ("expr", intType, [])
                   ],
                 true,
                 []
               )
            )
  in
  v
    
(* Returns call instruction to the getConditionalOutcome function *)        
let mkOutcomefxn (sid: int) (e : exp) (vi: varinfo) : instr = 
  let i: varinfo = makeConditionalOutcomeFunction () in 
  Call(Some (Var vi, NoOffset), Lval(var i), [integer sid; e], !currentLoc)

(* Prototype for addEntryToVariableTable function *)
let makeAddEntryToVariableTableFunction () : varinfo = 
  let v = makeGlobalVar
            "addEntryToVariableTable"
            (TFun(
                 voidType,
                 Some [
                     ("vname", charPtrType, []);
                     ("parameter", intType, [])
                   ],
                 true,
                 []
               )
            )
  in
  v

(* Returns call instruction to the addEntryToVariableTable function *)            
let mkVariableTablefxn (vname: string) (parameter : exp) : instr = 
  let i: varinfo = makeAddEntryToVariableTableFunction () in 
  Call(None, Lval(var i), [mkString vname; parameter], !currentLoc)

(* prototype for add_entryToArraySTable() *)
let makeArraySTableEntryFunction () : varinfo = 
  let v = makeGlobalVar
            "add_entryToArraySTable" 
            (TFun(
                 voidType,
                 Some [
                     ("s1", charConstPtrType, []);
                     ("index", intType, []);
                     ("s2", charConstPtrType, []);
                     ("val", voidPtrType, []);
                     ("address", voidPtrType, []);
                     ("type", intType, []);
                   ],
                 true,
                 []
               )
            )
  in
  v

(* Returns call instruction to the add_entryToArraySTable function *)            
let mkArrayStableEntryfxn (s1 : string) (e1: exp) (s2 : string) (e : exp) (t : int) : instr = 
  let i: varinfo = makeArraySTableEntryFunction () in 
  Call(None, Lval(var i), [mkString s1; e1; mkString s2; e; e; integer t] , !currentLoc)

(* prototype for   delete_allVariableTableEntry() *)
let makeDelVariabeTableFunction () : varinfo = 
  let v = makeGlobalVar
            "delete_allVariableTableEntry" 
            (TFun(
                 voidType,
                 Some [],
                 true,
                 []
               )
            )
  in
  v

(* Returns call instruction to the delete_allVariableTableEntry function *)            
let mkdelVtablefxn () : instr = 
  let i: varinfo = makeDelVariabeTableFunction () in 
  Call(None, Lval(var i), [] , !currentLoc)

let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 

let v2e (v : varinfo) : exp = Lval(var v)

(* counts number of references in pointer *)
let rec countRef e cnt  = 
  match e with
  | Lval(Mem(e1), NoOffset) -> countRef e1 (cnt+1)
  | UnOp(op,e1,t) -> countRef e1 cnt
  | BinOp(op, e1, e2, t) -> countRef e1 cnt; countRef e2 cnt
  | _ -> cnt

(* Expressions contains pointers/arrays *)
let rec checkExp e = 
  match e with
  | Lval(Mem(e1), NoOffset) -> 
     begin
       match e1 with
       | BinOp(op,e2,e3,t) ->
          let call = mkVariableTablefxn (d_string "%a" d_exp e) e3
          in
          let call1 = mkArrayStableEntryfxn (d_string "%a" d_exp e2) e3 ((d_string "%a" d_exp e2) ^ "1" ^ (d_string "%d" !aindex)) e1 1
          in
          stmtlist := !stmtlist @ [mkStmtOneInstr call; mkStmtOneInstr call1];
          aindex := !aindex + 1

       | _ ->      
          let call = mkVariableTablefxn (d_string "%a" d_exp e) (integer 0)
          in
          let call1 = mkArrayStableEntryfxn (d_string "%a" d_exp e1) (integer 0) ((d_string "%a" d_exp e1) ^ "1" ^ (d_string "%d" !aindex)) e1 1
          in
          stmtlist := !stmtlist @ [mkStmtOneInstr call; mkStmtOneInstr call1];
          aindex := !aindex + 1
     end

  | Lval((Var v), (Index(e1, NoOffset))) ->  
     let call = mkVariableTablefxn (d_string "%a" d_exp e) e1
     in
     let call1 = mkArrayStableEntryfxn v.vname e1 (v.vname ^ "1" ^ (d_string "%d" !aindex)) (AddrOf((Var v), (Index(e1, NoOffset)))) 1
     in
     stmtlist := !stmtlist @ [mkStmtOneInstr call; mkStmtOneInstr call1];
     aindex := !aindex + 1;

  | UnOp(op,e1,t) -> checkExp e1
  | BinOp(op, e1, e2, t) -> checkExp e1; checkExp e2 
  | _ -> ()

(* function to check if there is nested conditional statement*)
let rec testing (s:stmt) : unit = 
  match s.skind with
  | If(e,tb,fb,l) -> testNesting := 1
  | Block(b) -> List.iter (fun a -> testing a) b.bstmts
  | _ -> ()

(* level the nested if structure and add parent for each if statement*)
let rec fixStmt (s:stmt) (st:string) : unit = 
  match s.skind with
  | If(BinOp(op ,CastE( t1 , e1) ,CastE( t2 , CastE(t, e2)) , t3),tb,fb,l)-> 
     Hashtbl.add levelH s.sid ((Hashtbl.find levelH !parentId) + 1);
     Hashtbl.add parH s.sid !parentId;
     List.iter testing tb.bstmts;
     List.iter testing fb.bstmts;

     (* if contains nested if statements then save this statement to explore its child later*)
     if !testNesting==1 then 
       (save := !save @ [s]; testNesting := 0)

  | If(BinOp(op ,CastE( t1 , e1) ,e2 , t3),tb,fb,l)-> 
     Hashtbl.add levelH s.sid ((Hashtbl.find levelH !parentId) + 1);
     Hashtbl.add parH s.sid !parentId;
     List.iter testing tb.bstmts;
     List.iter testing fb.bstmts;

     (* if contains nested if statements then save this statement to explore its child later*)
     if !testNesting==1 then 
       ( save := !save @ [s]; testNesting := 0)

  | If(e,tb,fb,l) ->
     Hashtbl.add levelH s.sid ((Hashtbl.find levelH !parentId) + 1);
     Hashtbl.add parH s.sid !parentId;
     (*E.log " Added entry for key %d, level %d\n" s.sid (Hashtbl.find levelH s.sid);*)
     testNesting := 0;
     List.iter testing tb.bstmts;
     List.iter testing fb.bstmts;
     if !testNesting==1 then
       ( save := !save @ [s]; testNesting := 0; )

  | Block(b) ->  List.iter (fun v -> fixStmt v st )b.bstmts;

  | _ -> ()


(* check for nesting by traversing true block and false block *)
let rec level_structFixStmt (s : stmt) : unit = 
  match s.skind with
  | If(BinOp(op ,CastE( t1 , e1) ,CastE( t2 , CastE(t, e2)) , t3),tb,fb,l)->  
     parentId := s.sid;
     level_structFixBlock tb "If";
     parentId := s.sid;
     level_structFixBlock fb "Else"; 


  | If(BinOp(op ,CastE( t1 , e1) ,e2 , t3),tb,fb,l)-> 
     parentId := s.sid;
     level_structFixBlock tb "If";
     parentId := s.sid;
     level_structFixBlock fb "Else"; 


  | If(e,tb,fb,l) ->
     parentId := s.sid;
     level_structFixBlock tb "If";
     parentId := s.sid;
     level_structFixBlock fb "Else";

  | Block(b) ->  List.iter (fun v -> level_structFixStmt v) b.bstmts; 

  | _ -> ()

and level_structFixBlock (b : block) (s:string) : unit = 
  List.iter (
      fun v->
      match v.skind with
      |Block(blk) -> List.iter (
                         fun a ->
                         fixStmt a s
                       ) blk.bstmts
      | _ ->    fixStmt v s 
    ) b.bstmts;
  
  (* Explore the "if" structures that are nested *)     
  if((List.length !save) > 1) then
    begin
      leftStmt := List.hd !save;
      save := List.tl !save; 
      level_structFixStmt !leftStmt 
    end;

  if((List.length !save) == 1) then
    begin
      leftStmt := List.hd !save;
      save := [];
      level_structFixStmt !leftStmt 
    end

(* for each statement in the function *)
let rec level_structFixFunction (s : stmt) : unit = 
  match s.skind with
  | If(BinOp(op ,CastE( t1 , e1) ,CastE( t2 , CastE(t, e2)) , t3),tb,fb,l)->                    
     Hashtbl.add levelH s.sid 1; 
     Hashtbl.add parH s.sid 0; 
     E.log "Added entry for key %d, level %d\n" s.sid (Hashtbl.find levelH s.sid);
     level_structFixStmt s

  | If(BinOp(op ,CastE( t1 , e1) ,e2 , t3),tb,fb,l)-> 
     Hashtbl.add levelH s.sid 1; 
     Hashtbl.add parH s.sid 0; 
     E.log "Added entry for key %d, level %d\n" s.sid (Hashtbl.find levelH s.sid);
     level_structFixStmt s

  | If(e,tb,fb,l) ->
     Hashtbl.add levelH s.sid 1; 
     Hashtbl.add parH s.sid 0; 
     E.log "Added entry for key %d, level %d\n" s.sid (Hashtbl.find levelH s.sid);
     level_structFixStmt s

  | Block(b) ->  List.iter (fun v -> level_structFixFunction v ) b.bstmts;

  | _ -> ()


(* Function to convert infix expressions in to S-Expression format *)
let rec getSExp (e : exp)  = 
  match e with
  | BinOp(op,e1,e2,l) ->
     begin
       match op with
       | Eq -> ("(=" ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ ")")
       | Ne -> ("(not (=" ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ "))")
       | _ -> ("(" ^ (d_string "%a" d_binop op) ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ ")")
     end

  | UnOp(LNot,e1,_) -> ("(" ^ "not" ^ " " ^ (getSExp e1) ^ ")")

  | UnOp(op,e1,_) ->  ("(" ^ (d_string "%a" d_unop op) ^ " " ^ (getSExp e1) ^ ")")

  | CastE(t, e1) -> getSExp e1                     

  | _ -> (d_string "%a" d_exp e)


let getFalseExpr (e : exp) =
  match e with
  | UnOp(LNot,e1,_) -> e1
  | _ -> UnOp(LNot, e, intType)

(* Visitor to instrument function calls *)
class level_structVisitor e_vi o_vi = object
  inherit nopCilVisitor                        

  method vstmt (s : stmt) =
    begin
      let action s =
        match s.skind with
        | If(e,tb,fb,l)-> 
           stmtlist := [];
           checkExp e;
           let ass1 = mkStmtOneInstr (Set((Var e_vi,NoOffset), e ,locUnknown)) in
           let ass2 = mkStmtOneInstr (mkOutcomefxn s.sid (v2e e_vi) o_vi) in
           let pre = mkaddtotreefxn s.sid (Hashtbl.find levelH s.sid) (getSExp e) (getSExp (getFalseExpr e)) (Hashtbl.find parH s.sid) 1 in
           let pre1 = mkaddtotreefxn s.sid (Hashtbl.find levelH s.sid) (getSExp e) (getSExp (getFalseExpr e)) (Hashtbl.find parH s.sid) 0 in
           let pre2 = mksetBranchInfofxn s.sid 1 0 in
           let pre3 = mksetBranchInfofxn s.sid 0 1 in
           let pre4 = mksetFalseExprfxn s.sid (getSExp (getFalseExpr e)) in
           let pre5 = mksetTrueExprfxn s.sid (getSExp e) in
           tb.bstmts <- !stmtlist @ (mkStmtOneInstr pre2 :: mkStmtOneInstr pre5 :: mkStmtOneInstr pre4 :: mkStmtOneInstr pre :: mkStmtOneInstr (mkdelVtablefxn ()) :: tb.bstmts);
           fb.bstmts <-  !stmtlist @(mkStmtOneInstr pre3 :: mkStmtOneInstr pre5 :: mkStmtOneInstr pre4 :: mkStmtOneInstr pre1 :: mkStmtOneInstr (mkdelVtablefxn ()) :: fb.bstmts);          
           let nb = mkBlock ([ass1; ass2; mkStmt (If ((v2e o_vi), tb , fb,l))])  in
           s.skind <- Block nb;
           countif := !countif+1;
           s    

        | _ -> s

      in 
      ChangeDoChildrenPost(s,action)
    end
end

let level_struct (f:file) : unit = 
  let funName = !Param.func in
  List.iter (fun g ->
             match g with
             |GFun (fd, loc) when fd.svar.vname=funName-> 
               List.iter level_structFixFunction fd.sbody.bstmts;
               let exp_outcome =  makeLocalVar fd "exp_outcome" intType in   
               let overall_outcome = makeLocalVar fd "overall_outcome" intType in
               let level_structVisitor = new level_structVisitor exp_outcome overall_outcome in
               ignore (visitCilFunction level_structVisitor fd)
                      
             | _ -> ()) f.globals
            
let feature : featureDescr = {
  fd_name = "level_struct";
  fd_enabled = ref false;
  fd_description = "";
  fd_extraopt = [];
  fd_doit = level_struct;
  fd_post_check = true
} 

