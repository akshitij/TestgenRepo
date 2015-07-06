(* Feature to extract struct variables from assignment statements and if conditions *)
open Pretty
open Cil
open Trace
open Printf
module E = Errormsg
module H = Hashtbl
module L = List

(* switches *)
let printFunctionName = ref "printf"
let addProto = ref false
let stmtlist : instr list ref = ref []
let stlist : stmt list ref = ref []
let aindex = ref 0

(* function for varinfo -> exp *)
let v2e (v : varinfo) : exp = Lval(var v)

let printf: varinfo option ref = ref None

(* prototype for printf function *)
let makePrintfFunction () : varinfo = 
  match !printf with 
    Some v -> v
  | None ->
     begin 
       let v = makeGlobalVar
                 !printFunctionName 
                 (TFun(
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

(* Pretty printer for cil types to string *)
let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 

(* Check expressions recursively for struct type
   And add new variables and assign these struct variables
   to those new variables
 *)
let rec checkExp e fdec t = 
  match e with
  | Lval((Var v), (Index(_,Field(_,_)))) ->
     let vi = makeLocalVar fdec ("a_" ^ (d_string "%d" !aindex))  t
     in
     let st = Set(var vi, e, locUnknown)
     in
     stmtlist := !stmtlist @ [st];
     stlist := !stlist @ [mkStmtOneInstr st];
     aindex := !aindex+1;
     (v2e vi)

  | Lval(Mem e1, (Index(_,_))) ->
     let vi = makeLocalVar fdec ("a_" ^ (d_string "%d" !aindex))  t
     in
     let st = Set(var vi, e, locUnknown)
     in
     stmtlist := !stmtlist @ [st];
     stlist := !stlist @ [mkStmtOneInstr st];
     aindex := !aindex+1;
     (v2e vi)


  | Lval((Var v), (Field(fi, o))) ->
     let vi = makeLocalVar fdec ("a_" ^ (d_string "%d" !aindex))  t
     in
     let st = Set(var vi, e, locUnknown)
     in
     stmtlist := !stmtlist @ [st];
     stlist := !stlist @ [mkStmtOneInstr st];
     aindex := !aindex+1;
     (v2e vi)

       
  | Lval(Mem e1, (Field(fi, o))) ->
     let vi = makeLocalVar fdec ("a_" ^ (d_string "%d" !aindex))  t
     in
     let st = Set(var vi, e, locUnknown)
     in
     stmtlist := !stmtlist @ [st];
     stlist := !stlist @ [mkStmtOneInstr st];
     aindex := !aindex+1;
     (v2e vi)


  | BinOp(op,e1,e2,t) -> BinOp(op,(checkExp e1 fdec t), (checkExp e2 fdec t),t)

  | UnOp(op,e1,t) -> UnOp(op, (checkExp e1 fdec t), t)

  |_ -> e

(* Visitor *)
class extractStructVisitorClass (fdec : fundec) = object (self)
  inherit nopCilVisitor 
  (* Replacing the if statements*)
  method vstmt (s : stmt) =
    begin
      let action s =
        match s.skind with
        | If(e,tb,fb,l) ->
           stlist := [];
           let e1 = checkExp e fdec intType
           in
           if (List.length !stlist)=0 then
             s.skind <- If(e1,tb,fb,locUnknown)
           else
             s.skind <- Block (mkBlock (!stlist @ [mkStmt (If(e1,tb,fb,locUnknown))]));
           s

        | _ -> s

      in 
      ChangeDoChildrenPost(s,action)
    end
  (* Replacing the assignment statements *)
  method vinst i = begin
      let action [i] =
        match i with
        | Set(lv, e, l) -> 
           stmtlist := [];
           begin
             match e with
             | BinOp(_,_,_,_) ->
                let e1 = checkExp e fdec (typeOfLval lv)
                in
                !stmtlist @ [Set(lv, e1, l)]
             | _ -> [i]
           end
             
        | _ -> [i]
      in
      ChangeDoChildrenPost([i],action)
    end
                     
end   
                                                    
let extractStruct (f: file) : unit =
  let funName = !Param.func in
  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
       if !printf = None then
         printf := Some v

    | GFun (fdec, loc) when fdec.svar.vname = funName ->     
       let extractStructVisitor = new extractStructVisitorClass fdec
       in
       ignore (visitCilFunction extractStructVisitor fdec)
              
    | _ -> ()
  in
  Stats.time "extractStruct" (iterGlobals f) doGlobal;
  if !addProto then
    begin
      let p = makePrintfFunction ()
      in 
      f.globals <- GVarDecl (p, locUnknown) :: f.globals
    end  

let feature : featureDescr = {
  fd_name = "extractStruct";
  fd_enabled = ref false;
  fd_description = "";
  fd_extraopt = [];
  fd_doit = extractStruct;
  fd_post_check = true
} 


