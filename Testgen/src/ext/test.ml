open Cil
open Pretty

module E = Errormsg

let do_test (f: file) =
  let doGlobal = function
    | GFun (fdec, loc)  -> 
      if fdec.svar.vname="main" then
        E.log "Inside function \n";
        List.iter(
          function v ->
            match v.vtype with
            | TInt(_, _) -> E.log " It's int \n"
            | TFloat(_, _) -> E.log " It's float \n"
            | TPtr(t, _) -> E.log " It's ptr: of TYPE : ";
              begin match t with 
              | TPtr(_, _ ) -> E.log "PTR again ... \n"
              | TNamed(t, _ ) -> E.log "TNamed name : ";
                E.log "%s \n" t.tname;
                E.log "TYPE %a \n" d_type t.ttype                  
              | _ -> E.log "Dont know ... \n"
              end
            | _ -> E.log " something else \n"
        ) fdec.slocals;
    | _ -> ()
  in
  Stats.time "test" (iterGlobals f) doGlobal
    
let feature = {
  fd_name = "Test";
  fd_enabled = ref false;
  fd_description = "Test Module";
  fd_extraopt = [];
  fd_doit = do_test;
  fd_post_check = false
 }
