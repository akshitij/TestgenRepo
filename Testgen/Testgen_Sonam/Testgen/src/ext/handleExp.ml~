open Pretty
open Cil
open Trace
module S = String
module L = List
module E = Errormsg

let i2s (i : instr) : stmt = mkStmt(Instr [i])
let v2e (v : varinfo) : exp = Lval(var v)
let constS2e (s : string) : exp = Const(CStr(s))


let getArgTypes (fsig : exp) : typ list =
  let typlist = ref [] in
  let proto = typeOf fsig in
    match proto with
    |TFun (_,a,_,_) ->
      let actArgs = argsToList a in
        begin
          List.iter (fun (a,t,c) ->
        	      typlist := !typlist @ [t]
          )actArgs;
          !typlist
      	end
    | _ -> []
      	


class handleReturnExpVisitorClass (fdec : fundec) = object (self)
  inherit nopCilVisitor                        
  method vstmt (s : stmt) = begin
      match s.skind with
      
      |Return (Some e,loc) ->
       
       (match e with
        | Lval (Var v, NoOffset) -> SkipChildren
        | _ -> 
        
          let tmp = (match fdec.svar.vtype with
          	   	| TFun(t,_,_,_) ->
          	       	  (match t with 
          	       	    |TInt (_,_) -> makeTempVar fdec intType  
          	            |TFloat (_,_) -> makeTempVar fdec intType
          	            |TPtr (_,_) -> makeTempVar fdec intPtrType
          	            |_ -> makeTempVar fdec voidPtrType
          	          )
          	   	| _ -> makeTempVar fdec voidPtrType 
          	    ) in
            let setTmpStmt = mkStmtOneInstr (Set((var tmp), e, loc)) in
              s.skind <- Block ( mkBlock [setTmpStmt; mkStmt (Return(Some (v2e tmp),loc))] ) ;
	        ChangeTo (s)
        )
      |_  -> DoChildren  
      
  end
end  

class handleFuncArgVisitorClass (fdec : fundec) = object (self)
  inherit nopCilVisitor                        
  method vinst (i : instr) = begin
      match i with
      
      | Call (lv,f,expList,loc) -> 
      	   let fnam = Pretty.sprint max_int (d_exp () f) in
	   if (List.mem fnam !Param.func_list && (List.length expList) > 0) then begin 
	     let newArgs = ref [] in
	     let setInst = ref [] in
	     let argExps = expList in
	     let argTypes = getArgTypes f in
	        if (List.length argExps) == (List.length argTypes) then begin
	          List.iter2 (fun a b ->
	              		    match a with
	               		    |Lval (Var v, _) -> 
	              		    		newArgs := !newArgs @ [a]
	              		    | _ -> 
	            		    		let tmp = (makeTempVar fdec b) in
	          		   		let setTmpInst = (Set((var tmp), a, loc)) in
	               		    		begin
	               		    		  setInst := !setInst @ [setTmpInst];
	               		    		  newArgs := !newArgs @ [v2e tmp]
	              		    		end
	                        		    
	          ) argExps argTypes
                end;
	        ChangeTo (!setInst @ [Call(lv,f, !newArgs,loc)])	
	   end
           else 
           	 ChangeTo[i]
      
      
      |_  -> DoChildren
      
  end
end  

let handleExp (f : file) : unit =
   List.iter (fun g ->
	     match g with
	     |GFun (fd, loc) ->
	       if (List.mem fd.svar.vname !Param.func_list) then begin
	          (*if (*fd.svar.vname <> "main1"*) fd.svar.vname <> !Param.func then*) 
	          (*E.log "Running handleExp on: %s\n" fd.svar.vname;*)
	          let handleReturnExpVis = new handleReturnExpVisitorClass fd in
       		  ignore (visitCilFunction handleReturnExpVis fd);
       		  let handleFuncArgVis = new handleFuncArgVisitorClass fd in
       		  ignore (visitCilFunction handleFuncArgVis fd)
	       end
	     |_ -> ())
  f.globals


let feature : featureDescr = 
  { fd_name = "handleExp";
    fd_enabled = ref false;
    fd_description = "handles expression during return and function calls";
    fd_extraopt = [];
    fd_doit = handleExp;
    fd_post_check = true
  }
