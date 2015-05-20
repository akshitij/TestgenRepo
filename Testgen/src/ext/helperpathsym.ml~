open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl


let funcn : varinfo list ref = ref []
let formals : exp list ref = ref []
let printf: varinfo option ref = ref None

let addProto = ref false

let printFunctionName = ref "printf"


let instrumentedFname = ref "callInstrumentedFun"
let oldMainFunctionName = ref "main1"


let v2e (v : varinfo) : exp = Lval(var v)

(* printf function prototype *)
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
  

(* callInstrumentedFun function prototype *)
let makeMainfxn () : varinfo = 
        let v = makeGlobalVar !instrumentedFname 
                    (TFun(voidType, Some [],
                             true, [])) in
         v


let mkmainfxn () : instr = 
  let p: varinfo = makeMainfxn () in
        Call(None, Lval(var p), [], !currentLoc)


(* createSidTable function prototype *)
let makeCreateSTablefxn () : varinfo = 
        let v = makeGlobalVar "createSidTable" 
                    (TFun(voidType, Some [],
                             true, [])) in
         v


let mkcreatetablefxn () : instr = 
  let p: varinfo = makeCreateSTablefxn () in
        Call(None, Lval(var p), [], !currentLoc)


(* directPathConditions function prototype *)
let makeDirectPathConditionsfxn () : varinfo = 
        let v = makeGlobalVar "directPathConditions"
                    (TFun(voidType, Some [],
                             true, [])) in
         v


let mkdirectPathConditionsfxn () : instr = 
  let p: varinfo = makeDirectPathConditionsfxn () in
        Call(None, Lval(var p), [], !currentLoc)



(* main1 function prototype *)
let makeMain1fxn () : varinfo = 
        let v = makeGlobalVar !oldMainFunctionName 
                    (TFun(voidType, Some [],
                             true, [])) in
         v


let mkmain1fxn () : instr = 
  let p: varinfo = makeMain1fxn () in
        Call(None, Lval(var p), [], !currentLoc)


(* prototype for createCDG function *)
let makecreateCDGFunction () : varinfo = 
        let v = makeGlobalVar "createCDG"
                    (TFun(voidType, Some [],
                             true, [])) in
         v

let mkCDGcreatefxn () : instr = 
  let i: varinfo = makecreateCDGFunction () in 
  Call(None, Lval(var i), [], !currentLoc)


(* prototype for printArray function *)
let makePrintArrayFunction () : varinfo = 
        let v = makeGlobalVar "printArray"
                    (TFun(voidType, Some [],
                             true, [])) in
         v

let mkprintarrayfxn () : instr = 
  let i: varinfo = makePrintArrayFunction () in 
  Call(None, Lval(var i), [], !currentLoc)




let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 

let currentFunc: string ref = ref ""

let helperpathsym (f: file) : unit =
 let fname = !Param.func in
  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc)->

              if fdec.svar.vname=fname then
                begin
                   funcn := [fdec.svar];
                   formals := List.map (fun v -> v2e v) fdec.sformals;
                end;

           if fdec.svar.vname="main" then 
           begin      
                           
                    let pre = mkmainfxn () in                 
                    let fcall =  (mkBlock (fdec.sbody.bstmts @ [mkStmtOneInstr (mkCDGcreatefxn ()) ;(*mkStmtOneInstr (mkprintarrayfxn ()); *)mkStmtOneInstr (mkcreatetablefxn ()); mkStmtOneInstr pre ; (*mkStmtOneInstr (mkdirectPathConditionsfxn ())*)])) in
                       fdec.sbody <- fcall
           end

     
          
    | _ -> ()
  in
  Stats.time "helperpathsym" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "helperpathsym";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = helperpathsym;
    fd_post_check = true
  } 


