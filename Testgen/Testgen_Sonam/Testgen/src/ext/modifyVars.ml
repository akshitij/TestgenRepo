open Pretty
open Cil
open Trace
module S = String
module L = List
module E = Errormsg

let changeFormals (fd : fundec) : unit =
  if ((*fd.svar.vname <> "main" &&*) fd.svar.vname <> !Param.func) then begin
     List.iter (fun sf ->
     		sf.vname <- fd.svar.vname ^ "_" ^ sf.vname )
     fd.sformals;
     setFormals fd fd.sformals;
     List.iter (fun sf ->
     		sf.vname <- fd.svar.vname ^ "_" ^ sf.vname )
     fd.slocals
  end
     

let modifyVars (f : file) : unit =
   List.iter (fun g ->
	     match g with
	     |GFun (fd, loc) ->
	       if (List.mem fd.svar.vname !Param.func_list) then begin
	          E.log "Running modifyVars on: %s\n" fd.svar.vname;
	          changeFormals fd
	       end
	     |_ -> ())
  f.globals


let feature : featureDescr = 
  { fd_name = "modifyVars";
    fd_enabled = ref false;
    fd_description = "modify function variable names and adds temp return globals";
    fd_extraopt = [];
    fd_doit = modifyVars;
    (*fd_doit = addCallInstr;*)
    fd_post_check = true
  }
