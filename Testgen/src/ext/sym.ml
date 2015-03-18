open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let i = ref 0
let name = ref ""
let value = ref 0

let stmtlist : instr list ref = ref []

let symTable : (exp, exp) Hashtbl.t = (Hashtbl.create 100)
let v2e (v : varinfo) : exp = Lval(var v)

 

let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 

let currentFunc: string ref = ref ""


let rec expInTermsOfItself (e: exp) (l : string) = 
  match e with
   | BinOp(op, e1, e2, lo) -> (expInTermsOfItself e1 l) or (expInTermsOfItself e2 l)
   | UnOp(op, e1, lo) -> (expInTermsOfItself e1 l)
   | Lval(lv) -> if (l=(d_string "%a" d_lval lv)) then
                       true
                 else
                       false
   | _ -> false


let rec symbolicExp (e: exp) = 
  match e with
   | BinOp(op, e1, e2, l) -> BinOp(op, (symbolicExp e1), (symbolicExp e2), l)
   | UnOp(op, e1, l) -> UnOp(op,(symbolicExp e1),l)
   | Lval(lv) -> if (Hashtbl.mem symTable e) then
                     Hashtbl.find symTable e
                 else
                    e
   | _ -> e



let rec substituteDominators (s: stmt) tree = 
  match s.skind with
   | If(e,tb,fb,l) -> s.skind <- If((symbolicExp e), tb, fb, l);
                      let doms = Dominators.children tree s in
                        List.iter (fun v -> substituteDominators v tree) doms
   | _ -> ()
  



let rec symbolicExec (s: stmt) tree = 
   match s.skind with
   | Instr(i) -> List.iter (fun a -> match a with
                                       | Set(lv, Const(CInt64(n, _, _)), l) ->  ()
                                       | Set(lv, e, l) ->
                                                if (expInTermsOfItself e (d_string "%a" d_lval lv)) then ()
                                                 else      
                                                 Hashtbl.add symTable (Lval(lv)) (symbolicExp e);
                                       | _ -> ()   
                             ) i;
                  let doms = Dominators.children tree s in
                        List.iter (fun v -> substituteDominators v tree) doms

   | Block(b) -> List.iter (fun v -> symbolicExec v tree) b.bstmts

   | _ -> ()
                            




let sym (f: file) : unit =

 let doGlobal = function
  
    | GFun (fdec, loc) ->
        currentFunc := fdec.svar.vname; 

     
      let ipdom,tree = Dominators.computeDomTree ~doCFG:false fdec in
          (*List.iter (fun s -> let doms = Dominators.children tree s in
                          E.log "Dominator : %d " s.sid;
		          List.iter (fun v ->  E.log "  %d" v.sid) doms;
                          E.log "\n";
                ) fdec.sallstmts; *)
          List.iter (fun s -> symbolicExec s tree) fdec.sallstmts


    | _ -> ()
  in
  Stats.time "sym" (iterGlobals f) doGlobal


let feature : featureDescr = 
  { fd_name = "sym";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = sym;
    fd_post_check = true
  } 


