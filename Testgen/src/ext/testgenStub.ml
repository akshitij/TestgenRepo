open Pretty
open Cil
open Trace
module S = String
module L = List
module E = Errormsg
let ilst =ref []


let v2e (v : varinfo) : exp = Lval(var v)
let constS2e (s : string) : exp = Const(CStr(s))


type functions = {
  mutable testgen_exit : varinfo;
  
}

let dummyVar = makeVarinfo false "testgen_exit" voidType

let instfuns = {
  testgen_exit= dummyVar;
  
}

let testgen_exit_str = "testgen_exit"
let inst_function_names = [
  testgen_exit_str
 ]

(*let  createExitfn () : varinfo  =
      let v = makeGlobalVar "testgen_exit"
                    (TFun(voidType, Some [],
                             true, [])) in
         v

let mktestgen_exitfn() : instr =
 let i : varinfo = createExitfn () in 
Call(None, Lval(var i), [], !currentLoc)
*)

let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt


let makeInstrStmts (func : varinfo) (argsList : exp list) (loc : location) : instr =
  Call(None, v2e func, argsList, loc)

let  rec printstatement (blk : block) : unit =
List.iter
( function statemt->
   match statemt.skind with
   |Instr(ilist)-> 
	List.iter(fun inst ->
		  match inst with
	          |Call(lo, e, (a::al),loc) when (d_string "%a" d_exp e)= "exit" ->                              
                   E.log "Exit found\n" ;
                        
                   let testgen_exit = makeInstrStmts instfuns.testgen_exit [] loc in
                   ilst := !ilst @ [testgen_exit];           
                   |_ -> ilst := !ilst @ [inst];	  
	           )ilist;
statemt.skind <- Instr !ilst;
ilst := [] ;          


   |If(_,ib,eb,_)->  
   
    printstatement ib ;
    printstatement eb ;

    |Loop (bl,_,_,_) ->
     printstatement  bl;
	       ()
   |Block (bl) ->
   printstatement bl;
	       () 
	 
	 
   |_ -> ()

)blk.bstmts
 


let fixbreak(f: file) : unit =
List.iter (
function g ->
match g with
|GFun(fd, loc) -> if (List.mem fd.svar.vname !Param.func_list) then begin
                    E.log "Function to Fix exit is called !!! \n";
                    (*count := !count +1 ;*)
                    (*prepareCFG fd ;*)                   
                    printstatement fd.sbody;
                    end
|_ ->()
)f.globals

let feature : featureDescr = 
  { fd_name = "testgenStub";
    fd_enabled = ref false;
    fd_description = "Print statement list";
    fd_extraopt = [];
    fd_doit = fixbreak;
    (*fd_doit = addCallInstr;*)
    fd_post_check = true
  }
