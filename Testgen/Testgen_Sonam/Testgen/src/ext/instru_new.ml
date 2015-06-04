open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let i = ref 0
let name = ref ""


let printFunctionName = ref "main1"
let printFunctionName1 = ref "printf"

let addProto = ref false

let main1: varinfo option ref = ref None
let makePrintfFunction () : varinfo = 
    match !main1 with 
      Some v -> v
    | None -> begin 
        let v = makeGlobalVar !printFunctionName 
                     (TFun(voidType, Some [],
                             false, [])) in
        main1 := Some v;
        addProto := true;
        v
    end

let mkPrint () : instr = 
  let p: varinfo = makePrintfFunction () in 
  Call(None, Lval(var p), [] , !currentLoc)


let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 


let printf: varinfo option ref = ref None
let makePrintfFunction1 () : varinfo = 
    match !printf with 
      Some v -> v
    | None -> begin 
        let v = makeGlobalVar !printFunctionName1 
                     (TFun(voidType, Some [("format", charPtrType, [])],
                             true, [])) in
        printf := Some v;
        addProto := true;
        v
    end

let mkPrint1 (format: string) (args: exp list) : instr = 
  let p: varinfo = makePrintfFunction1 () in 
  Call(None, Lval(var p), (mkString format) :: args, !currentLoc)

let currentFunc: string ref = ref ""

class instru_newVisitorClass = object
  inherit nopCilVisitor                        

  
 
  method vstmt (s : stmt) = begin
    match s.skind with
            
       Return _ -> 
        let pre = mkPrint () in 
        ChangeTo (mkStmt (Block (mkBlock [ mkStmtOneInstr pre; s ])))
    | _ -> DoChildren


  end
end

let instru_newVisitor = new instru_newVisitorClass


let instru_new (f: file) : unit =

  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !main1 = None then
             main1 := Some v

    | GFun (fdec, loc) ->
        currentFunc := fdec.svar.vname;
      
       if fdec.svar.vname = "main1" then begin
         let pre = mkPrint1 (d_string "enter %s\n" !currentFunc) [] in 
            fdec.sbody <- mkBlock [ mkStmtOneInstr pre; mkStmt (Block fdec.sbody) ]
       end


        ignore (visitCilFunction instru_newVisitor fdec)
        

    | _ -> ()
  in
  Stats.time "instru_new" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "instru_new";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = instru_new;
    fd_post_check = true
  } 


