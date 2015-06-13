open Cil 
open Pretty

module L = List

let i2s (i : instr) : stmt = mkStmt(Instr [i])

let v2e (v : varinfo) : exp = Lval(var v)

type functions = {
  mutable main_fxn : varinfo;
}


let dummyVar = makeVarinfo false "_tut_foo" voidType


let tutfuns = {
 main_fxn = dummyVar;

}


let main_fxn_str = "main"


let tut_function_names = [
  main_fxn_str;
 ]

let isTutFun (name : string) : bool =
  L.mem name tut_function_names


let mkFunTyp (rt : typ) (args : (string * typ) list) : typ =
  TFun(rt, Some(L.map (fun a -> (fst a, snd a, [])) args), false, [])


let initTutFunctions (f : file) : unit =
  let focf : string -> typ -> varinfo = findOrCreateFunc f in
  let bl_type = mkFunTyp voidType [] in
  tutfuns.main_fxn <- focf main_fxn_str bl_type

let makeInstrStmts (counter : varinfo) (loc : location)
                   : stmt * stmt * stmt * stmt =
  let f, l = mkString loc.file, integer loc.line in
  i2s (Call(None, v2e tutfuns.begin_loop, [f; l], loc)),
  i2s (Set(var counter, zero, loc)),
  i2s (Set(var counter,BinOp(PlusA, v2e counter, one, counter.vtype), loc)),
  i2s (Call(None, v2e tutfuns.end_loop, [f; l; v2e counter], loc))



class loopInstrumenterClass (fd : fundec) = object(self)
  inherit nopCilVisitor

  method vstmt (s : stmt) =
    let action s =
      match s.skind with
      | Loop(b, loc, co, bo) ->
        let counter = makeTempVar fd intType in
        let ss, cis, is, es = makeInstrStmts counter loc in
        b.bstmts <- is :: b.bstmts;
        let nb = mkBlock [ss; cis; mkStmt s.skind; es] in
        s.skind <- Block nb;
        s
      | _ -> s
    in
    ChangeDoChildrenPost(s, action)

end

let processFunction (fd : fundec) (loc : location) : unit =
   let vis = new loopInstrumenterClass fd in
   ignore(visitCilFunction vis fd)

let instrument (f:file) : unit = 
   L.iter (fun g ->
      match g with
       |GFun (fd, loc) -> processFunction fd loc
       | _ -> ())
   f.globals

let feature : featureDescr = 
  { fd_name = "instrument";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = instrument;
    fd_post_check = true
  } 

















