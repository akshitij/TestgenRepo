(* doype feature is used to find all the symbolic 
 * variables that is , variables for which we need to 
 * generate test case values. These variables are either
 * function arguments, user inputs etc.
 *)

open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let helperFiles = ["src/src/utils.c"; "src/src/sidTable.c"; "src/src/sidTable.h"; "src/src/directAndSolve.c"; "src/src/directAndSolve.h"; "src/src/symbolicExec.c"; "src/src/symbolicExec.h"; "src/src/queue.c"; "src/src/queue.h"; "src/src/levelTree.c"; "src/src/levelTree.h"; "src/src/stringTokenize.c"; "src/src/stringTokenize.h"; "src/src/arrayAndPointersSymbolicExec.c"; "src/src/arrayAndPointersSymbolicExec.h"; "src/src/updateIntegerValues.c"; "src/src/updateIntegerValues.h"; "src/src/flatds.c"; "src/src/flatds.h"; "src/src/cdg.c"; "src/src/cdg.h"; "src/src/cdgWrapper.c"; "src/src/ipaRecursive.c" ; "src/src/stack.c"; "src/src/stack.h"]

let cnt_vars = ref 0

let input_vars : varinfo list ref = ref []
let localVars_left : varinfo list ref = ref []
let st_list : instr list ref = ref []
let save_local : varinfo list ref = ref []
let filist : fieldinfo list ref = ref []
let slist : fieldinfo list ref = ref []
let funcn : varinfo list ref = ref []
let formals : exp list ref = ref []
let replce : string list ref = ref []
let countUnroll = ref (-1)
let vindex: varinfo option ref = ref None
let varray: varinfo option ref = ref None
let vstruct : varinfo option ref = ref None
let vars : varinfo list ref = ref [] 
let vlhs : lval list ref = ref []
let fi : fieldinfo list ref = ref []
let globals : varinfo list ref = ref []
let printf: varinfo option ref = ref None

(* Switches *)

let randomFunctionName = ref "rand"
let printFunctionName = ref "printf"
let mallocFunctionName = ref "malloc"
let strcmpFunctionName = ref "strcmp"
let addEntryToSymbolTable = ref "add_entryToSTable"
let deleteSTable = ref "delete_allSTableEntry"
let enqueuefxn = ref "enQueue"

let addProto = ref false
let addProto1 = ref false
let addProto2 = ref false
let addProto3 = ref false


(* function for varinfo -> exp *)
let v2e (v : varinfo) : exp = Lval(var v)

(* prototype for Printf function *)
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

(* prototype for custom Printf function *)
let printfFun: fundec =
  let fdec = emptyFunction "printf" in
  fdec.svar.vtype <-
     TFun(intType, Some [ ("format", charPtrType, [])], true, []);
  fdec

let doPrintf format args =
  mkStmtOneInstr (
    Call(
      None,
      Lval(var printfFun.svar),
      (Const(CStr format)) :: args,
      locUnknown
    )
  )

let printTestCaseFun: fundec =
  let fdec = emptyFunction "printTestCase" in
  fdec.svar.vtype <-
    TFun(voidType, Some [ ("filename", charPtrType, []); ("testcase", charPtrType, [])], true, []);
  fdec

let doPrintTestCase filename testcase =
  mkStmtOneInstr (
    Call(
      None,
      Lval(var printTestCaseFun.svar),
      (Const(CStr filename)) :: testcase,
      locUnknown
    )
  )

