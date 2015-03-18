open Pretty
open Cil
open Trace
module S = String
module L = List
module E = Errormsg

let i2s (i : instr) : stmt = mkStmt(Instr [i])
let v2e (v : varinfo) : exp = Lval(var v)
let constS2e (s : string) : exp = Const(CStr(s))
let il : instr list ref = ref []
let fvar = ref (None: file option) ;;
  

let changeFormals (fd : fundec) : unit =
  if fd.svar.vname <> "main" then
     List.iter (fun sf ->
     		sf.vname <- fd.svar.vname ^ "_" ^ sf.vname )
     fd.sformals;
     setFormals fd fd.sformals


type functions = {
  mutable funcEntry_instfun : varinfo;
  mutable funcExit_instfun : varinfo;
}

let dummyVar = makeVarinfo false "_tut_foo" voidType


let instfuns = {
  funcEntry_instfun = dummyVar;
  funcExit_instfun = dummyVar;
}

let funcEntry_instfun_str = "funcEntry"
let funcExit_instfun_str = "funcExit"

let inst_function_names = [
  funcEntry_instfun_str;
  funcExit_instfun_str;
 ]

let isinstFun (name : string) : bool =
  L.mem name inst_function_names
  
let mkFunTyp (rt : typ) (args : (string * typ) list) : typ =
  TFun(rt, Some(L.map (fun a -> (fst a, snd a, [])) args), false, [])
  
let initInstFunctions (f : file) : unit =
  let focf : string -> typ -> varinfo = findOrCreateFunc f in
  let instf_type = mkFunTyp voidType ["format",charPtrType; "args",charPtrType; "funcName", charPtrType] in
  instfuns.funcEntry_instfun <- focf funcEntry_instfun_str instf_type;
  let focf : string -> typ -> varinfo = findOrCreateFunc f in
  let instf_type = mkFunTyp voidType ["funcName", charPtrType] in
  instfuns.funcExit_instfun <- focf funcExit_instfun_str instf_type
  

let makeInstrStmts (func : varinfo) (argsList : exp list) (loc : location)
                   : instr =
  Call(None, v2e func, argsList, loc)

let rec analysisHelper (a : (string * typ * attributes) list) : (string * string) list  =
    match a with
    | [] -> []
    | head :: tail -> 
    	let (s,t,_) = head in
	let tp = Pretty.sprint max_int (d_type () t) in
	[(s, tp)] @ (analysisHelper tail)
    	

let analyse (funcexp : exp) : ((string * string) list) * string =
  let (a,b,_,_) = splitFunctionType (typeOf funcexp) in
    (* a contains the return type *)
    let al = argsToList b in
    analysisHelper al, Pretty.sprint max_int (d_exp () funcexp)
  
  
let genArgString (explist : exp list) : (string * string) list = 
  let argActual = ref [] in
  List.iter (fun e ->
  		match e with
 		|Lval l -> 
    			let (lh,_) = l in begin
      			match lh with
      			|Var v -> 
      				let vt = Pretty.sprint max_int (d_type () v.vtype) in
      				(*argString := !argString ^ "(variable," ^ v.vname ^ "," ^ vt ^ ") "*)
      				argActual := !argActual @ [(v.vname, "variable")]
      			|_ -> ()
      			end
  		|Const c ->
  			begin
  			match c with
  			|CChr ch -> 
  				(*argString := !argString ^ "(constant," ^ (Printf.sprintf "%c" ch) ^ ",char) "*)
  				argActual := !argActual @ [((Printf.sprintf "%c" ch), "constant")]
  			|CReal (f,_,_) ->
  				(*argString := !argString ^ "(constant," ^ (Printf.sprintf "%f" f) ^ ",double) "*)
  				argActual := !argActual @ [((Printf.sprintf "%f" f), "constant")]
  			|CInt64 (i,_,_) ->
  				(*argString := !argString ^ "(constant," ^ (Printf.sprintf "%Ld" i) ^ ",int)"*)
  				argActual := !argActual @ [((Printf.sprintf "%Ld" i), "constant")]
  			|_ -> ()
  			end
  		|CastE (t,e1) ->
  			let tp = Pretty.sprint max_int (d_type () t) in begin
  			match e1 with
  			|Lval l -> 
    				let v1 = Pretty.sprint max_int (d_lval () l) in
    				(*argString := !argString ^ "(variable," ^ v1 ^ "," ^ tp ^ ") "*)
    				argActual := !argActual @ [(v1, "variable")]
  			|Const c ->
  				let v1 = Pretty.sprint max_int (d_const () c) in
  				(*argString := !argString ^ "(constant," ^ v1 ^ "," ^ tp ^ ") "*)
  				argActual := !argActual @ [(v1, "constant")]
  			|_ -> ()
  			end
  		|_ -> E.log "non const non lval which is %a\n" d_exp e)
  explist;
  !argActual
  
