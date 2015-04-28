(* pathSymbol feature is used for symbolic execution.
 * Each program variable is implemented in terms of
 * symbolic variables.*)

open Pretty
open Cil
open Trace
open Printf
module E = Errormsg
module H = Hashtbl
module L = List


(* switches *)
let printFunctionName = ref "printf"
let handleAssignmentFunctionName = ref "handleAssignmentSymbolically"
let addEntryToSymbolTable = ref "add_entryToSTable"

let addProto = ref false

let structIndex = ref 0
let aindex = ref 0

let stmtlist : instr list ref = ref []
let stlist : instr list ref = ref []

let printf: varinfo option ref = ref None

(* prototype for printf function *)
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



(* prototype for sprintf function *)
let makeSPrintfFunction () : varinfo = 
     let v = makeGlobalVar "sprintf" 
                     (TFun(voidType, Some [("s1", charPtrType, []);
                                           ("format", charPtrType, []);
                                           ("index", intType, [])],
                             true, [])) in
        v
   


let mkSPrint (e: exp) (format: string) (e1: exp) : instr = 
  let p: varinfo = makeSPrintfFunction () in 
  Call(None, Lval(var p), [e; mkString format; e1], locUnknown)



(* function for varinfo -> exp *)
let v2e (v : varinfo) : exp = Lval(var v)


(* Prototype for handleAssignmentSymbolically function *)
let makeHandleAssignmentFunction () : varinfo = 
         let v = makeGlobalVar !handleAssignmentFunctionName 
                    (TFun(voidType, Some [("lhs", charPtrType, []);
                                          ("rhs", charPtrType, []);
                                          ("val", voidPtrType, []);
                                          ("address", voidPtrType, []);
                                          ("type", intType, [])],
                             true, [])) in
         v


let mkassignmentfxn (lhs: string) (rhs: string) (e :exp) (t: int) : instr = 
  let i: varinfo = makeHandleAssignmentFunction () in 
  Call(None, Lval(var i), [mkString lhs; mkString rhs; e; e; integer t], locUnknown)



(* Prototype for handleArraySymbolically function *)
let makeHandleArrayFunction () : varinfo = 
         let v = makeGlobalVar "handleArraySymbolically" 
                    (TFun(voidType, Some [("lhs", charPtrType, []);
                                          ("index", intType,[]);
                                          ("rhs", charPtrType, []);
                                          ("val", voidPtrType, []);
                                          ("address", voidPtrType, []);
                                          ("type", intType, [])],
                             true, [])) in
         v


let mkArrayassignmentfxn (lhs: string) (index: exp) (rhs: string) (e :exp) (t: int) : instr = 
  let i: varinfo = makeHandleArrayFunction () in 
  Call(None, Lval(var i), [mkString lhs; index; mkString rhs; e; e; integer t], locUnknown)






(* prototype for add_entryToSTable() *)
let makeSTableEntryFunction () : varinfo = 
        let v = makeGlobalVar !addEntryToSymbolTable 
                    (TFun(voidType, Some [("s1", charConstPtrType, []);
                                         ("s2", charConstPtrType, []);
                                         ("val", voidPtrType, []);
                                         ("address", voidPtrType, []);
                                         ("type", intType, []); ],
                             true, [])) in
         v

let mkstableEntryfxn (s1 : string) (s2 : string) (e : exp) (t : int) : instr = 
  let i: varinfo = makeSTableEntryFunction () in 
  Call(None, Lval(var i), [mkString s1; mkString s2; e; e; integer t] , locUnknown)


let mkstableEntryfxn1 (s1 : string) (e1 : exp) (e : exp) (t : int) : instr = 
  let i: varinfo = makeSTableEntryFunction () in 
  Call(None, Lval(var i), [mkString s1; e1; e; e; integer t] , locUnknown)


(* prototype for add_entryToArraySTable() *)
let makeArraySTableEntryFunction () : varinfo = 
        let v = makeGlobalVar "add_entryToArraySTable"
                    (TFun(voidType, Some [("s1", charConstPtrType, []);
                                         ("index", intType, []);
                                         ("s2", charConstPtrType, []);
                                         ("val", voidPtrType, []);
                                         ("address", voidPtrType, []);
                                         ("type", intType, []); ],
                             true, [])) in
         v