let getTC (formals : varinfo list) =
  let format = ref "" in
  let vars = ref [] in
  List.iter (
    function f -> match f.vtype with
    | TInt(k, attrs) -> format := !format ^ "\t%d";
      vars := !vars @ [Lval(Var f, NoOffset)]
    | TFloat(k, attrs) -> format := !format ^ "\t%f";
      vars := !vars @ [Lval(Var f, NoOffset)]     
    | TArray(TInt(k, at), expr, attrs) ->
      format := !format ^ "\t%d\t%d\t%d\t%d\t%d";      
      vars := !vars @ [Lval(addOffsetLval (Index(integer(0), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(1), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(2), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(3), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(4), NoOffset)) (var f))]     
    | TArray(TFloat(k, at), expr, attrs) ->
      format := !format ^ "\t%f\t%f\t%f\t%f\t%f";            
      vars := !vars @ [Lval(addOffsetLval (Index(integer(0), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(1), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(2), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(3), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(4), NoOffset)) (var f))]       
    | TPtr(TInt(k, at), attrs) ->
      format := !format ^ "\t%d\t%d\t%d\t%d\t%d";      
      vars := !vars @ [Lval(addOffsetLval (Index(integer(0), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(1), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(2), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(3), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(4), NoOffset)) (var f))]     
    | TPtr(TFloat(k, at), attrs) ->
      format := !format ^ "\t%f\t%f\t%f\t%f\t%f";            
      vars := !vars @ [Lval(addOffsetLval (Index(integer(0), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(1), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(2), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(3), NoOffset)) (var f))];
      vars := !vars @ [Lval(addOffsetLval (Index(integer(4), NoOffset)) (var f))]       
    | _ -> ()
  ) formals;
  format := !format ^ "\n";
  !format, !vars

(* prototype for sprintf *)
let sprintfFun: fundec =
  let fdec = emptyFunction "sprintf" in
  fdec.svar.vtype <-
     TFun(intType, Some [ ("format", charPtrType, [])], true, []);
  fdec

let doSprintf dest format args =
  mkStmtOneInstr (
    Call(
      None,
      Lval(var sprintfFun.svar),
      ([dest] @ [Const(CStr format)]) @ args,
      locUnknown
    )
  )

(* prototype for malloc() *)
let makeMallocfxn (t : typ) : varinfo = 
  let v = makeGlobalVar !mallocFunctionName
    (TFun(t, Some [("size", intType, [])],
          true, [])) in
  v
    
let doTCBlock f =
  let tc = makeTempVar f charPtrType in
  let tcMalloc:varinfo = makeMallocfxn charPtrType in 
  let mallocStmt = mkStmtOneInstr (
    Call(
      Some (Var tc, NoOffset),
      Lval(var tcMalloc),
      [BinOp(Mult, (integer 100),(SizeOf charType),charType)],
      locUnknown
    )
  ) in 
  let format, vars = getTC f.sformals in
  let spf = (doSprintf (Lval(Var tc, NoOffset)) format vars) in
  let ptc = doPrintTestCase !Param.tcFile [Lval(Var tc, NoOffset)] in
  f.sbody.bstmts <- [mallocStmt; spf; ptc] @ f.sbody.bstmts
      
(* make global variables if not defined *)
let makevinfo ci : varinfo = 
  match !vstruct with 
    Some v -> v
  | None -> begin 
            let v = makeGlobalVar "argvar" (TComp(ci, [])) in
            vstruct := Some v;
            addProto1 := true;
            v
          end




(* prototype for rand() *)
let makeRandomfxn () : varinfo = 
  let v = makeGlobalVar !randomFunctionName 
                        (TFun(intType, Some [],
                              true, [])) in
  v


(* prototype for strcmp() *)
let makestrcmpFunction () : varinfo = 
  let v = makeGlobalVar !strcmpFunctionName 
                        (TFun(intType, Some [("s1", charConstPtrType, []);
                                             ("s2", charConstPtrType, [])],
                              true, [])) in
  v

let mkstrcmpfxn (name: varinfo) (s2 : string) (vi : varinfo) : instr = 
  let i: varinfo = makestrcmpFunction () in 
  Call(Some (var vi), Lval(var i), [v2e name; mkString s2] , !currentLoc)



(* prototype for find_conVal() *)
let makeFindConcreteValueFunction () : varinfo = 
  
  let v = makeGlobalVar "find_conVal" 
                        (TFun(voidPtrType, Some [("name", charConstPtrType, [])],
                              true, [])) in
  v


