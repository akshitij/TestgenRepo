open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let found = ref false
let vars = ref []

let checkIfGlobal (f : file) (varName : string) =
  found := false;
  let doGlobal = function
    | GVar (vi,_,_)  -> 
       if vi.vname = varName then begin
         found := true;
         ()
       end
         
    | _ -> ()
  in
  Stats.time "fixMainForGlobals" (iterGlobals f) doGlobal;
  !found


let fixMainForGlobals (f: file) : unit =
  let funName = !Param.func in
  let doGlobal = function
    
    | GFun (fd, loc)  -> 
       (* changing global variable names to resolve conflict *)
       if fd.svar.vname = funName then begin
         E.log "Running fixMainForGlobals on %s\n" funName;
         List.iter (fun sf ->
         		if (checkIfGlobal f sf.vname) = true then
     			  let gcopy = copyVarinfo sf ("global_" ^ sf.vname) in
			  vars := !vars @ [gcopy];
     			  ()
     			else
     			  vars := !vars @ [sf]   
     		   )
     	 fd.sformals;
         setFormals fd !vars
       end

    | _ -> ()
  in
  Stats.time "fixMainForGlobals" (iterGlobals f) doGlobal
                             
let feature : featureDescr = {
  fd_name = "fixMainForGlobals";
  fd_enabled = ref false;
  fd_description = "";
  fd_extraopt = [];
  fd_doit = fixMainForGlobals;
  fd_post_check = true
} 

