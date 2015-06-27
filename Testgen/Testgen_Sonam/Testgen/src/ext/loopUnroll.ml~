(*
   Feature to unroll loop, we are assuming unroll count of 2
   this can be changed to user defined input by changing the 
   value for count variable
 *)

open Pretty
open Cil
open Trace
open List
module E = Errormsg
module H = Hashtbl

(* Hash table used for mapping labels in case of GoTo statments *)
let labelMapping : (label list, stmt) Hashtbl.t = (Hashtbl.create 100)

let count = ref 0
let index = ref 0
let loopConditions = ref []
let newblk = ref []
let newStmt = ref []
let unrolledStmts = ref []
let arrayInput = ref 0
let opr = ref 0 
let qnty = ref 0
let dummyLabelCnt = ref 0
let vars : varinfo list ref = ref []
let fxn : varinfo list ref = ref []

let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt

(* Checks if s2 is substring of s1 *)
let contains s1 s2 =
  let re = Str.regexp_string s2
  in
  try ignore (Str.search_forward re s1 0); true
  with Not_found -> false

(* Checks if the given statement is already marked with dummyLabel *)
let isMarked s =
  List.exists (
    fun x ->
      match x with
      | Label(name, l, b)
          when contains name "dummyLabel" -> true
      | _ -> false
  ) s.labels

(* Protoype for isCopyOf function *)
let isCopyOfCall (copysid: int) (orgsid : int) : instr = 
  let v = makeGlobalVar
            "isCopyOf"
            ( TFun (
                  voidType,
                  Some [("copysid", intType, []);
                        ("orgsid", intType, [])
                       ],
                  true,
                  []
                )
            )
  in 
  Call(None, Lval(var v), [integer copysid; integer orgsid], !currentLoc)

(* Protoype for SID initializer function *)
let initSIDCall = 
  let v = makeGlobalVar
            "initSID"
            ( TFun (
                  voidType,
                  Some [],
                  true,
                  []
                )
            )
  in 
  Call(None, Lval(var v), [], !currentLoc)

(* Replacing the array access variables by "varible_name_i"*)
let rec checkarray (e : exp) i = 
  match e with
  | BinOp(op,e1,e2,l) ->
     BinOp(
         op ,
         (checkarray e1 i),
         (checkarray e2 i),
         l
       );
  | UnOp(op,e1,l) ->
     UnOp(
         op,
         (checkarray e1 i),
         l
       );
  | Lval(Var vi, Index(e, NoOffset)) ->
     let a = copyVarinfo vi (vi.vname ^ "__" ^ (d_string "%d" i))
     in
     Lval(Var a,NoOffset);
  | _ -> e

(* Creating copies of the statements *)
let rec constructStmts (v: stmt) = 
  match v.skind with
  | If(e,tb,fb,l) ->
     let fb1 = mkBlock(
                   List.rev(
                       List.map(
                           fun v -> constructStmts v
                         ) (List.rev fb.bstmts)
                     )
                 )
     in
     let tb1 = mkBlock(
                   List.rev(
                       List.map(
                           fun v -> constructStmts v
                         ) (List.rev tb.bstmts)
                     )
                 )
     in
     let s = mkStmt (If(e,tb1,fb1,locUnknown))
     in 
     let marked = isMarked v
     in
     let x = List.map (
                 fun a -> match a with
                          | Label(name, l, b) when false = contains name "dummyLabel"->
                             Label(name^(d_string "%d" !index) , l,b)
                          |_ -> a
               ) v.labels
     in
     s.labels <- x;
     if not marked then
       begin 
         s.labels <- s.labels@[Label("dummyLabel_" ^ string_of_int !dummyLabelCnt, l, false)];
         v.labels <- v.labels@[Label("dummyLabel_" ^ string_of_int !dummyLabelCnt, l, false)];
       end;
     dummyLabelCnt := !dummyLabelCnt + 1;
     Hashtbl.add labelMapping v.labels s;
     s
       
  | Return(e,l) ->
     let s =  mkStmt (Return(e,locUnknown))  in
     let x = List.map (
                 fun a -> match a with
                          | Label(name, l, b) ->
                             Label(name^(d_string "%d" !index) , l,b)
                          |_ -> a
               ) v.labels
     in
     s.labels <- x;
     Hashtbl.add labelMapping v.labels s;
     s

  | Block(b) ->
     let s = mkStmt(
                 Block(
                     mkBlock (
                         List.rev(
                             List.map (
                                 fun v -> constructStmts v
                               ) (List.rev b.bstmts)
                           )
                       )
                   )
               )
     in
     let x = List.map(
                 fun a -> match a with
                          | Label(name, l, b) -> Label(name^(d_string "%d" !index) , l,b)
                          | _ -> a
               ) v.labels
     in
     s.labels <- x;
     Hashtbl.add labelMapping v.labels s;
     s

  | Instr(i) ->
     let s =  mkStmt(
                  Instr(
                      List.map(
                          fun a -> match a with
                                   | Set(lv,e1,lo) -> Set(lv,e1,locUnknown)
                                   | Call(lv,e,e1,lo) -> Call(lv,e,e1,locUnknown)
                                   | _ -> a
                        ) i
                    )
                )
     in
     let x = List.map(
                 fun a -> match a with
                          | Label(name, l, b) ->
                             Label(name^(d_string "%d" !index) , l,b)
                          | _ -> a
               ) v.labels
     in
     s.labels <- x;
     Hashtbl.add labelMapping v.labels s;
     s

  | Goto(r ,l) ->
     let st = !r in
     let x = Hashtbl.find labelMapping st.labels
     in
     let s = mkStmt(
                 Goto((ref x), locUnknown)
               )
     in
     s
       
  | _ ->
     let s = mkStmt v.skind
     in
     s

