open Pretty
open Cil
open Trace
open List
module E = Errormsg
module H = Hashtbl


let constVal : (lval, int) Hashtbl.t = (Hashtbl.create 100)
let arrVars : (int , varinfo) Hashtbl.t = (Hashtbl.create 100)


  let count1 = ref 0 
  let countstmts = ref 1 

let count = ref 0
let tmpcnt =  ref 0

let clist : compinfo list ref = ref [] 
let filist : fieldinfo list ref = ref []
let vars : varinfo list ref = ref []
let tmpvar : varinfo list ref = ref []


let function1 = ref "ifelseTerms"

let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 

let v2e (v : varinfo) : exp = Lval(var v)

let makeifelseTermsFunction () : varinfo = 
         let v = makeGlobalVar !function1 
                    (TFun(voidType, Some [("lhs", charPtrType, []);
                                          ("rhs", charPtrType, []);
                                        ],
                             true, [])) in
         v


let mkifelsetermsfxn (lhs: string) (rhs: string) : instr = 
  let i: varinfo = makeifelseTermsFunction () in 
  Call(None, Lval(var i), [mkString lhs; mkString rhs], !currentLoc)


let rec checkarray (e : exp)  = 
 match e with
   | BinOp(op,e1,e2,l) -> BinOp(op ,(checkarray e1 ) , (checkarray e2 ), l);
   | UnOp(op,e1,l) -> UnOp(op, (checkarray e1 ),l);
   | Lval(Var vi, Index(Lval(e), NoOffset)) -> (v2e (Hashtbl.find arrVars (Hashtbl.find constVal e)))
   | _ -> e

let rec checkExp e : exp = 
   match e with
    | Lval(Mem(e1), NoOffset) -> checkExp e1
   (* | Lval(v, Field(fi,NoOffset)) -> let vi = makeVarinfo true fi.fname fi.ftype in
                                         (v2e vi) *)
    | UnOp(op,e1,t) -> UnOp(op, checkExp e1,t)
    | BinOp(op, e1, e2, t) -> BinOp(op, checkExp e1, checkExp e2, t); 
    | _ -> e


