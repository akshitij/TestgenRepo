
open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let i = ref 0
let name = ref ""

let function1 = ref "main1"

let printFunctionName = ref "printf"

let addProto = ref false

let vars: varinfo list ref = ref [] 
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
  

let makeMainfxn () : varinfo = 
       let args = List.map (fun v -> (v.vname, intType, [])) !vars in
        let v = makeGlobalVar !function1 
                    (TFun(intType, Some args,
                             true, [])) in
         v


let mkmainfxn () : instr = 
  let p: varinfo = makeMainfxn () in
      let args = List.map (fun v -> (mkCast (mkString v.vname) (TInt(IInt, [])))) !vars in 
        Call(None, Lval(var p), args, !currentLoc)




let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 

let currentFunc: string ref = ref ""

let rec operate str = 
   let len = String.length str in
     if len=0 then str
     else if str.[0]=' ' || str.[0]='&' || str.[0]='\t' then
        operate (String.sub str 1 (len-1))
     else
       str


class insertMainCallVisitorClass = object
  inherit nopCilVisitor

  
   method vinst i = begin
    match i with
    | Call(lo,e,(a::al),l) ->   
            E.log "function names: %s\n" (d_string "%a" d_exp e);
                    ChangeTo [i];
        


    | _ -> DoChildren
  end
 end

let insertMainCallVisitor = new insertMainCallVisitorClass 


let insertMainCall (f: file) : unit =

  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) when fdec.svar.vname="main"->       
                        E.log "here:%a\n" d_block fdec.sbody;
                                      ignore (visitCilFunction insertMainCallVisitor fdec);


    | _ -> ()
  in
  Stats.time "insertMainCall" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "insertMainCall";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = insertMainCall;
    fd_post_check = true
  } 


