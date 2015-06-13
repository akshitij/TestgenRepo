open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let i = ref 0
let name = ref ""
let value = ref 0

let stmtlist : stmt list ref = ref []
let functionBody : stmt list ref = ref []

let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 



(* function for varinfo -> exp *)
let v2e (v : varinfo) : exp = Lval(var v)


let rec fixFunction (s : stmt) (vi :varinfo) : unit = 
E.log "stmt: %a, sid = %d\n" d_stmt s s.sid; 
 match s.skind with
      | Instr(i) ->  stmtlist := !stmtlist @ List.concat (List.map (fun v -> match v with
                                                                                  | Call(lv, nm, _, l) -> if l.line=(-1) then
                                                                                                            [(mkStmtOneInstr v)]
                                                                                                          else
                                                                                                             []
                                                                                  | _ -> []
                                                                         ) i )
                         


          | If(e,tb,fb,l) ->                       
                                if (List.length !stmtlist)>0 then
                               begin

                                 if s.sid=1 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 1) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])
                                 
                               else if s.sid=2 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 2) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist,mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                               else if s.sid=3 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 3) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])


                              else if s.sid=4 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 4) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                              else if s.sid=5 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 5) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                              else if s.sid=6 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 6) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                              else if s.sid=7 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 7) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                              else if s.sid=8 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 8) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                              else if s.sid=9 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 9) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                              else if s.sid=10 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 10) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                              else if s.sid=11 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 11) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                              else if s.sid=12 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 12) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                              else if s.sid=13 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 13) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                              else if s.sid=14 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 14) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                             else if s.sid=15 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 15) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                            else if s.sid=16 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 16) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                            else if s.sid=17 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 17) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                            else if s.sid=18 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 18) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                           else if s.sid=19 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 19) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                           else if s.sid=20 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 20) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                           else if s.sid=21 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 21) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                           else if s.sid=22 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 22) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                           else if s.sid=23 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 23) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                           else if s.sid=24 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 24) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                           else if s.sid=25 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 25) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                           else if s.sid=26 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 26) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                           else if s.sid=27 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 27) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                           else if s.sid=28 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 28) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                          else if s.sid=29 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 29) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                          else if s.sid=30 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 30) , intType) in
                                     let st =  mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                         else if s.sid=31 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 31) , intType) in
                                     let st = mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])

                         else if s.sid=32 then
                                  (let e1 = BinOp(Eq, (v2e vi), (integer 32) , intType) in
                                     let st =mkStmt (If(e1, mkBlock !stmtlist, mkBlock [], locUnknown)) in
                                       functionBody := !functionBody @ [st])


                               end;
                              stmtlist := [];
                             List.iter (fun v -> (fixFunction v vi)) tb.bstmts;
                             List.iter (fun v -> (fixFunction v vi)) fb.bstmts
                             


          |Block(b) ->  List.iter (fun v ->  (fixFunction v vi)) b.bstmts

          | _ -> ()





let handleUnseenNodes (f: file) : unit =
  let fname = read_line () in
   let fd = (emptyFunction "symbolicExecCDG") in
    let vi = makeVarinfo false "sid" intType in
            ignore( Cfg.clearFileCFG f);
    let doGlobal = function
     
      | GFun (fdec, loc) ->

                           ignore(Cfg.cfgFun fd);     
                      if fdec.svar.vname=fname then
                             List.iter (fun v -> (fixFunction v vi) )fdec.sbody.bstmts
                   
  
      | _ -> ()
  in
  Stats.time "handleUnseenNodes" (iterGlobals f) doGlobal;
  fd.sformals <- [vi];
  fd.sbody.bstmts <- !functionBody;
  f.globals <-  GFun(fd, locUnknown) :: f.globals
 
 

let feature : featureDescr = 
  { fd_name = "handleUnseenNodes";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = handleUnseenNodes;
    fd_post_check = true
  } 


