open Pretty
open Cil
open Trace
module S = String
module L = List
module E = Errormsg
let count = ref 0
let instrlist =ref [] 
let lst =ref []
let ilst =ref []

let rec delbreak (ifblk : block) : unit =
List.iter(
       function sta -> 
	match sta.skind with
	|Break(_) -> E.log "Inner Break Found"
	|_-> ilst := !ilst @ [sta];

)ifblk.bstmts

let rec loopblock (lblock :block) : unit =
List.iter
(  function stat-> 
       match stat.skind with
       |Break(_) -> 
	E.log " My break";
       
       |If (_,ib,eb,_) -> 
         E.log "If Found" ;
         delbreak ib ;
	 ib.bstmts <- !ilst;
         lst := !lst @ [stat];
         lst := [] ;
	 (*delbreak ib ;*)
               
       |_ -> lst := !lst @ [stat] ;     
)lblock.bstmts




let  rec printstatement (blk : block) : unit =
List.iter
( function statemt->
   match statemt.skind with
   |Loop(loopstmts,_,_,_)-> E.log "Loop Found\n"; 
        loopblock loopstmts ;
        loopstmts.bstmts <- !lst ;
        instrlist := !instrlist @ [statemt];
        lst := [] ;
        (*printstatement loopstmts ;*)
       
   |_ -> instrlist := !instrlist @ [statemt]

)blk.bstmts;
blk.bstmts <- !instrlist

let printstmt (f: file) : unit =
List.iter (
function g ->
match g with
|GFun(fd, loc) -> if (List.mem fd.svar.vname !Param.func_list) then begin
                    E.log "Function to remove Break is called !!! \n";
                    count := !count +1 ;
                    (*prepareCFG fd ;*)
                    E.log "Number of functions = %d\n" !count;
                    printstatement fd.sbody;
                    end
|_ ->()
)f.globals

let feature : featureDescr = 
  { fd_name = "handleBreak";
    fd_enabled = ref false;
    fd_description = "Print statement list";
    fd_extraopt = [];
    fd_doit = printstmt;
    (*fd_doit = addCallInstr;*)
    fd_post_check = true
  }
