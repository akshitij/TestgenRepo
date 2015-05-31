(* Feature to create sidTable which contains a record of each If 
   condition along with its sid, true and false expression, seen sides of expressions 
*)

open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let stmtlist : stmt list ref = ref []
let addConditionFunctionName = ref "add_condition"
let printConditionFunctionName = ref "print_conditions"

let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 

(* Prototype for add_condition funciton in sidTable.c *)
let makeaddconditionFunction () : varinfo = 
  let v = makeGlobalVar
            !addConditionFunctionName 
            (TFun(
                 voidType,
                 Some [
                     ("sid", intType, []);
                     ("exp1", charConstPtrType, []);
                     ("exp2", charConstPtrType, []);
                     ("tb", intType, []);
                     ("fb", intType, [])
                   ],
                 true,
                 []
               )
            )
  in
  v

(* Returns call to add_condition function *)
let mkaddconditionfxn (sid: int) (s1:string) (s2 : string) (tb : int) (fb : int) : instr = 
  let i: varinfo = makeaddconditionFunction ()
  in 
  Call(None, Lval(var i), [integer sid; mkString s1; mkString s2; integer tb; integer fb] , !currentLoc)

(* Prototype for print_conditions functions *)
let makeprintconditionFunction () : varinfo = 
  let v = makeGlobalVar
            !printConditionFunctionName 
            (TFun(
                 voidType,
                 Some [],
                 true,
                 []
               )
            )
  in
  v
    
(* Returns call to print_condition function *)
let mkprintconditionfxn () : instr = 
  let i: varinfo = makeprintconditionFunction ()
  in 
  Call(None, Lval(var i), [] , !currentLoc)

(* Converting infix expression to S-Expression format *)
let rec getSExp (e : exp)  = 
  match e with
  | BinOp(op,e1,e2,l) ->
     begin
       match op with
       |Eq -> ("(=" ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ ")")
       |Ne -> ("(! (=" ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ "))")
       | _ -> ("(" ^ (d_string "%a" d_binop op) ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ ")")
     end

  | UnOp(LNot,e1,_) -> ("(" ^ "not" ^ " " ^ (getSExp e1) ^ ")")

  | UnOp(op,e1,_) ->  ("(" ^ (d_string "%a" d_unop op) ^ " " ^ (getSExp e1) ^ ")")
                        
  | CastE(t, e1) -> getSExp e1                     

  | _ -> (d_string "%a" d_exp e)

class sidTableVisitorClass (fdec : fundec) = object
  inherit nopCilVisitor                        

  method vstmt (s : stmt) = begin
      (* For every if condition create insert the predicate and it's opposite in the SIDTable *)
      let action s =
        match s.skind with
        | If(e,tb,fb,l)-> 
           let falseExp = (match e with
                           | UnOp(LNot, e1, t) -> e1
                           | _ -> UnOp(LNot, e , typeOf(e))
                          )
           in
           let addin = mkaddconditionfxn s.sid (getSExp e) (getSExp falseExp) 0 0
           in
           stmtlist := !stmtlist @ [mkStmtOneInstr addin];
           s
             
        | _ -> s
      in 
      ChangeDoChildrenPost(s,action)
    end 
end

let sidTable (f: file) : unit =
  let funName =  !Param.func
  in
  let doGlobal = function
    | GFun (fdec, loc) when fdec.svar.vname=funName ->
       let sidTableVisitor = new sidTableVisitorClass fdec
       in
       ignore (visitCilFunction sidTableVisitor fdec)
              
    | _ -> ()
  in
  Stats.time "sidTable" (iterGlobals f) doGlobal;
  let fd = (emptyFunction "createSidTable")
  in
  f.globals <-  List.concat (  
                    List.map (
                        fun g ->
                        match g with
                        |GFun(fdec,_) when fdec.svar.vname=funName -> 
                          GFun(fd, locUnknown) :: [g]
                        | _ -> [g]
                                 
                      ) f.globals
                  );
  fd.sbody  <- mkBlock !stmtlist

let feature : featureDescr = {
  fd_name = "sidTable";
  fd_enabled = ref false;
  fd_description = "";
  fd_extraopt = [];
  fd_doit = sidTable;
  fd_post_check = true
} 