let mkarraytableEntryfxn (s1 : string) (e1 : exp) (s2 : string) (e : exp) (t : int) : instr = 
  let i: varinfo = makeArraySTableEntryFunction () in 
  Call(None, Lval(var i), [mkString s1; e1; mkString s2; e; e; integer t] , locUnknown)




(* Prototype for addEntryToVariableTable function *)

let makeAddEntryToVariableTableFunction () : varinfo = 
        let v = makeGlobalVar "addEntryToVariableTable"
                    (TFun(voidType, Some [("vname", charPtrType, []);
                                          ("parameter", intType, [])],
                             true, [])) in
         v

let mkVariableTablefxn (vname: string) (parameter : exp) : instr = 
  let i: varinfo = makeAddEntryToVariableTableFunction () in 
  Call(None, Lval(var i), [mkString vname; parameter], locUnknown)


(* prototype for add_entryToArraySTable() *)
let makeArraySTableEntryFunction () : varinfo = 
        let v = makeGlobalVar "add_entryToArraySTable" 
                    (TFun(voidType, Some [("s1", charConstPtrType, []);
                                         ("index", intType, []);
                                         ("s2", charConstPtrType, []);
                                         ("val", voidPtrType, []);
                                         ("address", voidPtrType, []);
                                         ("type", intType, []); ],
                             true, [])) in
         v

let mkArrayStableEntryfxn (s1 : string) (e1: exp) (s2 : string) (e : exp) (t : int) : instr = 
  let i: varinfo = makeArraySTableEntryFunction () in 
  Call(None, Lval(var i), [mkString s1; e1; mkString s2; e; e; integer t] , locUnknown)



(* prototype for UpdateSymName() *)
let makeUpdateSNameFunction () : varinfo = 
        let v = makeGlobalVar "UpdateSymName" 
                    (TFun(voidType, Some [("sname", charPtrType, []);
                                             ("sname1", charPtrType, [])],
                             true, [])) in
         v

let mkUpdateNamefxn  e1 e2 : instr = 
  let i: varinfo = makeUpdateSNameFunction () in 
  Call(None, Lval(var i), [e1; e2] , locUnknown)




(* prototype for load() *)
let makeLoadFunction () : varinfo = 
        let v = makeGlobalVar "load" 
                    (TFun(voidPtrType, Some [("addr", voidPtrType, []);
                                         ("field", charPtrType, []);
                                         ("typ", intType, [])],
                             true, [])) in
         v

let mkLoadfxn e (s1: string) typ (vi : varinfo): instr = 
  let i: varinfo = makeLoadFunction () in 
  Call(Some (Var vi,NoOffset), Lval(var i), [e; mkString s1; integer typ] , locUnknown)



let mkLoadfxn1 e e1 typ (vi : varinfo): instr = 
  let i: varinfo = makeLoadFunction () in 
  Call(Some (Var vi,NoOffset), Lval(var i), [e; e1; integer typ] , locUnknown)




(* prototype for store() *)
let makeStoreFunction () : varinfo = 
        let v = makeGlobalVar "store" 
                    (TFun(voidType, Some [("addr", voidPtrType, []);
                                         ("field", charPtrType, []);
                                         ("typ", intType, []);
                                         ("val", voidPtrType, []);
                                         ("sname", charPtrType, [])],
                             true, [])) in
         v

let mkStorefxn (e: exp) (e1 : exp) (s1: string) (typ: int) (s2: string) : instr = 
  let i: varinfo = makeStoreFunction () in 
  Call(None, Lval(var i), [e; mkString s1; integer typ; e1; mkString s2] , locUnknown)


let mkStorefxn1 (e: exp) (e1 : exp) (e2: exp) (typ: int) (s2: string) : instr = 
  let i: varinfo = makeStoreFunction () in 
  Call(None, Lval(var i), [e; e2; integer typ; e1; mkString s2] , locUnknown)



(* prototype for getSymName() *)
let makeGetSymNameFunction () : varinfo = 
        let v = makeGlobalVar "getSymName" 
                 (TFun(charPtrType, Some [("addr", voidPtrType, []);
                                         ("field", charPtrType, [])],
                             true, [])) in
         v

let mkGetSnamefxn (e: exp) (s1: string) vi : instr = 
  let i: varinfo = makeGetSymNameFunction () in 
  Call(Some (Var vi,NoOffset), Lval(var i), [e; mkString s1] , locUnknown)


let mkGetSnamefxn1 (e: exp) (e1: exp) vi : instr = 
  let i: varinfo = makeGetSymNameFunction () in 
  Call(Some (Var vi,NoOffset), Lval(var i), [e; e1] , locUnknown)


