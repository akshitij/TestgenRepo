open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

module L = List

let i = ref 0
let name = ref ""


let printFunctionName = ref "printf"

let function1 = ref "insert"
let function2 = ref "printPaths"

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


let makeInsertFunction () : varinfo = 
        let v = makeGlobalVar !function1 
                    (TFun(voidType, Some [("val", charPtrType, [])],
                             true, [])) in
         v
 
let makePrintFunction () : varinfo = 
        let v = makeGlobalVar !function2 
                    (TFun(voidType, Some [],
                             true, [])) in
         v
 

let mkPrint (format: string) (args: exp list) : instr = 
  let p: varinfo = makePrintfFunction () in 
  Call(None, Lval(var p), (mkString format) :: args, !currentLoc)
  
let mkinsertfxn (info: string) : instr = 
  let i: varinfo = makeInsertFunction () in 
  Call(None, Lval(var i), [mkString info], !currentLoc)
  

let mkprintfxn () : instr = 
  let i: varinfo = makePrintFunction () in 
  Call(None, Lval(var i), [], !currentLoc)


let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 

let currentFunc: string ref = ref ""


class insertdsVisitorClass = object (self)
  inherit nopCilVisitor                        

   method vstmt (s : stmt) = begin
    let action s =
      match s.skind with
       | If(e,tb,fb,l)-> 
                   let pre = mkinsertfxn (d_string "%a" d_exp e) in
                     let pre1 = mkinsertfxn (d_string "Not(%a)" d_exp e) in
                     let pprint = mkprintfxn () in
                    let tblk = mkBlock ( mkStmtOneInstr pre :: tb.bstmts) in
                     let fblk = mkBlock ( mkStmtOneInstr pre1 :: fb.bstmts) in
                     let nb = mkBlock [mkStmt (If (e, tblk ,fblk,l)); mkStmtOneInstr pprint ] in
                       s.skind <- Block nb;
            s
       | _ -> s
     in 
       ChangeDoChildrenPost(s,action)

    end
     
end   
 

let insertdsVisitor = new insertdsVisitorClass


let insertds (f: file) : unit =

  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) when fdec.svar.vname = "main"->
        currentFunc := fdec.svar.vname;
        (* do the body *)
        ignore (visitCilFunction insertdsVisitor fdec);
       

    | _ -> ()
  in
  Stats.time "insertds" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
         f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "insertds";
    fd_enabled = ref false;
    fd_description = "generation of code to log function calls";
    fd_extraopt = [];
    fd_doit = insertds;
    fd_post_check = true
  } 


