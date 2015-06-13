
open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let i = ref 0
let name = ref ""


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


class path_profilingVisitorClass (fd : fundec) = object
  inherit nopCilVisitor                        

  
   method vstmt (s : stmt) = begin
    let action s =
      match s.skind with
      | If(e,tb,fb,l) ->
          let count1 = makeGlobalVar "count" intType in
            let count2 = makeTempVar fd intType in
              let ptrue = Set(var count1, Lval(var l), locUnknown) in
                let pfalse = Set(var count2, zero, locUnknown) in
                 let count12 = Set(var count1, BinOp(PlusA, Lval(var count1),integer 1,TInt(IInt,[])), locUnknown) in
                  let count22 = Set(var count2, BinOp(PlusA, Lval(var count2),integer 1,TInt(IInt,[])), locUnknown) in
                  let tblk = mkBlock ((mkStmtOneInstr count12) :: tb.bstmts) in
                  let fblk =  mkBlock ((mkStmtOneInstr count22) :: fb.bstmts) in
                      let nb = mkBlock [mkStmt (If (e, tblk ,fblk,l)) ] in
                        let nbb = mkBlock ((mkStmtOneInstr pfalse) :: nb.bstmts) in
                          let nbbb = mkBlock ((mkStmtOneInstr ptrue) :: nbb.bstmts) in
                             let post = mkPrint (d_string "value of if count %%d \n") [Lval(var count1)] in
                               let mb = mkBlock ( nbbb.bstmts @ [mkStmtOneInstr post]) in
                         s.skind <- Block mb;
                   s
      | _ -> s
      in 
       ChangeDoChildrenPost(s,action)

  end
end




let path_profiling (f: file) : unit =

  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) ->
       
        currentFunc := fdec.svar.vname;
        (* do the body *)
       let path_profilingVisitor = new path_profilingVisitorClass fdec in
        ignore (visitCilFunction path_profilingVisitor fdec);
        (* Now add the entry instruction *)
 
             
    | _ -> ()
  in
  Stats.time "path_profiling" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "path_profiling";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = path_profiling;
    fd_post_check = true
  } 

     



