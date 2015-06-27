open Pretty
open Cil
open Trace
open Printf
module E = Errormsg
module H = Hashtbl
module L = List

class handleCallsVisitorClass (fdec : fundec) = object (self)
  inherit nopCilVisitor                        
  method vinst (i : instr) = begin
      match i with
			   
      |Call(_,f,_,_) ->
        let fnam = Pretty.sprint max_int (d_exp () f) in
	if (fnam = !Param.func) then 
	    ChangeTo []
        else
          ChangeTo[i]
		  
      |_  -> DoChildren
	       
    end
end  


let handleCalls (f : file) : unit =
  List.iter (fun g ->
	     match g with
	     |GFun (fd, loc) ->
	       if ((List.mem fd.svar.vname !Param.func_list) && (fd.svar.vname <> !Param.func)) then
	        let handleCallsVisitor = new handleCallsVisitorClass fd in
       		  ignore (visitCilFunction handleCallsVisitor fd);
       		     
	     |_ -> ())
	    f.globals


let feature : featureDescr = 
  { fd_name = "handleCalls";
    fd_enabled = ref false;
    fd_description = "handles program with global variables";
    fd_extraopt = [];
    fd_doit = handleCalls;
    fd_post_check = true
  }