let programFlagVi : varinfo list ref = ref []
let funcSig : exp list ref = ref []

let generateIfStmt () : stmt =
  if (List.length !programFlagVi > 0) && (List.length !funcSig > 0) then begin
 	 E.log "length is positive\n";
 	 let (rt,_,_,_) = splitFunctionType (typeOf (List.nth !funcSig 0)) in
 	 let cond = BinOp(Eq, (v2e (List.nth !programFlagVi 0)), integer 1, intType) in
 	 mkStmt (If(cond,(mkBlock [mkStmt (Return(Some(CastE(rt,integer 0)),locUnknown))]),(mkBlock []),locUnknown))
  end
  else begin
 	 E.log "length is 0\n";
 	 mkEmptyStmt ()
  end
  
let rec processBlock (blk : block) : unit =
  List.iter (fun st ->
	     match st.skind with
	     |Instr (iList) ->
	   	List.iter (fun inst ->	
	   		   match inst with
	     		      |Call (lv,funcsignexp,expList,loc) ->
	     		        let fnam = Pretty.sprint max_int (d_exp () funcsignexp) in
				if (List.mem fnam !Param.func_list) then begin
	                        funcSig := [] ; 
	                        funcSig := !funcSig @ [funcsignexp];
	                        let (formals,funcName),actuals = (analyse funcsignexp), (genArgString expList) in
	                        let str = ref "" in begin
	                        	E.log "%s: " funcName;
	                        	if (List.length formals) == (List.length actuals) then begin
	                        	List.iter2 (fun a b ->
	                        			let (fp,t) = a in
	                        			let (ap,corv) = b in
	                        			str := !str ^ "(" ^ (String.trim t) ^ "," ^ fp ^ "," ^ corv ^ "," ^ ap ^ ") ")
	                        	formals actuals
	                        	end;
	                        	E.log "%s\n" !str;
	                        	let f = "(type,formals,actuals,CorV)" in
	                        	let p = String.trim !str in
	                        	let func = funcName in begin
	                        		let instrumentEntryFunc = makeInstrStmts instfuns.funcEntry_instfun ([constS2e f] @ [constS2e p] @ [constS2e func]) loc in
	                        		let instrumentExitFunc = makeInstrStmts instfuns.funcExit_instfun [constS2e func] loc in
	                        		il := !il @ [instrumentEntryFunc] @ [inst] @ [instrumentExitFunc];	
	                        	end
	                        end;
	                        end
	                        else begin
	                        	il := !il @ [inst]
	                        end;	 
	                        ()
	     		      |_ -> 
	     		        il := !il @ [inst];
	     		        ())
  	       iList;
  	       E.log "lenght of funcSig %d\n" (List.length !funcSig);
  	       st.skind <- Block (mkBlock [mkStmt (Instr !il); generateIfStmt ()]);
  	       il := [];    
	       ()
             |If (_,ib,eb,_) ->
	       processBlock ib;
	       processBlock eb;
	       ()
	     |Loop (bl,_,_,_) ->
	       processBlock bl;
	       ()
	     |Block (bl) ->
	       processBlock bl;
	       () 
	     |_ -> ())
  blk.bstmts


let addCallInstr (f : file) : unit =
  initInstFunctions f;
  programFlagVi := !programFlagVi @ [makeGlobalVar "programFlag" intType];
  E.log "lenght of programFlagVi %d\n" (List.length !programFlagVi);
  f.globals <- GVar(List.nth !programFlagVi 0, {init=None}, locUnknown) :: f.globals;
  List.iter (fun g ->
	     match g with
	     |GFun (fd, loc) ->
	       if (List.mem fd.svar.vname !Param.func_list) then begin
	          E.log "Running on: %s\n" fd.svar.vname;
	          changeFormals fd;
	          processBlock fd.sbody
	       end;
	       if fd.svar.vname = "main1" then begin
	          E.log "main1 found\n";
	          fd.sbody.bstmts <- (mkStmtOneInstr (Set(var (List.nth !programFlagVi 0), zero, locUnknown))) :: fd.sbody.bstmts
	       end
	     |_ -> ())
  f.globals

let feature : featureDescr = 
  { fd_name = "tutcil";
    fd_enabled = ref false;
    fd_description = "instrument Entry/Exit functions";
    fd_extraopt = [];
    fd_doit = addCallInstr;
    (*fd_doit = addCallInstr;*)
    fd_post_check = true
  }
