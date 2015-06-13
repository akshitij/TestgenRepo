(** See copyright notice at the end of this file *)

(** Add printf before each function call *)

open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl
module IH = Inthash


let i = ref 0
let name = ref ""


let level = ref 1
let arithAbsOut = ref stdout

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

class exchangeIfElseVisitorClass (fdec : fundec) = object
  inherit nopCilVisitor                         
  
  method vstmt (s : stmt) = begin
    let action s =
      match s.skind with
      | If(e,tb,fb,l) ->
           (* E.log "Condition : %a , level : %d\n\n" d_exp e !level;*)
            level := !level + 1;

E.log "\n dominator statement is %a\n" d_exp e;
E.log "\n Dominates\n";
     let ipdom,tree = Dominators.computeDomTree fdec in
        let doms = Dominators.children tree s in
		List.iter (fun v -> match v E.log "\n     %a  \n" d_exp e) doms;

   (* let idom: doc = 
        match Dominators.getIdom (Dominators.computeIDom fdec) s with 
          Some dom -> num dom.sid
        | None -> nil
      in
        ignore (Pretty.fprint !arithAbsOut 80 (indent 0 idom));  *)
          s

      | _ -> s
      in 
       ChangeDoChildrenPost(s,action)

  end
end




let exchangeIfElse (f: file) : unit =

  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) ->
        currentFunc := fdec.svar.vname;

  let exchangeIfElseVisitor = new exchangeIfElseVisitorClass fdec in
        ignore (visitCilFunction exchangeIfElseVisitor fdec);

      

    | _ -> ()
  in
  Stats.time "exchangeIfElse" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     E.log "Adding prototype for call logging function %s\n" p.vname;
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "exchangeIfElse";
    fd_enabled = ref false;
    fd_description = "print name of variables updated";
    fd_extraopt = [];
    fd_doit = exchangeIfElse;
    fd_post_check = true
  } 

