(** See copyright notice at the end of this file *)

(** Add printf before each function call *)

open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl
module L = List

let i = ref 0
let name = ref ""

let save = ref None
let locn = ref None
(* Switches *)
let printFunctionName = ref "printf"

let addProto = ref false

let printf: varinfo option ref = ref None
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
  

let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 

let currentFunc: string ref = ref ""


let changeForFixStmt (s : stmt) : exp = 
   match s.skind with
    | If(e,tb,fb,l) ->
                E.log "condition is %a\n" d_exp e;
                 e      
    | _ -> mkString " "



let findinstr ()  : exp = 
 match !save with 
     | None -> integer 1
     | Some h -> h


let findloc ()  : location = 
 match !locn with 
     | None -> locUnknown 
     | Some h -> h


class changeForVisitorClass = object
  inherit nopCilVisitor                        

  

  method vinst i = begin
    match i with
    | Set((Var vi, NoOffset), e1 , loc) ->
            let exp1 = BinOp(Ge,Lval (Var vi, NoOffset),e1,TInt(IInt,[])) in
             save := Some exp1;
             locn := Some loc;
           E.log "assignment = %a, location= %a\n" d_instr i d_loc loc;

           ChangeTo [i]
    | _ -> DoChildren
  end
  method vstmt (s : stmt) = begin
    match s.skind with
     | Loop(blk1, loc, s1, s2) ->
                let (s1::blk2) = blk1.bstmts in
                 let exp1 = changeForFixStmt s1 in

                    E.log "string = %a\n" d_exp exp1;
                   let y = findinstr () in
                    let z = findloc () in
                    let pre1 = mkStmtOneInstr (mkPrint (d_string "Outside loop Coverage\n") []) in
                      let s1 = mkStmt (If(exp1,(mkBlock blk2),(mkBlock []),z)) in
                        let s2 = mkStmt (If(y,(mkBlock [s1]),(mkBlock []),z)) in
                       E.log "y= %a\n z = %a \n" d_exp y d_loc z;
                   ChangeTo (mkStmt (Block (mkBlock [s2])))

    | _ -> DoChildren


  end
end

let changeForVisitor = new changeForVisitorClass


let changeFor (f: file) : unit =

  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) ->
        currentFunc := fdec.svar.vname;
        (* do the body *)
        ignore (visitCilFunction changeForVisitor fdec);

      
    | _ -> ()
  in
  Stats.time "changeFor" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     E.log "Adding prototype for call logging function %s\n" p.vname;
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "changeFor";
    fd_enabled = ref false;
    fd_description = "print name of variables updated";
    fd_extraopt = [];
    fd_doit = changeFor;
    fd_post_check = true
  } 

