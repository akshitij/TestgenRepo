open Cil

module E = Errormsg
module L = List

let count = ref 0
let cset = ref 0
let ccall = ref 0
let cstmt = ref 0
let cextra = ref 0

let fixInstr (i : instr) : bool = 
   match i with
    | Set((Var vi, NoOffset), _ , loc) ->
                   cset := !cset + 1;
                   false
    | Call(_, _, _, _) ->
                   ccall := !ccall + 1;
                   false
    | _ -> cextra := !cextra + 1;
           true

let rec fixStmt (s : stmt) : unit =
   match s.skind with
   |Instr i1 ->
        s.skind <- Instr(L.filter fixInstr i1);
   |If(_,tb,fb,_) ->
       fixBlock tb;
       fixBlock fb;
       cstmt := !cstmt + 1;
   |_ ->cstmt := !cstmt + 1; 
        E.log "statement count = %d\n" !cstmt;
        E.log " Set instruction count = %d call instruction count = %d extra = %d\n" !cset !ccall !cextra;
        () 

and fixBlock (b : block) : unit = L.iter fixStmt b.bstmts

let fixFunction (fd : fundec) : unit = fixBlock fd.sbody


let countInstrns (f:file) : unit = 
   L.iter (fun g ->
      match g with
       |GFun (fd, loc) ->
        count := !count + 1;
        E.log "Name of functions is %s, count = %d\n" fd.svar.vname !count; 
        cstmt := 0; 
        fixFunction fd        

       | _ -> ())
   f.globals

let feature : featureDescr = 
  { fd_name = "countInstrns";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = countInstrns;
    fd_post_check = true
  } 

