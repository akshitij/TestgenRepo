open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

let levelH : (exp, int) Hashtbl.t = (Hashtbl.create 100)

let leftStmt = ref dummyStmt
let parentExp = ref (mkString "")
let save  = ref []
let testNesting = ref 0

let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 


let rec checkExp e : exp = 
   match e with
    | Lval(Mem(e1), NoOffset) -> checkExp e1
    | UnOp(op,e1,t) -> UnOp(op, checkExp e1,t)
    | BinOp(op, e1, e2, t) -> BinOp(op, checkExp e1, checkExp e2, t); 
    | _ -> e


let function1 = ref "hash_level_insert"

let makeHashlevelInsertFunction () : varinfo = 
        let v = makeGlobalVar !function1 
                    (TFun(voidType, Some [("key", charPtrType, []);
                                          ("val", intType, [])],
                             true, [])) in
         v

let mkhashlevelinsertfxn (key: string) (value : int) : instr = 
  let i: varinfo = makeHashlevelInsertFunction () in 
  Call(None, Lval(var i), [mkString key; integer value], !currentLoc)


let testing (s:stmt) : unit = 
  match s.skind with
    | If(e,tb,fb,l) -> testNesting := 1
    | _ -> ()


let fixStmt (s:stmt) : unit = 
   match s.skind with

     | If(BinOp(op ,CastE( t1 , e1) ,CastE( t2 , CastE(t, e2)) , t3),tb,fb,l)->  
                  let rhs = (BinOp(op, e1, e2, t3)) in

                     ignore(Pretty.fprintf stdout "\n\t [ %a ] -> %a\n" d_exp !parentExp d_exp rhs);
                     Hashtbl.add levelH rhs ((Hashtbl.find levelH !parentExp) + 1);
  
      E.log "Added entry for key %a, Level %d\n" d_exp rhs (Hashtbl.find levelH rhs);

       List.iter testing tb.bstmts;
       List.iter testing fb.bstmts;

       if !testNesting==1 then
            save := !save @ [s]; testNesting := 0


      | If(e,tb,fb,l) ->
      (*   E.log "\nSub  Expression %a\n" d_exp e;*)
     
      ignore(Pretty.fprintf stdout "\n\t [ %a ] -> %a\n" d_exp !parentExp d_exp e);

      Hashtbl.add levelH (checkExp e) ((Hashtbl.find levelH !parentExp) + 1);
     
 
      E.log "Added entry for key %a, Level %d\n" d_exp (checkExp e) (Hashtbl.find levelH (checkExp e));


       List.iter testing tb.bstmts;
       List.iter testing fb.bstmts;

       if !testNesting==1 then
            save := !save @ [s]; testNesting := 0


    | _ -> ()


let rec levellingFixStmt (s : stmt) : unit = 

match s.skind with
   | If(BinOp(op ,CastE( t1 , e1) ,CastE( t2 , CastE(t, e2)) , t3),tb,fb,l)->  
                            let rhs = (BinOp(op, e1, e2, t3)) in
                               parentExp := rhs;

       levellingFixBlock tb;
       levellingFixBlock fb; 


   | If(e,tb,fb,l) ->
      (*E.log "\nMain  Expression %a\n" d_exp e;*)       

       parentExp := (checkExp e);

       levellingFixBlock tb;
       levellingFixBlock fb;

    | _ -> ()

and levellingFixBlock (b : block) : unit = 

      List.iter fixStmt b.bstmts;

   if((List.length !save) > 1) then
     begin
     leftStmt := List.hd !save;
     save := List.tl !save;
     levellingFixStmt !leftStmt
     end;

 if((List.length !save) == 1) then
  begin
     leftStmt := List.hd !save;
     save := [];
     levellingFixStmt !leftStmt
   end


let rec levellingFixFunction (s : stmt) : unit = 
 match s.skind with
      | If(BinOp(op ,CastE( t1 , e1) ,CastE( t2 , CastE(t, e2)) , t3),tb,fb,l)->  
                  

                            let rhs = (BinOp(op, e1, e2, t3)) in
                               Hashtbl.add levelH rhs 1; 
           E.log "Added entry for key %a, value %d\n" d_exp rhs (Hashtbl.find levelH rhs);

           levellingFixStmt s


      | If(e,tb,fb,l) ->
           Hashtbl.add levelH (checkExp e) 1; 
           E.log "Added entry for key %a, value %d\n" d_exp (checkExp e) (Hashtbl.find levelH (checkExp e));

           levellingFixStmt s

      | Block(b) ->  List.iter levellingFixFunction b.bstmts;

      | _ -> ()



class levellingVisitor = object
  inherit nopCilVisitor                        

method vstmt (s : stmt) = begin
 let action s =
      match s.skind with

    | If(BinOp(op ,CastE( t1 , e1) ,CastE( t2 , CastE(t, e2)) , t3),tb,fb,l)-> 
                    let rhs = (BinOp(op, e1, e2, t3)) in
                  let pre = mkhashlevelinsertfxn (d_string "%a" d_exp rhs) (Hashtbl.find levelH rhs) in
                        let pre1 = mkhashlevelinsertfxn ("!" ^ (d_string "%a" d_exp rhs)) (Hashtbl.find levelH rhs) in    
                         let tblk = mkBlock (mkStmtOneInstr pre :: tb.bstmts) in
                           let fblk = mkBlock (mkStmtOneInstr pre1 :: fb.bstmts) in            
                            let nb = mkBlock ([mkStmt (If ((BinOp(op ,CastE( t1 , e1) ,CastE( t2 , CastE(t, e2)) , t3)), tblk , fblk,l))])  in
                                              s.skind <- Block nb;
                                            
                              s    


    
    | If(e,tb,fb,l)->           
                      let pre = mkhashlevelinsertfxn (d_string "%a" d_exp (checkExp e)) (Hashtbl.find levelH (checkExp e)) in
                        let pre1 = mkhashlevelinsertfxn ("!" ^ (d_string "%a" d_exp (checkExp e))) (Hashtbl.find levelH (checkExp e)) in    
                         let tblk = mkBlock (mkStmtOneInstr pre :: tb.bstmts) in
                           let fblk = mkBlock (mkStmtOneInstr pre1 :: fb.bstmts) in            
                            let nb = mkBlock ([mkStmt (If (e, tblk , fblk,l))])  in
                                              s.skind <- Block nb;
                                            
                              s    
               

    | _ -> s

 in 
       ChangeDoChildrenPost(s,action)
  end

end



let levellingVisitor = new levellingVisitor


let levelling (f:file) : unit = 

let fname = read_line () in

      List.iter (fun g ->
      match g with
       |GFun (fd, loc) when fd.svar.vname=fname-> 

          List.iter levellingFixFunction fd.sbody.bstmts;

           ignore (visitCilFunction levellingVisitor fd)

         
       | _ -> ())
   f.globals

let feature : featureDescr = 
  { fd_name = "levelling";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = levelling;
    fd_post_check = true
  } 