(* Pretty printer for cil types to string *)
let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 



(* counts number of references in pointer *)
let rec countRef e cnt  = 
  match e with
    | Lval(Mem(e1), NoOffset) -> countRef e1 (cnt+1)
    | UnOp(op,e1,t) -> countRef e1 cnt
    | BinOp(op, e1, e2, t) -> countRef e1 cnt; countRef e2 cnt
    | _ -> cnt



let getType t  = 
  match t with
      |TInt(_,_) -> 1
      |TFloat(_,_) -> 2
      |TArray(_,_,_) -> 3
      |TComp(_,_) -> 4
      | _ -> -1



(* Recursive function to generate sequence of store and load functions for struct types for exp types *)
let rec resNestedStruct baseExp mainExp off svoid index number lv vi =
    match off with
      | Field(fi, NoOffset) ->
                  let store1 = mkStorefxn (v2e svoid) mainExp fi.fname (getType fi.ftype) ("structVar" ^ (d_string "%d" !structIndex))in 
                 let findName = mkGetSnamefxn (v2e svoid) (fi.fname) vi in
                 let entry = mkstableEntryfxn1 (d_string "%a" d_lval lv) (v2e vi) (AddrOf(lv)) (getType fi.ftype) in 
                   structIndex := !structIndex + 1;
                     stlist := !stlist @ [store1; findName; entry]

      | Index(e, NoOffset) -> 
                           let sprnt = mkSPrint (v2e index) "%d" e in
                     let store1 = mkStorefxn1 (v2e svoid) mainExp (v2e index) (getType intType) ("structVar" ^ (d_string "%d" !structIndex))in 
                                let findName = mkGetSnamefxn1 (v2e svoid) (v2e index) vi in
                                   let entry = mkstableEntryfxn1 (d_string "%a" d_lval lv) (v2e vi) (AddrOf(lv)) (getType (typeOfLval lv)) in 
                                     structIndex := !structIndex + 1;
                                stlist := !stlist @ [store1; findName; entry]


      | Field(fi, off1) ->
                   if number=0 then
                     (let store1 = mkStorefxn baseExp (CastE(voidPtrType,(integer 0))) fi.fname (getType fi.ftype) "" in 
                       let load = mkLoadfxn baseExp fi.fname (getType fi.ftype) svoid in
                          let base = makeVarinfo false fi.fname fi.ftype in
                           stlist := !stlist @ [store1; load]; 
                           resNestedStruct (v2e base) mainExp off1 svoid index 1 lv vi)

                   else
                      (let store1 = mkStorefxn (v2e svoid) (CastE(voidPtrType,(integer 0))) fi.fname (getType fi.ftype) "" in 
                       let load = mkLoadfxn (v2e svoid) fi.fname (getType fi.ftype) svoid in
                          let base = makeVarinfo false fi.fname fi.ftype in
                           stlist := !stlist @ [store1; load]; 
                           resNestedStruct (v2e base) mainExp off1 svoid index 1 lv vi)

       | Index(e, off1) -> 
                         let sprnt = mkSPrint (v2e index) "%d" e in
                              let store1 = mkStorefxn1 (v2e svoid)  (CastE(voidPtrType,(integer 0))) (v2e index) 4 "" in 
                                let load = mkLoadfxn1 (v2e svoid) (v2e index) 4  svoid in
                                   stlist := !stlist @ [sprnt; store1; load];
                                   resNestedStruct baseExp mainExp off1 svoid index 1 lv vi





