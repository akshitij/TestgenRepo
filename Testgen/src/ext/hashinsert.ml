
open Pretty
open Cil
open Trace
open Printf
module E = Errormsg
module H = Hashtbl
module L = List

let i = ref 0
let name = ref ""


type symbolE = (string, string) Hashtbl.t

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

let rec operate str = 
   let len = String.length str in
     if len=0 then str
     else if str.[0]=' ' || str.[0]='&' || str.[0]='\t' then
        operate (String.sub str 1 (len-1))
     else
       str        

let count: int ref = ref 0

let getSymbolByName (se: symbolE) (vname: string) : string =
   try
    H.find se vname
  with Not_found -> (
    let ret:string = "S" ^ (Printf.sprintf "%d" !count)
    in
     H.add se vname ret;
     incr(count);
    ret
   )
 


class hashinsertVisitorClass (se: symbolE) = object
  inherit nopCilVisitor                        

  
  method vinst i = begin
    match i with
    | Call(lo,e,(a::a1::al),l) ->
         if (d_string "%a" d_exp e)="scanf" then
                let str = operate (d_string "%a" d_exp a1) in
                let pre = mkPrint str [] in
                let n = getSymbolByName se str in
                   E.log "symbol obtained from hash table %s\n" n;
                   ChangeTo [ pre; i] 
         else
            let pre = mkPrint (d_string "\n") [] in
            ChangeTo [ i ; pre ]
  
    |Set((Var vi, NoOffset), e1 , loc) ->
               let exp = (d_string "%a" d_exp e1) in
                 let pre = mkPrint (d_string "\n") [] in
                
                 E.log "Expression from assignment is %s\n" exp;
                   ChangeTo [ i ; pre ]

    | _ -> DoChildren
  end
 
end

let hashinsertVisitor = new hashinsertVisitorClass


let hashinsert (f: file) : unit =

  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) ->
        currentFunc := fdec.svar.vname;
        (* do the body *)
        let se = H.create 37 in
        let obj:hashinsertVisitorClass = new hashinsertVisitorClass se in
        ignore (visitCilFunction (obj :> cilVisitor) fdec);
      

    | _ -> ()
  in
  Stats.time "hashinsert" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
     E.log "Adding prototype for call logging function %s\n" p.vname;
     f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "hashinsert";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = hashinsert;
    fd_post_check = true
  } 


