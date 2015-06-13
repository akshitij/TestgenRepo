open Cil

module E = Errormsg
module L = List

let changeFor1FixInstr (i : instr) : bool = 
   match i with
    | Set((Var vi, NoOffset), _ , loc)
         when vi.vname = "deleted" ->
      E.log "%a: Deleted assignment: %a, type = %a\n" d_loc loc d_instr i d_type vi.vtype;
      false
    | _ -> true

let rec changeFor1FixStmt (s : stmt) : unit = 
   match s.skind with
    | Instr i1 ->
      s.skind <- Instr(L.filter changeFor1FixInstr i1)
    | If(e,tb,fb,l) ->
       changeFor1FixBlock tb;
       changeFor1FixBlock fb;
      E.log "condition is %a, %a\n" d_exp e d_stmt s;
    | Loop(blk1, loc, s1, s2) ->

    | _ -> ()

and changeFor1FixBlock (b : block) : unit = L.iter changeFor1FixStmt b.bstmts

let changeFor1FixFunction (fd : fundec) : unit = changeFor1FixBlock fd.sbody

let changeFor1 (f:file) : unit = 
   L.iter (fun g ->
      match g with
       |GFun (fd, loc)->
        changeFor1FixFunction fd
       | _ -> ())
   f.globals

let feature : featureDescr = 
  { fd_name = "changeFor1";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = changeFor1;
    fd_post_check = true
  } 