let resolveStructType e lv vi svoid index =

  match e with
     | Lval((Var v), (Field(fi, NoOffset))) -> 

                      let store = mkStorefxn (AddrOf(Var v,NoOffset)) (AddrOf((Var v), (Field(fi, NoOffset)))) fi.fname (getType fi.ftype) ("structVar" ^ (d_string "%d" !structIndex)) in 
                        let findName = mkGetSnamefxn (AddrOf(Var v,NoOffset)) fi.fname vi in
                          let entry = mkstableEntryfxn1 (d_string "%a" d_lval lv) (v2e vi) (AddrOf(lv)) (getType fi.ftype) in 
                           structIndex := !structIndex + 1;
                         stlist := !stlist @ [store; findName; entry]


     | Lval((Var v), (Field(fi,(Index(e1, NoOffset))))) ->
                  
                         let store1 = mkStorefxn (v2e v) (CastE(voidPtrType,(integer 0))) fi.fname (getType fi.ftype) "" in 
                        let load = mkLoadfxn (AddrOf(Var v, NoOffset)) fi.fname (getType fi.ftype) svoid in
                       let sprnt = mkSPrint (v2e index) "%d" e1 in
                      let aname = makeVarinfo false fi.fname fi.ftype in
                     let store = mkStorefxn1 (v2e aname) (AddrOf((Var v), (Field(fi,(Index(e1, NoOffset)))))) (v2e index) (getType fi.ftype) ("structVar" ^ (d_string "%d" !structIndex)) in
                  let findName = mkGetSnamefxn1 (v2e svoid) (v2e index) vi in
                  let t = (match fi.ftype with
                            | TArray(t1,_,_) -> t1
                            | _ -> fi.ftype) in
                 let entry = mkstableEntryfxn1 (d_string "%a" d_lval lv) (v2e vi) (AddrOf(lv)) (getType t) in 
                      structIndex := !structIndex + 1;
                          stlist := !stlist @ [store1; load; sprnt; store; findName; entry]


    | Lval((Var v), (Index(e1, (Field(fi, NoOffset))))) ->

                        let sprnt = mkSPrint (v2e index) "%d" e1 in
                      let store1 = mkStorefxn1 (v2e v) (CastE(voidPtrType,(integer 0))) (v2e index) 4 "" in 
                      let load = mkLoadfxn1 (v2e v) (v2e index) 4 svoid in
                      let aname = makeVarinfo false fi.fname fi.ftype in
                     let store = mkStorefxn (v2e svoid) (AddrOf((Var v), (Index(e1, (Field(fi, NoOffset)))))) fi.fname (getType fi.ftype) ("structVar" ^ (d_string "%d" !structIndex)) in
                  let findName = mkGetSnamefxn (v2e svoid) fi.fname vi in
                  let t = (match fi.ftype with
                            | TArray(t1,_,_) -> t1
                            | _ -> fi.ftype) in
                 let entry = mkstableEntryfxn1 (d_string "%a" d_lval lv) (v2e vi) (AddrOf(lv)) (getType t) in 
                      structIndex := !structIndex + 1;
                          stlist := !stlist @ [ sprnt; store1; load; store; findName; entry]



    | Lval(Mem (Lval(v)), (Field(fi, NoOffset))) -> 
 
                   let store = mkStorefxn (Lval(v)) (AddrOf(Mem (Lval(v)), (Field(fi, NoOffset)))) fi.fname (getType fi.ftype) ("structVar" ^ (d_string "%d" !structIndex)) in 
                        let findName = mkGetSnamefxn (Lval(v)) fi.fname vi in
                         let entry = mkstableEntryfxn1 (d_string "%a" d_lval lv) (v2e vi) (AddrOf(lv)) (getType fi.ftype) in 
                         structIndex := !structIndex + 1;
                         stlist := !stlist @ [store; findName; entry] 
     


    | Lval(Mem (Lval(v)), (Field(fi,(Index(e1, NoOffset))))) -> 
                  
                         let store1 = mkStorefxn (Lval(v)) (CastE(voidPtrType,(integer 0))) fi.fname (getType fi.ftype) "" in 
                        let load = mkLoadfxn (Lval(v)) fi.fname (getType fi.ftype) svoid in
                       let sprnt = mkSPrint (v2e index) "%d" e1 in
                      let aname = makeVarinfo false fi.fname fi.ftype in
               let store = mkStorefxn1 (v2e svoid) (AddrOf(Mem (Lval(v)), (Field(fi,(Index(e1, NoOffset)))))) (v2e index) (getType fi.ftype) ("structVar" ^ (d_string "%d" !structIndex)) in
               let findName = mkGetSnamefxn1 (v2e svoid) (v2e index) vi in
                  let entry = mkstableEntryfxn1 (d_string "%a" d_lval lv) (v2e vi) (AddrOf(Mem (Lval(v)), (Field(fi,(Index(e1, NoOffset)))))) (getType (typeOfLval lv)) in 
                            structIndex := !structIndex + 1;

                stlist := !stlist @ [store1; load; sprnt; store; findName; entry]


     | Lval((Var v), off) ->  resNestedStruct (v2e v) (AddrOf(Var v, off)) off svoid index 0 lv vi

     | Lval(Mem(Lval(v)), off) ->  resNestedStruct (Lval(v)) (AddrOf(Mem(Lval(v)), off)) off svoid index 0 lv vi


     | _ -> ()







