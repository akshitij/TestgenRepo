open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let out_file = "input.txt"

let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 
    

let functions (f: file) : unit =
  let oc = open_out out_file in

 let doGlobal = function
   
    | GFun (fdec, loc) ->
        if fdec.svar.vname="main" then
           (for i = 1 to 10 do
               fprintf oc "main1\n" 
           done)
        else
          (for i = 1 to 10 do
               fprintf oc "%s\n" fdec.svar.vname 
           done)

    | _ -> ()
  in
  Stats.time "functions" (iterGlobals f) doGlobal;
      close_out oc

let feature : featureDescr = 
  { fd_name = "functions";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = functions;
    fd_post_check = true
  } 


