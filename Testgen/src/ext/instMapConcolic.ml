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
  mutable mapConcolicValues_instFun : varinfo;
}

let dummyVar = makeVarinfo false "_tut_map" voidType


let instfuns = {
  mapConcolicValues_instFun = dummyVar;
}

let mapConcolicValues_instFun_str = "mapConcolicValues"

let mkFunTyp (rt : typ) (args : (string * typ) list) : typ =
  TFun(rt, Some(L.map (fun a -> (fst a, snd a, [])) args), false, [])
  
let initInstFunctions (f : file) : unit =
  let focf : string -> typ -> varinfo = findOrCreateFunc f in
  let instf_type = mkFunTyp voidType ["retVarName",charPtrType; "concValue",voidPtrType ] in
  instfuns.mapConcolicValues_instFun <- focf mapConcolicValues_instFun_str instf_type
 
let makeInstrStmts (func : varinfo) (argsList : exp list) (loc : location)
                   : instr =
  Call(None, v2e func, argsList, loc) 
 
 
class mapConcValVisitorClass (fdec : fundec) = object (self)
  inherit nopCilVisitor                        
  method vstmt (s : stmt) = begin
      match s.skind with
      
      |Return (Some (Lval(lv)),loc) ->
       
        let instrumentMapConcolicValues = makeInstrStmts instfuns.mapConcolicValues_instFun [constS2e (Pretty.sprint max_int (d_lval () lv)); (mkAddrOf lv)] loc in
        let oneInstStmt = mkStmtOneInstr instrumentMapConcolicValues in
        s.skind <- Block ( mkBlock [oneInstStmt; mkStmt (Return(Some (Lval(lv)),loc))] ) ;
        ChangeTo (s)
        
      |_  -> DoChildren  
      
  end
end  



let instMapConcolic (f : file) : unit =
   initInstFunctions f;
   List.iter (fun g ->
	     match g with
	     |GFun (fd, loc) ->
	       if (List.mem fd.svar.vname !Param.func_list) then begin
	          if fd.svar.vname <> !Param.func then 
	          (*E.log "Running mapConcVal on: %s\n" fd.svar.vname;*)
	          let mapConcValVisitor = new mapConcValVisitorClass fd in
       		  ignore (visitCilFunction mapConcValVisitor fd)
	       end
	     |_ -> ())
  f.globals


let feature : featureDescr = 
  { fd_name = "instMapConcolic";
    fd_enabled = ref false;
    fd_description = "instruments the functions that maps concolic values to temp globals";
    fd_extraopt = [];
    fd_doit = instMapConcolic;
    fd_post_check = true
  }