(* Recursive function to generate sequence of store and load functions for struct types for Lval types *)
let rec resNestedStructLval baseExp mainExp off svoid index number vi =
    match off with
      | Field(fi, NoOffset) ->
                  let store1 = mkStorefxn (v2e svoid) mainExp fi.fname (getType fi.ftype) ("structVar" ^ (d_string "%d" !structIndex)) in 
                     let findName = mkGetSnamefxn (v2e svoid) (fi.fname) vi in
                      structIndex := !structIndex + 1;
                     stlist := !stlist @ [store1; findName]

      | Index(e, NoOffset) -> 
                           let sprnt = mkSPrint (v2e index) "%d" e in
                              let store1 = mkStorefxn1 (v2e svoid) mainExp (v2e index) (getType intType) ("structVar" ^ (d_string "%d" !structIndex)) in 
                                let findName = mkGetSnamefxn1 (v2e svoid) (v2e index) vi in
                                  structIndex := !structIndex + 1;
                                    stlist := !stlist @ [store1;findName]


      | Field(fi, off1) ->
                   if number=0 then
                     (let store1 = mkStorefxn baseExp (CastE(voidPtrType,(integer 0))) fi.fname (getType fi.ftype) "" in 
                       let load = mkLoadfxn baseExp fi.fname (getType fi.ftype) svoid in
                          let base = makeVarinfo false fi.fname fi.ftype in
                           stlist := !stlist @ [store1; load]; 
                           resNestedStructLval (v2e base) mainExp off1 svoid index 1 vi)

                   else
                      (let store1 = mkStorefxn (v2e svoid) (CastE(voidPtrType,(integer 0))) fi.fname (getType fi.ftype) "" in 
                       let load = mkLoadfxn (v2e svoid) fi.fname (getType fi.ftype) svoid in
                          let base = makeVarinfo false fi.fname fi.ftype in
                           stlist := !stlist @ [store1; load]; 
                           resNestedStructLval (v2e base) mainExp off1 svoid index 1 vi)

     | Index(e, off1) ->
                         let sprnt = mkSPrint (v2e index) "%d" e in
                              let store1 = mkStorefxn1 (v2e svoid) mainExp (v2e index) 4 "" in 
                                let load = mkLoadfxn (v2e svoid) (d_string "%a" d_exp mainExp) 4  svoid in
                                   stlist := !stlist @ [store1; load]
                                    




let resolveStructTypeLval lv vi svoid index =
  match lv with
     | ((Var v), (Field(fi, NoOffset))) -> 

                      let store = mkStorefxn (v2e v) (AddrOf((Var v), (Field(fi, NoOffset)))) fi.fname (getType fi.ftype) ("structVar" ^ (d_string "%d" !structIndex)) in 
                        let findName = mkGetSnamefxn (v2e v) fi.fname vi in
                         structIndex := !structIndex +1;
                         stlist := !stlist @ [store; findName]


     | ((Var v), (Field(fi,(Index(e1, NoOffset))))) ->
                  
                         let store1 = mkStorefxn (v2e v) (CastE(voidPtrType,(integer 0))) fi.fname (getType fi.ftype) "" in 
                        let load = mkLoadfxn (AddrOf(Var v, NoOffset)) fi.fname (getType fi.ftype) svoid in
                       let sprnt = mkSPrint (v2e index) "%d" e1 in
                      let aname = makeVarinfo false fi.fname fi.ftype in
                     let store = mkStorefxn1 (v2e aname) (AddrOf((Var v), (Field(fi,(Index(e1, NoOffset)))))) (v2e index) (getType fi.ftype) ("structVar" ^ (d_string "%d" !structIndex)) in
                   let findName = mkGetSnamefxn1 (v2e svoid) (v2e index) vi in
                          structIndex := !structIndex + 1;
                          stlist := !stlist @ [store1; load; sprnt; store; findName]



    | (Mem (Lval(v)), (Field(fi, NoOffset))) -> 
 
                   let store = mkStorefxn (Lval(v)) (AddrOf(Mem (Lval(v)), (Field(fi, NoOffset)))) fi.fname (getType fi.ftype) ("structVar" ^ (d_string "%d" !structIndex)) in 
                        
                        let findName = mkGetSnamefxn (Lval(v)) fi.fname vi in
                             structIndex := !structIndex + 1;
                             stlist := !stlist @ [store; findName] 
     


    | (Mem (Lval(v)), (Field(fi,(Index(e1, NoOffset))))) -> 
                  
                         let store1 = mkStorefxn (Lval(v)) (CastE(voidPtrType,(integer 0))) fi.fname (getType fi.ftype) "" in 
                        let load = mkLoadfxn (Lval(v)) fi.fname (getType fi.ftype) svoid in
                       let sprnt = mkSPrint (v2e index) "%d" e1 in
                      let aname = makeVarinfo false fi.fname fi.ftype in
               let store = mkStorefxn1 (v2e svoid) (AddrOf(Mem (Lval(v)), (Field(fi,(Index(e1, NoOffset)))))) (v2e index) (getType fi.ftype) ("structVar" ^ (d_string "%d" !structIndex)) in
              let findName = mkGetSnamefxn1 (v2e svoid) (v2e index) vi in  
                 structIndex := !structIndex + 1;            
                stlist := !stlist @ [store1; load; sprnt; store; findName]


     | ((Var v), off) ->  resNestedStructLval (v2e v) (AddrOf(Var v, off)) off svoid index 0 vi

     | (Mem(Lval(v)), off) ->  resNestedStructLval (Lval(v)) (AddrOf(Mem(Lval(v)), off)) off svoid index 0 vi


     | _ -> ()







