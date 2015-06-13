
open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let i = ref 0
let name = ref ""

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


let rec checkExp e  : exp = 
   match e with
    | Lval(Mem(e1), NoOffset) -> checkExp e1
    | UnOp(op,e1,t) -> UnOp(op, checkExp e1,t)
    | BinOp(op, e1, e2, t) -> BinOp(op, checkExp e1, checkExp e2, t)
    | _ -> e


let rec countRef e cnt = 
  match e with
    | Lval(Mem(e1), NoOffset) -> countRef e1 (cnt+1)
    | UnOp(op,e1,t) -> countRef e1 cnt
    | BinOp(op, e1, e2, t) -> countRef e1 cnt; countRef e2 cnt
    | _ -> E.log "Expression %a is referenced %d times \n" d_exp e cnt



class insertSetVisitorClass = object
  inherit nopCilVisitor                        

  
  method vinst i = begin
    match i with
    | Set(lv, AddrOf(v) , loc) ->  
             E.log "1. LHS is %a\n" d_lval lv;
             E.log "1. RHS is %a\n" d_lval v;
              ChangeTo [i]

    | Set(lv,CastE( TPtr(intType,[]), e) ,loc) ->
            E.log "2. LHS is %a\n" d_lval lv;
             E.log "2. RHS is %a\n" d_exp e;
              ChangeTo [i]
    
    | Call(Some l,exp,_,loc) ->
             E.log "3. LHS is %a\n" d_lval l;
             E.log "3. RHS is %a\n" d_exp exp;
              ChangeTo [i]
    
    | _ -> DoChildren
  end
  
method vstmt (s : stmt) = begin
    match s.skind with
     
       | If(e,tb,fb,l)-> 
                    (*  let lhs = checkExp e1 in
                       let rhs = checkExp e2  in*)
                         E.log "result expression from function is : %a\n" d_exp (checkExp e);
                         countRef e 0;
                    ChangeTo s

       | _ -> DoChildren
    
    end




end





let insertSetVisitor = new insertSetVisitorClass


let insertSet (f: file) : unit =

  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) ->
        currentFunc := fdec.svar.vname;
              
        (* do the body *)
        ignore (visitCilFunction insertSetVisitor fdec)
       
    | _ -> ()
  in
  Stats.time "insertSet" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     E.log "Adding prototype for call logging function %s\n" p.vname;
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "insertSet";
    fd_enabled = ref false;
    fd_description = "print name of variables updated";
    fd_extraopt = [];
    fd_doit = insertSet;
    fd_post_check = true
  } 

