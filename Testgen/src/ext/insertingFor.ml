open Cil
open Pretty

module L = List
module E = Errormsg

let zeroPtr (fd : fundec) (blv : lval) : stmt list = 
  [mkStmtOneInstr (Set(blv, CastE(voidPtrType, zero), locUnknown))]

let rec zeroType (fd : fundec) (blv : lval) : stmt list = 
    match unrollType(typeOfLval blv) with
      | TComp _ -> zeroComp fd blv
      | _ -> []

 and zeroComp (fd : fundec) (blv : lval) : stmt list = 
   let ci = 
      match unrollType(typeOfLval blv) with
       | TComp (ci, _) -> ci
       | _ -> E.s(E.bug "Expected TComp for type of %a" d_lval blv)
   in
   let s1 = L.concat (L.map (zeroField fd blv) ci.cfields)
   in
   if ci.cstruct then s1
   else if s1 != [] then [L.hd s1]
   else []

 and zeroField (fd : fundec) (blv : lval) (fi : fieldinfo) : stmt list  = 
   zeroType fd (addOffsetLval (Field(fi,NoOffset)) blv)

 and zeroArray (fd : fundec) (blv : lval) : stmt list = 
   let i = makeTempVar fd intType in
   let inits = zeroType fd (addOffsetLval (Index(Lval (Var i, NoOffset), NoOffset)) blv) in
   let first = addOffsetLval (Index(zero, NoOffset)) blv in
   Formatcil.cStmts
     "
        %l:i = sizeof(%l:arr) / sizeof(%l:first) - 1;
        while (%l:i >= 0) {
        { %S:inits }
        %l:i -= 1;
        }
    "
   (fun n t -> makeTempVar fd ~name:n t) locUnknown
   [("i", Fl(var i));
    ("arr",Fl blv);
    ("first", Fl first);
    ("inits",FS inits);]

let processFunction (fd : fundec) (loc : location) : unit = 
  let ini_stmts = L.concat (L.map (zeroType fd) (L.map var fd.slocals))
  in
  fd.sbody.bstmts <- ini_stmts @ fd.sbody.bstmts

let insertingFor (f:file) : unit = 
   L.iter (fun g ->
      match g with
       |GFun (fd, loc) -> processFunction fd loc
       | _ -> ())
   f.globals

let feature : featureDescr = 
  { fd_name = "insertingFor";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = insertingFor;
    fd_post_check = true
  } 
 











     