(* Expressions contains pointers/arrays *)
let rec checkExp e = 
   match e with
    | Lval(Mem(e1), NoOffset) -> 
      begin
        match e1 with
           | BinOp(op,e2,e3,t) ->
                  let call = mkVariableTablefxn (d_string "%a" d_exp e) e3 in
               let call1 = mkArrayStableEntryfxn (d_string "%a" d_exp e2) e3 ((d_string "%a" d_exp e2) ^ "1" ^ (d_string "%d" !aindex)) e1 1 in
                                
                        stmtlist := !stmtlist @ [ call;  call1];
                                          aindex := !aindex + 1

          | _ ->        let x = countRef e 0 in
                           let call = mkVariableTablefxn (d_string "%a" d_exp e) (integer x) in
                             stmtlist := !stmtlist @ [ call]

       end

    | Lval((Var v), (Index(e1, NoOffset))) -> 
       let call = mkVariableTablefxn (d_string "%a" d_exp e) e1 in
         let call1 = mkArrayStableEntryfxn v.vname e1 (v.vname ^ "2" ^ (d_string "%d" !aindex)) (AddrOf(((Var v), (Index(e1, NoOffset))))) 1 in
                                 stmtlist := !stmtlist @ [call; call1];
                                          aindex := !aindex + 1;

    | AddrOf(v) -> checkExp (Lval(v))                  

    | UnOp(op,e1,t) -> checkExp e1
    | BinOp(op, e1, e2, t) -> checkExp e1; checkExp e2 
    | _ -> ()



(* Function to convert infix expressions in to S-Expression format *)
let rec getSExp (e : exp)  = 
 match e with
   | BinOp(op,e1,e2,l) -> begin
                              match op with
                               |Eq -> ("(=" ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ ")")
                               |Ne -> ("(! (=" ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ "))")
                               | _ -> ("(" ^ (d_string "%a" d_binop op) ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ ")")
                         end

   | UnOp(op,e1,_) ->  ("(" ^ (d_string "%a" d_unop op) ^ " " ^ (getSExp e1) ^ ")")

   | CastE(t, e1) -> getSExp e1                     

   | _ -> (d_string "%a" d_exp e)