(* prototype for enQueue() *)
let makeEnqueueFunction () : varinfo = 
  let v = makeGlobalVar !enqueuefxn 
                        (TFun(voidType, Some [],
                              true, [])) in
  v

let mkenqueuefxn () : instr = 
  let i: varinfo = makeEnqueueFunction () in 
  Call(None, Lval(var i), [] , !currentLoc)



(* prototype for getMaxSatPaths() *)
let makegetMaxSatPathsFunction () : varinfo = 
  let v = makeGlobalVar "getTestCases" 
                        (TFun(intType, Some [],
                              true, [])) in
  v

let mkMaxSatfxn (vi : varinfo) : instr = 
  let i: varinfo = makegetMaxSatPathsFunction () in 
  Call(Some (var vi), Lval(var i), [] , !currentLoc)


(* prototype for delete_allSTableEntry() *)
let makeDelSTableFunction () : varinfo = 
  let v = makeGlobalVar !deleteSTable 
                        (TFun(voidType, Some [],
                              true, [])) in
  v

let mkdelStablefxn () : instr = 
  let i: varinfo = makeDelSTableFunction () in 
  Call(None, Lval(var i), [] , !currentLoc)

(* prototype for delete_allStructTableEntry() *)
let makeDelStructTableFunction () : varinfo = 
  let v = makeGlobalVar "delete_allStructTableEntry" 
                        (TFun(voidType, Some [],
                              true, [])) in
  v

let mkdelStructtablefxn () : instr = 
  let i: varinfo = makeDelStructTableFunction () in 
  Call(None, Lval(var i), [] , !currentLoc)


(* prototype for getPrint() *)
let makeGetPrintFunction () : varinfo = 
  let v = makeGlobalVar "getPrint" 
                        (TFun(voidType, Some [],
                              true, [])) in
  v

let mkgetprintfxn () : instr = 
  let i: varinfo = makeGetPrintFunction () in 
  Call(None, Lval(var i), [] , !currentLoc)



(* prototype for startCDG() *)
let makeStartCDGFunction () : varinfo = 
  let v = makeGlobalVar "startCDG" 
                        (TFun(intType, Some [],
                              true, [])) in
  v

let mkstartCdgfxn (vi : varinfo) : instr = 
  let i: varinfo = makeStartCDGFunction () in 
  Call(Some (Var vi, NoOffset), Lval(var i), [] , !currentLoc)




(* prototype for isNotQueueEmpty() *)
let makeQueueEmptyFunction () : varinfo = 
  let v = makeGlobalVar "isNotQueueEmpty" 
                        (TFun(intType, Some [],
                              true, [])) in
  v

let mkQEmptyfxn (vi: varinfo) : instr = 
  let i: varinfo = makeQueueEmptyFunction () in 
  Call(Some (Var vi, NoOffset), Lval(var i), [] , !currentLoc)



(* prototype for add_entryToArraySTable() *)
let makeArraySTableEntryFunction () : varinfo = 
  let v = makeGlobalVar "add_entryToArraySTable" 
                        (TFun(voidType, Some [("s1", charConstPtrType, []);
                                              ("index", intType, []);
                                              ("s2", charConstPtrType, []);
                                              ("val", voidPtrType, []);
                                              ("address", voidPtrType, []);
                                              ("type", intType, []); ],
                              true, [])) in
  v

let mkArrayStableEntryfxn (s1 : string) (e1: exp) (s2 : string) (e : exp) (t : int) : instr = 
  let i: varinfo = makeArraySTableEntryFunction () in 
  Call(None, Lval(var i), [mkString s1; e1; mkString s2; e; e; integer t] , locUnknown)




(* prototype for add_entryToSTable() *)
let makeSTableEntryFunction () : varinfo = 
  let v = makeGlobalVar !addEntryToSymbolTable 
                        (TFun(voidType, Some [("s1", charConstPtrType, []);
                                              ("s2", charConstPtrType, []);
                                              ("val", voidPtrType, []);
                                              ("address", voidPtrType, []);
                                              ("type", intType, []); ],
                              true, [])) in
  v

