open Pretty
open Cil
open Trace
module S = String
module L = List
module E = Errormsg

let i2s (i : instr) : stmt = mkStmt(Instr [i])
let v2e (v : varinfo) : exp = Lval(var v)
let constS2e (s : string) : exp = Const(CStr(s))
let addEntryToSymbolTable = ref "add_entryToSTable"


type functions = {
  mutable funcEntry_instfun : varinfo;
  mutable funcExit_instfun : varinfo;
}

let dummyVar = makeVarinfo false "_tut_exit" voidType


let instfuns = {
  funcEntry_instfun = dummyVar;
  funcExit_instfun = dummyVar;
}

let funcEntry_instfun_str = "funcEntry"
let funcExit_instfun_str = "funcExit"

let mkFunTyp (rt : typ) (args : (string * typ) list) : typ =
  TFun(rt, Some(L.map (fun a -> (fst a, snd a, [])) args), false, [])
  
let initInstFunctions (f : file) : unit =
  let focf : string -> typ -> varinfo = findOrCreateFunc f in
  let instf_type = mkFunTyp voidType ["format",charPtrType; "args",charPtrType; "funcName", charPtrType] in
  instfuns.funcEntry_instfun <- focf funcEntry_instfun_str instf_type;
  let focf : string -> typ -> varinfo = findOrCreateFunc f in
  let instf_type = mkFunTyp voidType [] in
  instfuns.funcExit_instfun <- focf funcExit_instfun_str instf_type
 
let makeInstrStmts (func : varinfo) (argsList : exp list) (loc : location)
                   : instr =
  Call(None, v2e func, argsList, loc) 
 
 
let varinfoList = ref [] 
let getSymVarinfo (f : file) : unit =
  List.iter (fun g ->
	     match g with
	     |GVar (vi,_,_) ->
	       if (vi.vname = "ret_SymValue") then 
	       		varinfoList := !varinfoList @ [vi]
	     |_ -> ())
  f.globals

(* values are repeating twice hence varinfo[0] and varinfo[3] are used sym sym con con *) 
let getConVarinfo (f : file) : unit =
  List.iter (fun g ->
	     match g with
	     |GVar (vi,_,_) ->
	       if (vi.vname = "ret_ConValue") then 
	       		varinfoList := !varinfoList @ [vi]
	     |_ -> ())
  f.globals

(* prototype for add_entryToSTable() *)
let makeSTableEntryFunction () : varinfo = 
        let v = makeGlobalVar !addEntryToSymbolTable 
                    (TFun(voidType, Some [("s1", charConstPtrType, []);
                                         ("s2", charConstPtrType, []);
                                         ("val", voidPtrType, []);
                                         ("address", voidPtrType, []);
                                         ("type", intType, []); ],
                             true, [])) in
         v

let mkstableEntryfxn2 (s1 : string) (e1 : exp) (e2 : exp) (e3 : exp) (t : int) : instr = 
  let i: varinfo = makeSTableEntryFunction () in 
  Call(None, v2e i, [mkString s1; e1; e2; e3; integer t] , locUnknown)

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

class entryEntryVisitorClass (fdec : fundec) = object (self)
  inherit nopCilVisitor                        
  method vinst (i : instr) = begin
      match i with
      
      | Call (lv,f,expList,loc) -> 
         let fnam = Pretty.sprint max_int (d_exp () f) in
	   if (List.mem fnam !Param.func_list && fnam <> !Param.func(* && (List.length expList) > 0*)) then begin 
	     let (formals,funcName),actuals = (analyse f), (genArgString expList) in
	                        let str = ref "" in begin
	                            if (List.length formals) == (List.length actuals) then begin
	                        	List.iter2 (fun a b ->
	                        		    let (fp,t) = a in
	                        		    let (ap,corv) = b in
	                        		    str := !str ^ "(" ^ (String.trim t) ^ "," ^ fp ^ "," ^ corv ^ "," ^ ap ^ ") ")
	                        		   formals actuals
	                              end;
	                            let f = "(type,formals,actuals,CorV)" in
	                            let p = String.trim !str in
	                            let func = funcName in begin
	                        	let instrumentEntryFunc = makeInstrStmts instfuns.funcEntry_instfun ([constS2e f] @ [constS2e p] @ [constS2e func]) loc in
	                        		ChangeTo [instrumentEntryFunc;i]	
	                              end
	                          end;
	                      end
           else 
           	 ChangeTo[i]
      
      
      |_  -> DoChildren
      
  end
end  


 
class entryExitVisitorClass (fdec : fundec) = object (self)
  inherit nopCilVisitor                        
  method vinst (i : instr) = begin
      match i with
      
      | Call (Some (Var vi, NoOffset),f,_,loc) -> 
         let fnam = Pretty.sprint max_int (d_exp () f) in
	   if (List.mem fnam !Param.func_list && fnam <> "main1") then begin 
	     let varName = vi.vname in 
               let instrumentExitFunc = makeInstrStmts instfuns.funcExit_instfun [] loc in
                 let t = (match vi.vtype with
                                     | TInt(_,_) -> 1
                                     | TFloat(_,_) -> 2
                                     | TPtr (_,_) -> 1
                                     | _ -> -1) in
                      let pre = mkstableEntryfxn2 (vi.vname) (v2e (List.nth !varinfoList 0)) (v2e (List.nth !varinfoList 2)) (AddrOf(Var vi, NoOffset)) t  in 
                             ChangeTo [i;pre;instrumentExitFunc]
                             (*ChangeTo[i;instrumentExitFunc]*)
           end
           else 
           	 ChangeTo[i]
      
      |Call(None,f,_,loc) ->
         let fnam = Pretty.sprint max_int (d_exp () f) in
	   if (List.mem fnam !Param.func_list && fnam <> !Param.func) then begin 
	     let instrumentExitFunc = makeInstrStmts instfuns.funcExit_instfun [] loc in
               ChangeTo [i;instrumentExitFunc]
           end
           else
               ChangeTo[i]
      
      |_  -> DoChildren
      
  end
end  


let entryExit (f : file) : unit =
   initInstFunctions f;
   getSymVarinfo f;
   getConVarinfo f;
   List.iter (fun f -> E.log "%s " f.vname) !varinfoList ;
   List.iter (fun g ->
	     match g with
	     |GFun (fd, loc) ->
	       if (List.mem fd.svar.vname !Param.func_list) then begin
	          if fd.svar.vname <> "main" then 
	          
	          let entryExitVisitor = new entryExitVisitorClass fd in
       		  ignore (visitCilFunction entryExitVisitor fd);
       		  
       		  let entryEntryVisitor = new entryEntryVisitorClass fd in
       		  ignore (visitCilFunction entryEntryVisitor fd)
	       
	       end
	     |_ -> ())
  f.globals


let feature : featureDescr = 
  { fd_name = "entryExit";
    fd_enabled = ref false;
    fd_description = "instruments funcEntry and funcExit functions";
    fd_extraopt = [];
    fd_doit = entryExit;
    fd_post_check = true
  }