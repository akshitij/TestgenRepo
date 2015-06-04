open Cil

module E = Errormsg
module L = List

let break1FixInstr (i : instr) : bool = 
   match i with
    | Set((Var vi, NoOffset), _ , loc)
         when vi.vname = "deleted" ->

      false
    | _ -> true

let rec break1FixStmt (s : stmt) : unit = 
   match s.skind with
    | Instr i1 ->
      s.skind <- Instr(L.filter break1FixInstr i1)
    | If(e,tb,fb,l) ->
       findexp e;
       break1FixBlock tb;
       break1FixBlock fb;

    | _ -> ()

and break1FixBlock (b : block) : unit = L.iter break1FixStmt b.bstmts

and findexp (e : exp) : unit =
       match e with
        | BinOp(_, exp1, exp2,_) ->  E.log " %a\n" d_exp e 
        |_ -> ()



let break1FixFunction (fd : fundec) : unit = break1FixBlock fd.sbody

let break1 (f:file) : unit = 
   L.iter (fun g ->
      match g with
       |GFun (fd, loc) ->
        break1FixFunction fd
       | _ -> ())
   f.globals

let feature : featureDescr = 
  { fd_name = "break1";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = break1;
    fd_post_check = true
  } 