(* Visitor *)
class pathSymbolVisitorClass (fdec : fundec) (sname: varinfo) (svoid: varinfo) (index: varinfo) = object (self)
  inherit nopCilVisitor                        

   method vinst i = begin
    match i with

     | Set((Var vi, Index(e, NoOffset)), Const(CInt64(n, _, _)) , loc) ->  

            let lhs = (d_string "%s" vi.vname) in
               let t = (match vi.vtype with
                              |TArray(TInt(_,_),_,_) -> 1
                              |TArray(TFloat(_,_),_,_) -> 2
                              | _ -> -1 ) in 
                let pre = mkarraytableEntryfxn lhs e "Constant" (AddrOf(Var vi, Index(e, NoOffset))) t in
                  ChangeTo [i ; pre]




     | Set((Var vi, Index(e, NoOffset)), e1 , loc) ->  
         
            stmtlist := [];
            checkExp e1;
                        
            let lhs = (d_string "%s" vi.vname) in
             let rhs = d_string "%a" d_exp e1 in
               let t = (match vi.vtype with
                              |TArray(TInt(_,_),_,_) -> 1
                              |TArray(TFloat(_,_),_,_) -> 2
                              | TPtr(_,_) -> 1
                              | _ -> -1 ) in 
                let pre = mkArrayassignmentfxn lhs e rhs (AddrOf(Var vi, Index(e, NoOffset))) t in
                  ChangeTo ([i] @ !stmtlist @ [pre])


    
     
    | Set((Var vi, NoOffset), AddrOf(v) , loc) ->  

            stmtlist := [];
            checkExp (AddrOf(v));
                        
           let lhs = (d_string "%s" vi.vname) in
             let rhs = "addr_" ^ (d_string "%a" d_lval v) in
              let rhs1 = (d_string "%a" d_lval v) in
                let t = (match vi.vtype with
                              |TPtr(TInt(_,_),_) -> 1
                              |TPtr(TFloat(_,_),_) -> 2
                              | TPtr(_,_) -> 1
                              | _ -> -1 ) in   
                let pre = mkstableEntryfxn lhs rhs (AddrOf(Var vi, NoOffset)) t in
                  let pre1 = mkstableEntryfxn rhs rhs1 (AddrOf(v)) t in
                      ChangeTo ([i] @ !stmtlist @ [pre; pre1])


     | Set((Mem e, NoOffset), CastE(_,Const(_)), l) ->  

         let t = (match typeOfLval (Mem e, NoOffset) with
                              |TInt(_,_) -> 1
                              |TFloat(_,_) -> 2
                              |TPtr(TInt(_,_),_) -> 1
                              |TPtr(TFloat(_,_),_) -> 2
                              | _ -> -1 ) in 
               
      let pre = (match e with
             |BinOp(op,e1,e2,_) -> mkarraytableEntryfxn (d_string "%a" d_exp e1) e2 "Constant" e t 
             |_ -> mkarraytableEntryfxn (d_string "%a" d_exp e) (integer 0) "Constant" e t 
              )
             in

                 ChangeTo[i; pre]


      | Set((Mem e, NoOffset), e1 , loc) ->  
                   
 
            stmtlist := [];
            checkExp e1;
                        
            let lhs = (match e with
                          |BinOp(op,e2,e3,l) -> d_string "%a" d_exp e2 
                          |_ -> d_string "%a" d_exp e) in

            let ind = (match e with
                          |BinOp(op,e2,e3,l) -> e3
                          |_ -> integer 0) in


             let rhs = getSExp e1 in
               let t = (match typeOfLval (Mem e, NoOffset) with
                              |TInt(_,_) -> 1
                              |TFloat(_,_) -> 2
                              |TPtr(TInt(_,_),_) -> 1
                              |TPtr(TFloat(_,_),_) -> 2
                              | _ -> -1 ) in 
                let pre = mkArrayassignmentfxn lhs ind rhs e t in
                  ChangeTo ([i] @ !stmtlist @ [pre])

      



       
    | Set(lv, CastE(_,Const(_)), l) ->  

                        (match lv with
                         | (v,Field(_,_)) -> ChangeTo[i]
                         | _ ->
                          let lhs = (d_string "%a" d_lval lv) in
                           let t = (match typeOfLval lv with
                                     | TInt(_,_) -> 1
                                     | TFloat(_,_) -> 2
                                     | TPtr(_,_) -> 1
                                     | _ -> -1) in
                            let pre = mkstableEntryfxn lhs "Constant" (AddrOf(lv)) t in
                               ChangeTo[i; pre])

 

    | Set(lv, Const(_), l) ->  

                        (match lv with
                         | (v,Field(_,_)) -> ChangeTo[i]
                         | _ ->
                          let lhs = (d_string "%a" d_lval lv) in
                           let t = (match typeOfLval lv with
                                     | TInt(_,_) -> 1
                                     | TFloat(_,_) -> 2
                                     | TPtr(_,_) -> 1
                                     | _ -> -1) in
                            let pre = mkstableEntryfxn lhs "Constant" (AddrOf(lv)) t in
                               ChangeTo[i; pre])



    | Set(lv, e, l) -> 

      ( match lv with
       | (v,Field(_,_)) -> ChangeTo[i]
       | _ -> 

      (* if (d_string "%a" d_lval lv)="exp_outcome" then
          ChangeTo [i]
 
      else*)
       begin
            stmtlist := [];
            stlist := [];

             match e with
              |Lval(v,Field(_,_)) ->  resolveStructType e lv sname svoid index;
                                     ChangeTo ([i] @ !stlist)

              |Lval(v,Index(_,Field(_,_))) -> resolveStructType e lv sname svoid index;
                                     ChangeTo ([i] @ !stlist)

              |Lval(v,NoOffset) ->  checkExp e;
                        
                                let rhs = getSExp e in
                                 let lhs = (d_string "%a" d_lval lv) in
                                  let t = (match typeOfLval lv with
                                             | TInt(_,_) -> 1
                                             | TFloat(_,_) -> 2
                                             | TPtr(_,_) -> 1
                                             | _ -> -1) in
                                  let pre = mkassignmentfxn lhs rhs (AddrOf(v,NoOffset)) t in
                                    ChangeTo ([i] @ !stmtlist @ [pre])

              |Lval(v,Index(e1,NoOffset)) ->
                                 checkExp e;
                        
                                let rhs = getSExp e in
                                 let lhs = (d_string "%a" d_lval lv) in
                                  let t = (match typeOfLval lv with
                                             | TInt(_,_) -> 1
                                             | TFloat(_,_) -> 2
                                             | TPtr(_,_) -> 1
                                             | _ -> -1) in
                                  let pre = mkassignmentfxn lhs rhs (AddrOf(v,Index(e1,NoOffset))) t in
                                    ChangeTo ([i] @ !stmtlist @ [pre])

             

              | _ -> begin

                       match lv with
                         | (_, Field(_, _)) -> 
                                         resolveStructTypeLval lv sname svoid index;
                                         let pre = mkUpdateNamefxn (v2e sname) (mkString (d_string "%a" d_exp e)) in
                                          ChangeTo ([i] @ !stlist @ [pre])

                         | _ ->
                                checkExp e;
                        
                                let rhs = getSExp e in
                                 let lhs = (d_string "%a" d_lval lv) in
                                  let t = (match typeOfLval lv with
                                             | TInt(_,_) -> 1
                                             | TFloat(_,_) -> 2
                                             | TPtr(_,_) -> 1
                                             | _ -> -1) in
                                  let pre = mkassignmentfxn lhs rhs (AddrOf(lv)) t in
                                    ChangeTo ([i] @ !stmtlist @ [pre])
                    end

       end)


     |Call(Some (Var vi, NoOffset), nm, _, _) ->
               let lhs = (d_string "%s" vi.vname) in
    if (d_string "%a" d_exp nm)="getConditionalOutcome" || (d_string "%a" d_exp nm)="isNotQueueEmpty" || (d_string "%a" d_exp nm)="getTestCases" then
                  begin
                             ChangeTo [i]
                 end
            
              else
                 begin

                    let t = (match vi.vtype with
                                     | TInt(_,_) -> 1
                                     | TFloat(_,_) -> 2
                                     | _ -> -1) in
                      let pre = mkstableEntryfxn vi.vname "Function" (AddrOf(Var vi, NoOffset)) t  in 
                             ChangeTo [i ; pre]
                 end

   
    | _ -> DoChildren
  end
     
end   
 

let pathSymbol (f: file) : unit =
  let fname = !Param.func in
  let doGlobal = function
    | GVarDecl (v, _) when v.vname = !printFunctionName -> 
          if !printf = None then
             printf := Some v

    | GFun (fdec, loc) when fdec.svar.vname = fname->              

         let sname = makeLocalVar fdec "symName" charPtrType in
           let svoid = makeLocalVar fdec "addr" voidPtrType in
             let index = makeLocalVar fdec "in" (TArray(charType, Some (integer 15), [])) in

   let pathSymbolVisitor = new pathSymbolVisitorClass fdec sname svoid index in
        ignore (visitCilFunction pathSymbolVisitor fdec )
                   

    | _ -> ()
  in
  Stats.time "pathSymbol" (iterGlobals f) doGlobal;
  if !addProto then begin
     let p = makePrintfFunction () in 
         f.globals <- GVarDecl (p, locUnknown) :: f.globals
  end  

let feature : featureDescr = 
  { fd_name = "pathSymbol";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = pathSymbol;
    fd_post_check = true
  } 


