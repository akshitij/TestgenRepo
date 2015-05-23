open Pretty
open Cil
open Trace
module S = String
module L = List
module E = Errormsg

let i2s (i : instr) : stmt = mkStmt(Instr [i])
let v2e (v : varinfo) : exp = Lval(var v)
let constS2e (s : string) : exp = Const(CStr(s))

type functions = {
  mutable funcExit_instfun : varinfo;
}

let dummyVar = makeVarinfo false "_tut_exit" voidType


let instfuns = {
  funcExit_instfun = dummyVar;
}

let funcExit_instfun_str = "funcExit"

let mkFunTyp (rt : typ) (args : (string * typ) list) : typ =
  TFun(rt, Some(L.map (fun a -> (fst a, snd a, [])) args), false, [])
  
let initInstFunctions (f : file) : unit =
  let focf : string -> typ -> varinfo = findOrCreateFunc f in
  let instf_type = mkFunTyp voidType ["AssignLval", charPtrType] in
  instfuns.funcExit_instfun <- focf funcExit_instfun_str instf_type
 
let makeInstrStmts (func : varinfo) (argsList : exp list) (loc : location)
                   : instr =
  Call(None, v2e func, argsList, loc) 
 
 
class entryExitVisitorClass (fdec : fundec) = object (self)
  inherit nopCilVisitor                        
  method vinst (i : instr) = begin
      match i with
      
      | Call (Some lv,f,_,loc) -> 
         let fnam = Pretty.sprint max_int (d_exp () f) in
	   if (List.mem fnam !Param.func_list && fnam <> "main1") then begin 
	     let varName = Pretty.sprint max_int (d_lval () lv) in 
               let instrumentExitFunc = makeInstrStmts instfuns.funcExit_instfun [constS2e varName] loc in
                 ChangeTo [i;instrumentExitFunc]
           end
           else 
           	 ChangeTo[i]
      
      |Call(None,f,_,loc) ->
         let fnam = Pretty.sprint max_int (d_exp () f) in
	   if (List.mem fnam !Param.func_list && fnam <> "main1") then begin 
	     let instrumentExitFunc = makeInstrStmts instfuns.funcExit_instfun [constS2e ""] loc in
               ChangeTo [i;instrumentExitFunc]
           end
           else
               ChangeTo[i]
      
      |_  -> DoChildren
      
  end
end  


let entryExit (f : file) : unit =
   initInstFunctions f;
   List.iter (fun g ->
	     match g with
	     |GFun (fd, loc) ->
	       if (List.mem fd.svar.vname !Param.func_list) then begin
	          if fd.svar.vname <> "main" then 
	          (*E.log "Running mapConcVal on: %s\n" fd.svar.vname;*)
	          let mapConcValVisitor = new entryExitVisitorClass fd in
       		  ignore (visitCilFunction mapConcValVisitor fd)
	       end
	     |_ -> ())
  f.globals


let feature : featureDescr = 
  { fd_name = "entryExit";
    fd_enabled = ref false;
    fd_description = "instruments funcEntry and funcExit functions";
    fd_extraopt = [];
    fd_doit = entryExit;
    fd_post_check = true
  }
