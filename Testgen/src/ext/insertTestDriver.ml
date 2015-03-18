(*
 * Feature is used to instrument the program with
 * test driver that is a new "main" function and 
 * the actual main function is renamed.
 *)

open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let insertTestDriver (f: file) : unit =

  let doGlobal = function
    | GFun (fdec, loc)  -> 
       (* Renaming original "main" function to "main1" *)
       if fdec.svar.vname="main" then
         fdec.svar.vname <- "main1"
                              
    | _ -> ()
  in
  Stats.time "insertTestDriver" (iterGlobals f) doGlobal;
  
  
  (* Inserts empty global functions  *)
  f.globals <- f.globals @ [GFun((emptyFunction "getPrint"), locUnknown); 
                            GFun((emptyFunction "callInstrumentedFun"), locUnknown); 
                            GFun((emptyFunction "main"), locUnknown)]    
                             
                             
let feature : featureDescr = {
  fd_name = "insertTestDriver";
  fd_enabled = ref false;
  fd_description = "";
  fd_extraopt = [];
  fd_doit = insertTestDriver;
  fd_post_check = true
} 

