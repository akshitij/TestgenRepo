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

(* Switches *)
let printFunctionName = ref "printf"

let addProto = ref false

let printf: varinfo option ref = ref None
let makePrintfFunction () : varinfo = 
    match !printf with 
      Some v -> v
    | None -> begin 
        let v = makeGlobalVar !printFunctionName 
                     (TFun(voidType, Some [("format", charPtrType, [])],
                             true, [])) in
        printf := Some v;
        addProto := true;
        v
    end

let mkPrint (format: string) (args: exp list) : instr = 
  let p: varinfo = makePrintfFunction () in 
  Call(None, Lval(var p), (mkString format) :: args, !currentLoc)
  

let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 

let currentFunc: string ref = ref ""


let rec fieldStmts lv off fd base : unit = 
   match off with
    | Field(fi, NoOffset) ->  
                            let st =  (Set(base, Lval((Var lv),off), locUnknown)) in
                               stmtlist := !stmtlist @ [st]
   
    | Field(fi, (Index(e1, NoOffset))) -> 
                                   let st =  (Set(base, Lval((Var lv),off), locUnknown)) in
                                          stmtlist := !stmtlist @ [st]   

    | Field(fi, (Index(e1, off1))) -> 
                      let t = (match fi.ftype with
                                 |TArray(t1,_,_) -> t1
                                 |_ -> fi.ftype) in
 
                               let tmp = makeTempVar fd t in
                                     let st =  (Set((var tmp), Lval((Var lv),Field(fi, Index(e1, NoOffset))), locUnknown)) in
                                       stmtlist := !stmtlist @ [st];
                                       fieldStmts tmp off1 fd base

    | Field(fi, off1) ->  
                      let tmp = makeTempVar fd fi.ftype in
                         let st =  (Set((var tmp), Lval((Var lv),Field(fi, NoOffset)), locUnknown)) in
                                   stmtlist := !stmtlist @ [st];
                                   fieldStmts tmp off1 fd base                
    | _ -> E.log "last\n"; ()



let rec checkExpForStruct (e:exp) (fd : fundec) (base:lval) i : exp = 
   match e with
  | UnOp(op,e1,t) -> UnOp(op, (checkExpForStruct e1 fd base i),t)
  | BinOp(op, e1, e2, t) -> BinOp(op, (checkExpForStruct e1 fd base i), (checkExpForStruct e2 fd base i), t);

  | Lval(lv, Field(fi, NoOffset)) -> stmtlist := [i]; e

  | Lval(lv, Field(fi, Index(e1, NoOffset))) -> stmtlist := [i]; e 

  | Lval(lv, Field(fi, Index(e1, off))) ->  let t = (match fi.ftype with
                                                             |TArray(t1,_,_) -> t1
                                                             |_ -> fi.ftype) in
 
                                                  let tmp = makeTempVar fd t in
                                                let st =  (Set((var tmp), Lval(lv, Field(fi, Index(e1, NoOffset))), locUnknown)) in
                                           stmtlist := !stmtlist @ [st];
                                           fieldStmts tmp off fd base; e

  | Lval(lv ,Field(fi , off)) -> let tmp = makeTempVar fd fi.ftype in
                                  let st = (Set((var tmp), Lval(lv,Field(fi, NoOffset)), locUnknown)) in
                                   stmtlist := !stmtlist @ [st];
                                   fieldStmts tmp off fd base;
                                     e
  |_ -> e



class testmoduleVisitorClass (fdec : fundec) = object
  inherit nopCilVisitor                        

   method vinst i = begin
    match i with
    | Set(lv, e , l) ->
       (* let pre = mkPrint (d_string "call hello %a\n" d_exp e) [] in
        let post = mkPrint (d_string "return from %a\n" d_exp e) [] in *)

          stmtlist := [];
          checkExpForStruct e fdec lv i;

    ChangeTo !stmtlist  

    | _ -> DoChildren
  end

 (* method vstmt (s : stmt) = begin
    match s.skind with
        | _ -> (* E.log "statement : %a\n succs : " d_stmt s;
               List.iter (fun v -> E.log "%a \n" d_stmt v) s.succs;*)


E.log "\n dominator statement is %a  sid: %d\n" d_stmt s s.sid;
E.log "\n Dominates\n";
     let ipdom,tree = Dominators.computeDomTree ~doCFG:false fdec in
        let doms = Dominators.children tree s in
		List.iter (fun v ->  E.log "\n     %a  \n" d_stmt v) doms;


                DoChildren


  end *)
end



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
                                       | Set(lv, e, l) -> Hashtbl.add symTable (Lval(lv)) (symbolicExp e);
                                       | _ -> ()   
                             ) i;
                  let doms = Dominators.children tree s in
                        List.iter (fun v -> substituteDominators v tree) doms

   | Block(b) -> List.iter (fun v -> symbolicExec v tree) b.bstmts

   | _ -> ()
                            




let testmodule (f: file) : unit =

 let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) ->
        currentFunc := fdec.svar.vname; 

(*let testmoduleVisitor = new testmoduleVisitorClass fdec in
ignore (visitCilFunction testmoduleVisitor fdec);  *)

      ignore(Cfg.cfgFun fdec);

      
      let ipdom,tree = Dominators.computeDomTree ~doCFG:false fdec in
          (*List.iter (fun s -> let doms = Dominators.children tree s in
                          E.log "Dominator : %d " s.sid;
		          List.iter (fun v ->  E.log "  %d" v.sid) doms;
                          E.log "\n";
                ) fdec.sallstmts; *)
          List.iter (fun s -> symbolicExec s tree) fdec.sallstmts

         
         (* Now add the entry instruction 
        let pre = mkPrint (d_string "enter %s\n" !currentFunc) [] in 
        fdec.sbody <- 
          mkBlock [ mkStmtOneInstr pre;
                    mkStmt (Block fdec.sbody) ]*) 

    | _ -> ()
  in
  Stats.time "testmodule" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     E.log "Adding prototype for call logging function %s\n" p.vname;
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "testmodule";
    fd_enabled = ref false;
    fd_description = "generation of code to log function calls";
    fd_extraopt = [];
    fd_doit = testmodule;
    fd_post_check = true
  } 