let mkstableEntryfxn (s1 : string) (s2 : string) (e : exp) (t : int) : instr = 
  let i: varinfo = makeSTableEntryFunction () in 
  Call(None, Lval(var i), [mkString s1; mkString s2; e; e; integer t] , !currentLoc)



(* directPathConditions function prototype *)
let makeDirectPathConditionsfxn () : varinfo = 
  let v = makeGlobalVar "directPathConditions"
                        (TFun(voidType, Some [],
                              true, [])) in
  v


let mkdirectPathConditionsfxn () : instr = 
  let p: varinfo = makeDirectPathConditionsfxn () in
  Call(None, Lval(var p), [], !currentLoc)

(* pretty printing for cil types in string format *)
let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 

(* visitor *)
class vartypeVisitorClass (fdec : fundec) (ci : compinfo) (funName : string) = object
  inherit nopCilVisitor
            
  method vinst i = begin
      match i with
      | Call(lo,e,(a::al),_) ->
         if (d_string "%a" d_exp e)="scanf" then
           (* 'a' will have the format specifier string and 'al' will contain *)
           (* rest of the arguments to 'scanf' function *)
           begin
             if fdec.svar.vname = funName then
               begin
                 (* Create names of the symbolic variables *)
                 let i =  List.map (
                              fun v ->
                              match v with
                              | AddrOf(Var v, NoOffset) ->
                                 vlhs := !vlhs @ [(Var v, NoOffset)];
                                 replce := !replce @ ["s" ^ (d_string "%d" !cnt_vars)];
                                 cnt_vars:=!cnt_vars+1; 
                                 d_string "%s" v.vname
                              | _ -> "";) al in

                 (* Put all the local variables which exist in above list*)
                 (* in 'input_vars' *)
                 input_vars := !input_vars @
                                 List.filter (
                                     fun v ->
                                     List.exists (fun s -> v.vname = s) i
                                   ) fdec.slocals;     
                 vlhs := [];  

               end;
             (* Removing the scanf statement *)
             ChangeTo !st_list;
           end
             
         else
           ChangeTo [i]

      | _ -> DoChildren
    end
end

(* function to initialize int/float variables instrumentation *)
let initVars (v : lval) (fd : fundec) : stmt list =

  let p: varinfo = makeRandomfxn () in
  let tmp = makeTempVar fd intType in 
  let pre = mkStmtOneInstr (Call(Some (Var tmp, NoOffset), Lval(var p), [], !currentLoc)) in
  let exp = BinOp(Mod, (v2e tmp), integer 20, intType) in
  let pre1 = mkStmtOneInstr (Set(v, exp, locUnknown)) in
  [pre ; pre1]


(* function to initialize pointer types *)
let initPtr (v : lval) (t : typ) (fd : fundec) (temp : varinfo) (cnt : int) : stmt list =

  let local = makeTempVar fd intType in
  let p: varinfo = makeMallocfxn t in 
  let p1: varinfo = makeRandomfxn () in 
  let pre = mkStmtOneInstr (Call(Some v, Lval(var p), [BinOp(Mult, (integer cnt),(SizeOf t),intType)], !currentLoc)) in
  let preset = mkStmtOneInstr (Set((var local), (integer 0), !currentLoc)) in
  let s = mkStmt (Break(!currentLoc)) in
  let exp = BinOp(Mod, (v2e temp), integer 20, intType) in
  let st = mkStmtOneInstr (Call(Some (Var temp ,NoOffset), Lval(var p1), [], !currentLoc)) in
  let st1 = mkStmtOneInstr (Set((Mem(BinOp(PlusA, (Lval v), (v2e local), intType)),NoOffset), exp, !currentLoc)) in
  let st2 = mkStmtOneInstr (Set((var local), (BinOp(PlusA, (v2e local), (integer 1), intType)), !currentLoc)) in
  let preif = mkStmt (If(BinOp(Ge, (v2e local), (integer 30),intType) ,(mkBlock [s]), (mkBlock [st; st1; st2]),!currentLoc)) in

  let loopblk = mkBlock [preif] in
  let loopStmt = mkStmt (Loop(loopblk, !currentLoc, None ,None)) in
  [pre; preset; loopStmt]



