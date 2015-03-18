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


class ass2VisitorClass = object (self)
  inherit nopCilVisitor                        

   method vstmt (s : stmt) = begin
    let action s =
      match s.skind with
       | If(e,tb,fb,l)-> 
           let ptrue = mkPrint (d_string "and( %a)" d_exp e) [] in
             let pfalse = mkPrint (d_string " and (Not(%a))" d_exp e) [] in 
              let tblk =  mkBlock ((mkStmtOneInstr ptrue) :: tb.bstmts) in
                let fblk = mkBlock ((mkStmtOneInstr pfalse) :: fb.bstmts) in
                 let nb = mkBlock [mkStmt (If (e, tblk ,fblk,l)) ] in
                   s.skind <- Block nb;
            s
       | _ -> s
     in 
       ChangeDoChildrenPost(s,action)

    end
     
end   
 

let ass2Visitor = new ass2VisitorClass


let ass2 (f: file) : unit =

  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) ->
        currentFunc := fdec.svar.vname;
        (* do the body *)
        ignore (visitCilFunction ass2Visitor fdec);
        (* Now add the entry instruction *)
         let pre = mkPrint (d_string "True\n") [] in 
        fdec.sbody <- 
          mkBlock [ mkStmtOneInstr pre;
                    mkStmt (Block fdec.sbody) ]

    | _ -> ()
  in
  Stats.time "ass2" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     E.log "Adding prototype for call logging function %s\n" p.vname;
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "ass2";
    fd_enabled = ref false;
    fd_description = "generation of code to log function calls";
    fd_extraopt = [
      ("--logcallprintf", Arg.String (fun s -> printFunctionName := s), 
       " the name of the printf function to use");
      ("--logcalladdproto", Arg.Unit (fun s -> addProto := true), 
       " whether to add the prototype for the printf function")
    ];
    fd_doit = ass2;
    fd_post_check = true
  } 


