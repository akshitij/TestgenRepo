open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

module L = List

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


class break_condnVisitorClass = object (self)
  inherit nopCilVisitor                        

  (* Watch for a declaration for our printer *)


   method vstmt (s : stmt) = begin
      match s.skind with
       | If(e,tb,fb,l)->  let pre = mkPrint (d_string " %a\n" d_loc l) [] in 
                         ChangeTo (mkStmt (Block (mkBlock [ mkStmtOneInstr pre; s ])));
                             
       | _ -> DoChildren
   
    end
     
end   
 

let break_condnVisitor = new break_condnVisitorClass


let break_condn (f: file) : unit =

  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) ->
        currentFunc := fdec.svar.vname;
        (* do the body *)
        ignore (visitCilFunction break_condnVisitor fdec);
        (* Now add the entry instruction *)
         let pre = mkPrint (d_string "True\n") [] in 
        fdec.sbody <- 
          mkBlock [ mkStmtOneInstr pre;
                    mkStmt (Block fdec.sbody) ]

    | _ -> ()
  in
  Stats.time "break_condn" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     E.log "Adding prototype for call logging function %s\n" p.vname;
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "break_condn";
    fd_enabled = ref false;
    fd_description = "generation of code to log function calls";
    fd_extraopt = [
      ("--logcallprintf", Arg.String (fun s -> printFunctionName := s), 
       " the name of the printf function to use");
      ("--logcalladdproto", Arg.Unit (fun s -> addProto := true), 
       " whether to add the prototype for the printf function")
    ];
    fd_doit = break_condn;
    fd_post_check = true
  } 