class arrayIndexVisitorClass (fdec : fundec) = object
  inherit nopCilVisitor     

 (*method vinst i = begin

    match i with

        | Set((Var vi, Index(Lval(e), NoOffset)), e1 , loc) ->
                     E.log "Array instruction found %a\n" d_instr i;
                     if (Hashtbl.mem arrVars (Hashtbl.find constVal e))=false then
                        begin
                             let vr = makeLocalVar fdec ("tarr" ^ (d_string "%d" !tmpcnt)) intType in
                              tmpcnt := !tmpcnt + 1;
                              Hashtbl.add arrVars (Hashtbl.find constVal e) vr
                        end;
                    
                 let p = Set(var (Hashtbl.find arrVars (Hashtbl.find constVal e)),Lval (Var vi, Index(Lval(e), NoOffset)) , loc) in
 
                     ChangeTo [i; p];


       | Set((Var vi, Index(Const(CInt64(n, t, None)), NoOffset)), e1 , loc) ->
                     E.log "Array instruction found %a\n" d_instr i;
                     if (Hashtbl.mem arrVars (i64_to_int n))=false then
                        begin
                             let vr = makeLocalVar fdec ("tarr" ^ (d_string "%d" !tmpcnt)) intType in
                              tmpcnt := !tmpcnt + 1;
                              Hashtbl.add arrVars (i64_to_int n) vr
                        end;
                    
                 let p = Set(var (Hashtbl.find arrVars (i64_to_int n)),Lval (Var vi, Index(Const(CInt64(n, t, None)), NoOffset)) , loc) in
 
                     ChangeTo [i; p];


        | Set(lv, Const(CInt64(n, _, _)) , _) -> 

                                 Hashtbl.replace constVal lv (i64_to_int n);
                                 E.log "Added entry for key %a, value %d\n" d_lval lv (Hashtbl.find constVal lv);
                                  ChangeTo [i];

       
        | Set(lv, BinOp(PlusA, Lval(l) ,Const(CInt64(v, _, _)) ,_), _) ->
                            (* E.log "opeartor : %a, e1: %a, e2: %a\n" d_binop op d_lval l d_exp e2;   *)
                              let x = Hashtbl.find constVal l in
                                   
                              Hashtbl.replace constVal lv (x + (i64_to_int v));
                              E.log "updated entry for key %a, value %d\n" d_lval l (Hashtbl.find constVal l);
                              ChangeTo [i]

         | Set(lv, BinOp(MinusA, Lval(l) ,Const(CInt64(v, _, _)) ,_), _) ->
                            (* E.log "opeartor : %a, e1: %a, e2: %a\n" d_binop op d_lval l d_exp e2;   *)
                              let x = Hashtbl.find constVal l in
                                   
                              Hashtbl.replace constVal lv (x - (i64_to_int v));
                              E.log "updated entry for key %a, value %d\n" d_lval l (Hashtbl.find constVal l);
                              ChangeTo [i]                              
                              
         | Set(lv, BinOp(Mult, Lval(l) ,Const(CInt64(v, _, _)) ,_), _) ->
                            (* E.log "opeartor : %a, e1: %a, e2: %a\n" d_binop op d_lval l d_exp e2;   *)
                              let x = Hashtbl.find constVal l in
                                   
                              Hashtbl.replace constVal lv (x * (i64_to_int v));
                              E.log "updated entry for key %a, value %d\n" d_lval l (Hashtbl.find constVal l);
                              ChangeTo [i]

         | Set(lv, BinOp(Div, Lval(l) ,Const(CInt64(v, _, _)) ,_), _) ->
                            (* E.log "opeartor : %a, e1: %a, e2: %a\n" d_binop op d_lval l d_exp e2;   *)
                              let x = Hashtbl.find constVal l in
                                   
                              Hashtbl.replace constVal lv (x / (i64_to_int v));
                              E.log "updated entry for key %a, value %d\n" d_lval l (Hashtbl.find constVal l);
                              ChangeTo [i]


        | Call(lo,e,(a::al),loc) -> 
                    if (d_string "%a" d_exp e)="scanf" then begin

                    let x =  List.concat (List.map (fun v -> match v with
                                    |AddrOf(Var vi, Index(Lval(e), NoOffset)) -> 
                                           if (Hashtbl.mem arrVars (Hashtbl.find constVal e))=false then
                                           begin
                                               let vr = makeLocalVar fdec ("tarr" ^ (d_string "%d" !tmpcnt)) intType in
                                                tmpcnt := !tmpcnt + 1;
                                                Hashtbl.add arrVars (Hashtbl.find constVal e) vr;
                                          end;
                                          []
         
                                   | _ -> [v]

                               ) al) in
             
              ChangeTo [Call(lo,e,(a::x),loc)]
               end                   
          
      else
         ChangeTo [i]      

        | _ -> DoChildren
 
  end*)


 method vstmt (s : stmt) = begin
 let action s =
      match s.skind with
           |If(BinOp(op, BinOp(op1,Lval(Mem e1,NoOffset),e,l2) ,e2,l1),tb,fb,l) -> 
                                          let st = Set(var (List.hd !tmpvar), Lval(Mem e1,NoOffset) ,locUnknown) in
               s.skind <-Block (mkBlock[mkStmtOneInstr st; mkStmt (If(BinOp(op, BinOp(op1,(v2e (List.hd !tmpvar)),e,l2) ,e2,l1),tb,fb,l))]);
                             s
           |Block(blk) -> 
                            List.iter ( fun v-> 
                                      match v.skind with
                                      | If(BinOp(op, Lval(Mem e1,NoOffset) ,e2,l1),tb,fb,l) -> E.log "HERE\n";
                                          let st = Set(var (List.hd !tmpvar), Lval(Mem e1,NoOffset) ,locUnknown) in
               s.skind <-Block (mkBlock[mkStmtOneInstr st; mkStmt (If(BinOp(op,(v2e (List.hd !tmpvar)) ,e2,l1),tb,fb,l))])
                       
                                      | If(e,tb,fb,l) ->  E.log "here : %a\n" d_exp e                    
 
                                      | _ -> () ) blk.bstmts; 
                              s
                          

           | _ ->  s

   in 
       ChangeDoChildrenPost(s,action)

    end
                   
end


let arrayIndex (f: file) : unit =
E.log "Enter unroll count : \n";
 let k = read_int () in
  let su = read_line () in
     (*let fname = Scanf.sscanf su "%s" (fun i -> i) in*)
     E.log "function name = %s\n" su;
     E.log "unroll count = %d\n" k;
     count := k;

  let doGlobal = function
   
   | GFun (fdec, loc) when fdec.svar.vname=su->

            
    (*  vars := List.concat (List.map (fun v -> let len = String.length v.vname in
                            if len>=6 then
                             begin
                                if (String.sub v.vname 0 6)="tmparr" then [v] else []
                             end
                          else
                            []
                          ) fdec.slocals); *)

    let p = makeLocalVar fdec "temp" intType in
        tmpvar := p :: !tmpvar;

    let arrayIndexVisitor = new arrayIndexVisitorClass fdec in
        ignore (visitCilFunction arrayIndexVisitor fdec);
     
  
    | _ -> ()
  in
  Stats.time "arrayIndex" (iterGlobals f) doGlobal
  

let feature : featureDescr = 
  { fd_name = "arrayIndex";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = arrayIndex;
    fd_post_check = true
  } 