(* The loop condition for eg: a || b && c form are broken according to cil transformation so to get the loop condition function is used *)
let rec getWhileLoopConditions (v: stmt) = 
  match v.skind with
  |If(e,tb,fb,l) ->  
    loopConditions := e :: !loopConditions;
    List.iter (fun v -> getWhileLoopConditions v) tb.bstmts;
    List.iter (fun v -> getWhileLoopConditions v) fb.bstmts

  | _ -> ()


(* check for array input variables inside loop *)
let checkForArrayInput (v: instr) =
  match v with
  | Call(lo, e, (a::al), _) ->
     if (d_string "%a" d_exp e)="scanf" then 
       List.iter(
           fun v -> match v with
                    | AddrOf(Var v, Index(_,_)) ->
                       arrayInput := 1
                    | _ -> ();
         ) al 
     else
       ()
  | _ -> ()
           

class loopUnrollVisitorClass (fdec : fundec) = object
  inherit nopCilVisitor     

  method vstmt (s : stmt) = begin
      let action s = 
        match s.skind with
        (* For every statment of kind "loop" do the following *)
        | Loop(blk1, loc, s1, s2) -> 
          arrayInput := 0;
           (* Check if the loop contains the array being filled from stdin *)
          List.iter (
            fun v -> match v.skind with
            | Instr(i1) ->
              List.iter (
                fun a -> checkForArrayInput a
              ) i1
            | _ -> ()
          ) blk1.bstmts;
           (* If array input is being taken in then replace it with empty statement*)
          if !arrayInput=1 then
            mkEmptyStmt ()
          else (
            loopConditions := [];
            newStmt := [];
            newblk := [];
            unrolledStmts := [];
            getWhileLoopConditions (List.hd blk1.bstmts);

            let x = List.map (
              fun v -> constructStmts v
            ) (List.rev(
              List.tl blk1.bstmts)
            )
            in
            newblk := !newblk @ (List.rev x);

            newStmt := [mkStmt(
              If((List.hd !loopConditions), (mkBlock !newblk), (mkBlock []), locUnknown)
            )];

            List.iter (
              fun v -> 
                let st = !newStmt
                in
                newStmt := [mkStmt (If(v,(mkBlock st),(mkBlock []),locUnknown))]
            ) (List.tl !loopConditions);

            for i = 1 to !count do
              Hashtbl.reset labelMapping;
              index := !index+1;
              unrolledStmts := !unrolledStmts @ [(constructStmts (List.hd !newStmt))];
            done;

            s.skind <- Block (mkBlock !unrolledStmts);
            s
          )
              
        | _ -> s
      in 
      ChangeDoChildrenPost(s,action)
    end
end

(* Collects the SIDs of the statements which are the copies of each other *)
let collateCopies stmts =
  let copies = Hashtbl.create 300
  in 
  List.iter (
    fun s ->
      match s.skind with
      | If(e, _, _, _) ->
        s.labels <- List.filter (
          fun l ->
            match l with
            | Label ( name, loc, b ) ->
              begin
                try
                  if ( true = contains name "dummyLabel") then
                    let copyList = Hashtbl.find copies name
                    in
                    Hashtbl.replace copies name (copyList @ [s.sid]);
                    false
                  else
                    true
                with Not_found ->
                  Hashtbl.add copies name [s.sid];
                  false
                | _ -> false
              end
            | _ -> false
        ) s.labels;
        ()
      | _ -> ()
  ) stmts;
  copies

let isCopyOfCallList c =
  let callList = ref []
  in
  Hashtbl.iter (
    fun label copyList->
      let orgsid = List.hd copyList
      in
      List.iter (
        fun sid ->
          callList := !callList @ [mkStmtOneInstr (isCopyOfCall sid orgsid)]
      ) copyList;
  ) c;
  mkBlock !callList

let insertIsCopyOfHolder c f funName=
  let fn = emptyFunction "isCopyOfHolder"
  in
  fn.sbody <- isCopyOfCallList c;
  f.globals <- List.concat (
    List.map (fun g -> match g with
    | GFun(fdec, _) when fdec.svar.vname = funName ->
      GFun(fn, locUnknown) :: [g]
    | GFun(fdec, _) when fdec.svar.vname = "main" ->
      fdec.sbody.bstmts <-  [mkStmtOneInstr( Call(None, Lval(var fn.svar), [], !currentLoc))] @ fdec.sbody.bstmts; 
      fdec.sbody.bstmts <-  [mkStmtOneInstr initSIDCall] @ fdec.sbody.bstmts;   
      [g]
    | _ -> [g]
    ) f.globals);
  ()
  
(* Go through every loop of the said function in the file and unroll it *)
let loopUnroll (f: file) : unit =
  let funName = !Param.func
  in
  count := 2;  
  let doGlobal = function
    | GFun (fdec, loc) ->
       if fdec.svar.vname = funName then
         begin
           let loopUnrollVisitor = new loopUnrollVisitorClass fdec
           in
           ignore (visitCilFunction loopUnrollVisitor fdec);
           (* Cfg.cfgFun fdec; *)
           (* let copies = collateCopies fdec.sallstmts in  *)
           (* insertIsCopyOfHolder copies f funName; *)
           ()
         end   

    | _ -> ()
  in
  Stats.time "loopUnroll" (iterGlobals f) doGlobal
             
let feature : featureDescr = {
  fd_name = "loopUnroll";
  fd_enabled = ref false;
  fd_description = "";
  fd_extraopt = [];
  fd_doit = loopUnroll;
  fd_post_check = true
} 