(* function to initialize Arrays *)
let initArray (v : lval) (fd : fundec) (e : exp) (atemp: varinfo) : stmt list =

  let local = makeTempVar fd intType in
  let preset = mkStmtOneInstr (Set((var local), (integer 0), !currentLoc)) in
  let s = mkStmt (Break(!currentLoc)) in
  let p: varinfo = makeRandomfxn () in 
  let v1 = addOffsetLval (Index((v2e local) ,NoOffset)) v in
  let exp = BinOp(Mod, (v2e atemp), integer 20, intType) in
  let pre1 = mkStmtOneInstr (Set(v1, exp, locUnknown)) in
  let st1 = mkStmtOneInstr (Call(Some (Var atemp,NoOffset), Lval(var p), [], !currentLoc)) in  
  let st2 = mkStmtOneInstr (Set((var local), (BinOp(PlusA, (v2e local), (integer 1), intType)), !currentLoc)) in
  let preif = mkStmt (If(BinOp(Ge, (v2e local), e ,intType) ,(mkBlock [s]), (mkBlock [st1; pre1; st2]),!currentLoc)) in
  let loopblk = mkBlock [preif] in
  let loopStmt = mkStmt (Loop(loopblk, !currentLoc, None ,None)) in
  [preset; loopStmt]


(* function to initialize & flatten structure Arrays *)

let rec initAndFlatten (v : lval) (fd : fundec) (e : exp) (temp : varinfo) (ci : compinfo) (f : fieldinfo) : stmt list =
  let local = makeTempVar fd intType in
  let preset = mkStmtOneInstr (Set((var local), (integer 0), !currentLoc)) in
  let s = mkStmt (Break(!currentLoc)) in
  let vci = makeVarinfo  true f.fname f.ftype in
  let st = List.concat (
               List.map (
                   fun a -> 
                   let v1 = (match f.ftype with
                             |TArray(_,_,_) -> (addOffsetLval (Index((v2e local), Field(a, NoOffset))) v)
                             |TPtr(_,_) -> (addOffsetLval (Field(a, NoOffset)) (Mem(Lval(v)),NoOffset) )
                             |_ -> (addOffsetLval (Field(a,NoOffset)) v)
                            ) in

                   match a.ftype with
                   | TPtr(TComp(c, a1), _) -> 
                      if ci.cname<>c.cname then 
                        []
                      else
                        [mkStmtOneInstr (Set(v1, CastE(TPtr(TVoid([]), []), (integer 0)), !currentLoc))]
                          

                   | TArray(TComp(c, a1), Some e1, _) -> 
                      if ci.cname<>c.cname then
                        (initAndFlatten v1 fd e1 temp c a)
                      else
                        []

                   | TPtr(t,_) -> (initPtr v1 t fd temp 30)

                   | TArray(t, Some e,_) -> let atemp = makeTempVar fd intType in
                                            (initArray v1 fd e atemp)

                   | _ -> (initVars v1 fd)

                 ) ci.cfields) in

  match f.ftype with
  | TComp(_,_) -> st
  | _ ->
     let st2 = mkStmtOneInstr (Set((var local), (BinOp(PlusA, (v2e local), (integer 1), intType)), !currentLoc)) in
     let preif = mkStmt (If(BinOp(Ge, (v2e local), e ,intType) ,(mkBlock [s]), (mkBlock (st@[st2])),!currentLoc)) in
     let loopblk = mkBlock [preif] in
     let loopStmt = mkStmt (Loop(loopblk, !currentLoc, None ,None)) in
     [preset; loopStmt]



