open Cil
open Pretty
open Unix
open Printf
module E = Errormsg

let func = ref ""
let filename = ref "random"  
let func_list = ref []
let file = "functions.txt"

let get_func_list (f: file) =
  let functions = List.filter (
    function g -> match g with
    | GFun(_, loc) when loc.file = !filename ^ ".c" -> true
    | _ -> false
  ) f.globals
  in
  func_list := List.map (
    function g -> match g with
    | GFun(fn, _) -> fn.svar.vname
    | _ -> ""
  ) functions 
  
let printfuncinFile () =
  
  let oc = open_out file in    
  List.iter(fun f -> fprintf oc "%s\n" f;
  )!func_list;
  close_out oc    

let init (f: file) =
  E.colorFlag := true;
  get_func_list f
    
let do_param (f: file) =
  init f;
  printfuncinFile()
    
let feature = {
  fd_name = "func";
  fd_enabled = ref false;
  fd_description = "Gets the parameters and stores those for later use";
  fd_extraopt = [
    "--param_func",
    Arg.String (fun s -> func := s),
    " The function to be tested";
    "--param_file",
    Arg.String (fun s -> filename := s),
    " Original filename";
  ];
  fd_doit = do_param;
  fd_post_check = false
 }
