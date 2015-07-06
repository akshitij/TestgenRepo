open Pretty
open Cil
open Trace
module S = String
module L = List
module E = Errormsg


let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt

let  rec printstatement (blk : block) : unit =
List.iter
( function statemt->
   match statemt.skind with
   |Instr(ilist)-> 
	List.iter(fun inst ->
		  match inst with
	          |Call(lo, e, (a::al),_) when (d_string "%a" d_exp e)= "__assert_fail"  ->
                   E.log "#############################\n" ;
                   E.log "Error due to Assert Statement\n" ;
                   E.log "#############################\n" ;
                   assert false ;
	                             
		  |_ -> ()	  
	         )ilist 
   |If(_,ib,eb,_)->
    printstatement ib ;
    printstatement eb ;
	 
   |_ -> ()

)blk.bstmts


let fixbreak(f: file) : unit =
List.iter (
function g ->
match g with
|GFun(fd, loc) -> if (List.mem fd.svar.vname !Param.func_list) then begin
                    E.log "Function to Fix Assert  is called !!! \n";
                    (*count := !count +1 ;*)
                    (*prepareCFG fd ;*)                   
                    printstatement fd.sbody;
                    end
|_ ->()
)f.globals

let feature : featureDescr = 
  { fd_name = "handleAssert";
    fd_enabled = ref false;
    fd_description = "Print statement list";
    fd_extraopt = [];
    fd_doit = fixbreak;
    (*fd_doit = addCallInstr;*)
    fd_post_check = true
  }