let rec getStmts v stmts = 
  match v.skind with
  | If(e,tb,fb,l) ->
     let tb1 = List.concat (List.map (fun a -> getStmts a stmts) tb.bstmts)
     in
     let fb1 = List.concat (List.map (fun b ->getStmts b stmts) fb.bstmts)
     in
     [mkStmt (If(e, (mkBlock tb1), (mkBlock fb1),l))]

  | Block(b) ->
     let tb1 = List.concat (List.map (fun a -> getStmts a stmts) b.bstmts)
     in
     let newS =  mkStmt (Block(mkBlock tb1))
     in
     newS.labels <- v.labels;
     [newS]

  | Return(_) -> stmts @ [v]

  | _ -> [v]


let vartype (f: file) : unit =
  (* Creates blank structure named "arguments" *)
  E.log "Function Input: %s\n" !Param.func;
  let res = mkCompInfo true "arguments" (fun _ -> []) []
  in
  let funName = !Param.func
  in
  let doGlobal = function
    (* Check if the variable is from our C modules if not
         Then only add it to the global list
     *)
    | GVar(vi, _, l) -> 
       if not(List.exists (fun a -> a=l.file)  helperFiles) then
         globals := !globals @ [vi]

    | GFun (fdec, loc)  ->
       if (fdec.svar.vname = funName) then
         begin
           E.log "Function encountered: %s\n" fdec.svar.vname;
           funcn := [fdec.svar];
           E.log "length of funcn: %d\n" (List.length !funcn);
           formals := List.map (fun v -> v2e v) fdec.sformals;
           save_local := fdec.slocals;

           (* Symbolic names for variables *)
           let vartypeVisitor = new vartypeVisitorClass fdec res funName
           in
           ignore (visitCilFunction vartypeVisitor fdec);
           
           (* create list of local structure and array variables *)
           let x = List.concat (
                       List.map (
                           fun v ->
                           match v.vtype with
                           |TArray(_,_,_) -> [v]
                           |TComp(_,_) -> [v]
                           |_ -> [] ) fdec.slocals )
           in
           input_vars := !input_vars @ x;       
           localVars_left := List.filter (fun v -> List.for_all (fun s -> v.vname != s.vname) !input_vars) fdec.slocals; 
           (* Delete the input variables from the local var info *)
           fdec.slocals <- !localVars_left  ;
           vars := !globals @ !input_vars @ fdec.sformals;
           (* Move input variables to the formal variables' info *)
           setFormals fdec !vars;
           
           filist :=  (List.map (
                           fun v -> 
                                 { fcomp = res; fname = v.vname; ftype = v.vtype; fbitfield = None; fattr = []; floc = !currentLoc; }
                                ) fdec.sformals);
           res.cfields <- res.cfields @ !filist;
           filist := res.cfields;
           
           (* For every formal parameter create a symbolic variable name *)
           replce := List.map (fun v -> countUnroll := !countUnroll+1 ;("s" ^ (d_string "%d" !countUnroll))) fdec.sformals;

           (* Insert statement to current function body which inserts the variable in the 
            * symbolic table *)
           List.iter2 (
               fun s h -> match h.vtype with
                          | TPtr(TInt(_,_), _) -> let pre = mkArrayStableEntryfxn h.vname (integer 0) (h.vname ^ "_0") (v2e h) 1 in
                                                  fdec.sbody.bstmts <- (mkStmtOneInstr pre) :: fdec.sbody.bstmts
                          | TPtr(TFloat(_,_), _) -> let pre = mkArrayStableEntryfxn h.vname (integer 0) (h.vname ^ "_0") (v2e h) 0 in
                                                    fdec.sbody.bstmts <- (mkStmtOneInstr pre) :: fdec.sbody.bstmts
                          | TArray(TInt(_,_), _, _) -> ()
                                                                                                                                 
                          | TArray(TFloat(_,_),_,_) -> ()

                          | _ -> 
                             let t = (match h.vtype with
                                      |TInt(_,_) -> 1
                                      |TFloat(_,_) -> 2
                                      |TPtr(_,_) -> 1
                                      | _ -> -1 ) in  
                             let pre = mkstableEntryfxn  h.vname s (AddrOf(var h)) t in             
                             fdec.sbody.bstmts <- (mkStmtOneInstr pre) :: fdec.sbody.bstmts)
                      !replce
                      !vars;
	   E.log "length of funcn: %d\n" (List.length !funcn);
           let x =  (List.map (fun a ->  v2e a) fdec.sformals) in
           let x1 = (List.map (fun a -> Lval(Var a,NoOffset) ) fdec.sformals) in
           let call = Call (None, Lval (Var (List.hd !funcn), NoOffset), x  , locUnknown) in 
           (* let print = mkPrint "%d" x1 in *)
           (* let print = doPrintf "%d" x1 in  *)
           let pre = mkenqueuefxn () in
           let pre1 = mkdelStablefxn () in
           let pre3 = mkdelStructtablefxn () in
           let pre2 = mkdirectPathConditionsfxn () in
           let y = (mkBlock [mkStmtOneInstr pre; mkStmtOneInstr call]) in
           let tmp = makeTempVar fdec intType in
           let call1 = mkStmtOneInstr (mkQEmptyfxn tmp) in
           let call2 = mkStmtOneInstr (mkMaxSatfxn tmp) in
           
           let stCDG = mkstartCdgfxn tmp in
           let condn = mkStmt (If((v2e tmp), (mkBlock [call2;mkStmtOneInstr call]), (mkBlock []), locUnknown)) in
           let stmts1 = [ mkStmtOneInstr stCDG; condn] in
           let st1 = mkStmt (If((v2e tmp) , (mkBlock [mkStmtOneInstr pre;mkStmtOneInstr pre2;mkStmtOneInstr pre1;mkStmtOneInstr pre3;mkStmtOneInstr call]), (mkBlock stmts1), locUnknown)) in

           let stmts = [call1 ;st1] in
           let bdy = List.concat(
                         List.map (
                             fun v -> getStmts v stmts
                           ) fdec.sbody.bstmts) in
           fdec.sbody.bstmts <- bdy;
           doTCBlock fdec;
           
         end;

       if (fdec.svar.vname = "main") then  (* instrumenting body of test driver *)
         begin
           E.log "Function encountered: %s\n" fdec.svar.vname;
           fdec.slocals <- !vars; 
           
           (* creating random function for each variable *)
           let temp =  makeLocalVar fdec "temp" intType in  
           let p: varinfo = makevinfo res in   
           List.iter (fun v -> match v.ftype with
                                 
                               | TPtr(TComp(ci, a), _) -> 
                                  
                                  let p1: varinfo = makeMallocfxn v.ftype in     
                                  let pre = mkStmtOneInstr (Call(Some (addOffsetLval (Field(v, NoOffset)) (var p)), Lval(var p1), [BinOp(Mult, (integer 30), (SizeOf (TComp(ci,a))), intType)], !currentLoc)) in
                                  let st = initAndFlatten (addOffsetLval (Field(v, NoOffset)) (var p)) fdec (integer 0) temp ci v in
                                  fdec.sbody.bstmts <- [pre] @ st @ fdec.sbody.bstmts


                               | TComp(ci,a) ->

                                  let st = initAndFlatten (addOffsetLval (Field(v, NoOffset)) (var p)) fdec (integer 0) temp ci v in
                                  fdec.sbody.bstmts <- st @ fdec.sbody.bstmts
                                                              

                               | TArray(TComp(ci, a), Some e, _) -> 
                                  let st = initAndFlatten (addOffsetLval (Field(v, NoOffset)) (var p)) fdec e temp ci v in                       
                                  fdec.sbody.bstmts <-  st @ fdec.sbody.bstmts 


                               | TPtr(t,_) -> 
                                  let st = initPtr (addOffsetLval (Field(v, NoOffset)) (var p)) t fdec temp 30 in
                                  fdec.sbody.bstmts <- st @ fdec.sbody.bstmts


                               | TArray(t, Some e ,_) ->
                                  let atemp =  makeTempVar fdec  intType in  
                                  let st = initArray (addOffsetLval (Field(v, NoOffset)) (var p)) fdec e atemp in
                                  fdec.sbody.bstmts <- st @ fdec.sbody.bstmts
                                                              

                               | _ ->
                                  let st = initVars (addOffsetLval (Field(v, NoOffset)) (var p)) fdec in
                                  fdec.sbody.bstmts <- st @ fdec.sbody.bstmts
                     ) (List.rev res.cfields);

           
         end;

       if fdec.svar.vname="getValues" then 
         begin
           E.log "Function encountered: %s\n" fdec.svar.vname;
           let temp =  makeLocalVar fdec "temp" voidPtrType in   
           List.iter (fun a -> match a.ftype with
                               |TPtr(_,_) -> ()
                               |TArray(_,_,_) -> ()
                               | _ ->
                                  let p: varinfo = makevinfo res in    
                                  let pre1 = (addOffsetLval (Field(a,NoOffset)) (var p)) in
                                  let vari = makeFindConcreteValueFunction () in
                                  let st = Call(Some (var temp), Lval(var vari), [mkString a.fname], locUnknown) in
                                  let st1 = Set(pre1, Lval (Mem(CastE(intPtrType ,(v2e temp))),NoOffset), locUnknown) in
                                  fdec.sbody.bstmts <- [(mkStmtOneInstr st) ;(mkStmtOneInstr st1)] @fdec.sbody.bstmts 
                     ) (List.rev res.cfields) ;

         end;

       if fdec.svar.vname = "runForCDGPath" then
         begin
           E.log "Function encountered: %s\n" fdec.svar.vname;
           E.log "length of 2nd funcn: %d\n" (List.length !funcn);
           let x =  (List.map (fun a ->   let p: varinfo = makevinfo res in (Lval ((Var p), Field(a,NoOffset)) )) !filist) in
           let call = Call (None, Lval (Var (List.hd !funcn), NoOffset), x  , locUnknown) in 
           fdec.sbody.bstmts <- [mkStmtOneInstr call]

         end;

       
       if fdec.svar.vname = "callInstrumentedFun" then
         begin
           E.log "Function encountered: %s\n" fdec.svar.vname;
           E.log "length of 3rd funcn: %d\n" (List.length !funcn);
           let x =  (List.map (fun a ->   let p: varinfo = makevinfo res in (Lval ((Var p), Field(a,NoOffset)) )) !filist) in
           let call = Call (None, Lval (Var (List.hd !funcn), NoOffset), x  , locUnknown) in 
           let pre = mkenqueuefxn () in
           let pre1 = mkdelStablefxn () in
           fdec.sbody.bstmts <-  [(*mkStmtOneInstr pre1;*) mkStmtOneInstr pre; mkStmtOneInstr call (*; mkStmtOneInstr (mkgetprintfxn ())*)]
         end

    | _ -> ()
  in    
  
  Stats.time "vartype" (iterGlobals f) doGlobal;
  E.log "Vartype Complete\n";
  if !addProto1 then
    begin
      let p = makevinfo res in
      f.globals <-  List.concat (List.map (fun g -> match g with
      |GFun(fdec,_) when fdec.svar.vname=funName -> 
        GCompTag (res, locUnknown) :: GVarDecl (p, locUnknown) :: [g]
      | _ -> [g]
        
      ) f.globals)       
    end
  else
    f.globals <- GCompTag (res, !currentLoc) :: f.globals

let feature : featureDescr = {
  fd_name = "vartype";
  fd_enabled = ref false;
  fd_description = "";
  fd_extraopt = [];
  fd_doit = vartype;
  fd_post_check = true
} 


