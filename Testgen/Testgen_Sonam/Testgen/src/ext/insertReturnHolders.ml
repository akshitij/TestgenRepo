open Pretty
open Cil
open Trace
module S = String
module L = List
module E = Errormsg

let retviList : varinfo list ref = ref []

let insertReturnHolders (f : file) : unit =
  retviList := !retviList @ [makeGlobalVar "ret_ConValue" voidPtrType];
  retviList := !retviList @ [makeGlobalVar "ret_SymValue" charPtrType];
  f.globals <- GVar(List.nth !retviList 0, {init=None}, locUnknown) :: f.globals;
  f.globals <- GVar(List.nth !retviList 1, {init=None}, locUnknown) :: f.globals

let feature : featureDescr = 
  { fd_name = "insertReturnHolders";
    fd_enabled = ref false;
    fd_description = "inserts global container for concolic mapping of return values";
    fd_extraopt = [];
    fd_doit = insertReturnHolders;
    fd_post_check = true
  }
