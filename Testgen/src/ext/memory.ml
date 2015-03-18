open Pretty
open Cil
module E = Errormsg
module H = Hashtbl

(* David Park at Stanford points out that you cannot take the address of a
 * bitfield in GCC. *)

(* Returns true if the given lvalue offset ends in a bitfield access. *) 
let rec is_bitfield lo = match lo with
  | NoOffset -> false
  | Field(fi,NoOffset) -> not (fi.fbitfield = None)
  | Field(_,lo) -> is_bitfield lo
  | Index(_,lo) -> is_bitfield lo 

(* Return an expression that evaluates to the address of the given lvalue.
 * For most lvalues, this is merely AddrOf(lv). However, for bitfields
 * we do some offset gymnastics. 
 *)
let addr_of_lv (lh,lo) = 
  if is_bitfield lo then begin
    (* we figure out what the address would be without the final bitfield
     * access, and then we add in the offset of the bitfield from the
     * beginning of its enclosing comp *) 
    let rec split_offset_and_bitfield lo = match lo with 
      | NoOffset -> failwith "logwrites: impossible" 
      | Field(fi,NoOffset) -> (NoOffset,fi)
      | Field(e,lo) ->  let a,b = split_offset_and_bitfield lo in 
                        ((Field(e,a)),b)
      | Index(e,lo) ->  let a,b = split_offset_and_bitfield lo in
                        ((Index(e,a)),b)
    in 
    let new_lv_offset, bf = split_offset_and_bitfield lo in
    let new_lv = (lh, new_lv_offset) in 
    let enclosing_type = TComp(bf.fcomp, []) in 
    let bits_offset, bits_width = 
      bitsOffset enclosing_type (Field(bf,NoOffset)) in
    let bytes_offset = bits_offset / 8 in 
    let lvPtr = mkCast ~e:(mkAddrOf (new_lv)) ~newt:(charPtrType) in
    (BinOp(PlusPI, lvPtr, (integer bytes_offset), ulongType))
  end else (AddrOf (lh,lo)) 

class logWriteVisitor = object
  inherit nopCilVisitor
  (* Create a prototype for the logging function, but don't put it in the 
   * file *)
  val printfFun =   
    let fdec = emptyFunction "syslog" in
    fdec.svar.vtype <- TFun(intType, 
                            Some [ ("prio", intType, []);
                                   ("format", charConstPtrType, []) ], 
                            true, []);
    fdec

  method vinst (i: instr) : instr list visitAction = 
    match i with 
      Set(lv, e, l) -> begin
        (* Check if we need to log *)
        match lv with 
          (Var(v), off) when not v.vglob -> SkipChildren
        | _ -> let str = Pretty.sprint 80 
                (Pretty.dprintf "Write %%p to 0x%%08x at %%s:%%d (%a)\n" d_lval lv)
              in 
              ChangeTo 
              [ Call((None), (Lval(Var(printfFun.svar),NoOffset)), 
                     [ one ; 
                       mkString str ; e ; addr_of_lv lv; 
                       mkString l.file; 
                       integer l.line], locUnknown);
              i]
      end 
    | Call(Some lv, f, args, l) -> begin
        (* Check if we need to log *)
        match lv with 
          (Var(v), off) when not v.vglob -> SkipChildren
        | _ -> let str = Pretty.sprint 80 
                (Pretty.dprintf "Write retval to 0x%%08x at %%s:%%d (%a)\n" d_lval lv)
              in 
              ChangeTo 
              [ Call((None), (Lval(Var(printfFun.svar),NoOffset)), 
                     [ one ; 
                       mkString str ; AddrOf lv; 
                       mkString l.file; 
                       integer l.line], locUnknown);
              i]
      end 
    | _ -> SkipChildren

end

let feature : featureDescr = 
  { fd_name = "logwrites";
    fd_enabled = Cilutil.logWrites;
    fd_description = "generation of code to log memory writes";
    fd_extraopt = [];
    fd_doit = 
    (function (f: file) -> 
      let lwVisitor = new logWriteVisitor in
      visitCilFileSameGlobals lwVisitor f);
    fd_post_check = true;
  } 

