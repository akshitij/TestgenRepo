open Cil

module E = Errormsg
module L = List

let count = ref 0
let cstmt = ref 0

let fixInstr (i : instr) : bool = 
   match i with
    | Set((Var vi, NoOffset), _ , loc) ->
                   cstmt := !cstmt + 1;
                   false
    | _ -> cstmt := !cstmt + 1;
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
        () 

and fixBlock (b : block) : unit = L.iter fixStmt b.bstmts

let fixFunction (fd : fundec) : unit = fixBlock fd.sbody


let countFunctions (f:file) : unit = 
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
  { fd_name = "countFunctions";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = countFunctions;
    fd_post_check = true
  } 

