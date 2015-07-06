
open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl


let cnt_vars = ref 0


let filist : fieldinfo list ref = ref []

let printFunctionName = ref "printf"
let printFileFunctionName = ref "printFile"


let addProto = ref false

let str = ref ""

let v2e (v : varinfo) : exp = Lval(var v)

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
  



let makeprintFileFunction () : varinfo = 
         let v = makeGlobalVar !printFileFunctionName 
                    (TFun(voidType, Some [("s", charPtrType, [])],
                             true, [])) in
         v


let mkprintfilefxn (s: string) : instr = 
  let i: varinfo = makeprintFileFunction () in 
  Call(None, Lval(var i), [mkString s], !currentLoc)


let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 



let varUpdated (f: file) : unit =

 let fname = !Param.func in
  let doGlobal = function
   
    | GCompTag (ci, _) when ci.cname="arguments" ->
                      filist := ci.cfields

    | GFun (fdec, loc) ->   

             if fdec.svar.vname=fname then
                 begin
   
                    cnt_vars := 0;
                    str := "(benchmark res\n  :logic AUFLIA\n" ;
                   (* List.iter (fun h -> match h.ftype with
                                        |TPtr(_,_) -> cnt_vars := !cnt_vars + 1;

                                        |TFloat(_,_) ->                             
                                                      str := !str ^ "(s" ^ (d_string "%d" !cnt_vars) ^ " Real) "; 
                                                      cnt_vars := !cnt_vars + 1;                           

                                        | TInt(_,_) ->
                                   str := !str ^ "(s" ^ (d_string "%d " !cnt_vars) ^ (String.capitalize (d_string "%a" d_type h.ftype)) ^ ") ";
                                                  cnt_vars := !cnt_vars + 1;
                                        
                                        | TArray(TComp(_,_), Some e, _)->()
                      
                                      
                                        | _ -> ()
                           
                               ) !filist;

                    str := !str ^ ")\n";*)
          
           end;


          if fdec.svar.vname="getPrint" then
          begin

              let pre = (mkprintfilefxn !str) in
                 fdec.sbody.bstmts <- (mkStmtOneInstr pre) :: fdec.sbody.bstmts

          end
         
 
    | _ -> ()
  in
  Stats.time "varUpdated" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end
 

let feature : featureDescr = 
  { fd_name = "varUpdated";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = varUpdated;
    fd_post_check = true
  } 

