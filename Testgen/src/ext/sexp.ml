open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let i = ref 0
let name = ref ""
let value = ref 0
let smtexp : string list ref = ref []

let out_file = "test_sat.smt"

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
let sexpr: string ref = ref ""

let rec checkexp (e : exp)  = 
 match e with
   | BinOp(op,e1,e2,l) -> begin
                              match op with
                               |Eq -> ("(=" ^ " " ^ (checkexp e1) ^ " " ^ (checkexp e2) ^ ")")
                               |Ne -> ("(not (=" ^ " " ^ (checkexp e1) ^ " " ^ (checkexp e2) ^ "))")
                               | _ -> ("(" ^ (d_string "%a" d_binop op) ^ " " ^ (checkexp e1) ^ " " ^ (checkexp e2) ^ ")")
                         end

   | UnOp(op,e1,_) -> begin
                         match op with 
                          | LNot -> ("(not " ^ (checkexp e1) ^ ")")
                          | _ -> ("(" ^ (d_string "%a" d_unop op) ^ " " ^ (checkexp e1) ^ ")")
                     end

   | _ -> (d_string "%a" d_exp e)


class sexpVisitorClass (fdec : fundec) = object
  inherit nopCilVisitor                        

 
  method vstmt (s : stmt) = begin
    match s.skind with
        | If(e,tb,fb,l)-> E.log "SEXP of %a is : %s\n" d_exp e (checkexp e); 
                          smtexp := !smtexp @ [(checkexp e)];
                         DoChildren

        | _ ->  DoChildren


  end
end




let sexp (f: file) : unit =
  let oc = open_out out_file in

 let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) ->
        currentFunc := fdec.svar.vname;
      
   fprintf oc "%s\n" "(benchmark test_sat";
   fprintf oc "  %s\n" ":logic AUFLIA";
   
let sexpVisitor = new sexpVisitorClass fdec in
ignore (visitCilFunction sexpVisitor fdec);

  fprintf oc "  %s" ":extrafuns (";

 List.iter (fun v -> fprintf oc "(%s Int) " v.vname;
              ()
           ) fdec.slocals;
  fprintf oc "%s\n" ")";


 List.iter (fun v ->  fprintf oc "  %s\n" (":assumption " ^ v) ;
                      () 
           ) !smtexp;

       fprintf oc "  %s\n" ":formula true)";
      close_out oc

    | _ -> ()
  in
  Stats.time "sexp" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     E.log "Adding prototype for call logging function %s\n" p.vname;
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "sexp";
    fd_enabled = ref false;
    fd_description = "generation of code to log function calls";
    fd_extraopt = [];
    fd_doit = sexp;
    fd_post_check = true
  } 


