(** See copyright notice at the end of this file *)

(** Add printf before each function call *)

open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let i = ref 0
let name = ref ""

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

class loopInsertVisitorClass = object
  inherit nopCilVisitor                        

  (* Watch for a declaration for our printer *)
  
  method vinst i = begin
    match i with
    | Set(lv, _ , loc) ->
         let post = mkPrint (d_string "Write %%p to 0x%%08x at %%s:%%d (%a)\n" d_lval lv) [] in
   
      ChangeTo [i; post]
    | _ -> DoChildren
  end
  method vstmt (s : stmt) = begin
    match s.skind with
      Return _ -> 
        let pre = mkPrint (d_string "exit %s\n" !currentFunc) [] in 
        ChangeTo (mkStmt (Block (mkBlock [ mkStmtOneInstr pre; s ])))
    | _ -> DoChildren


  end
end

let loopInsertVisitor = new loopInsertVisitorClass


let loopInsert (f: file) : unit =

  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) ->
        currentFunc := fdec.svar.vname;
        (* do the body *)
        ignore (visitCilFunction loopInsertVisitor fdec);
        (* Now add the entry instruction *)
        let pre = mkPrint (d_string "enter %s\n" !currentFunc) [] in 
        fdec.sbody <- 
          mkBlock [ mkStmtOneInstr pre;
                    mkStmt (Block fdec.sbody) ]

    | _ -> ()
  in
  Stats.time "loopInsert" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     E.log "Adding prototype for call logging function %s\n" p.vname;
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "loopInsert";
    fd_enabled = ref false;
    fd_description = "Inserting loop";
    fd_extraopt = [];
    fd_doit = loopInsert;
    fd_post_check = true
  } 


