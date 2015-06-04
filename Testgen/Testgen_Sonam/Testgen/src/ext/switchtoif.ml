open Cil

module E = Errormsg
module L = List
              

let count = ref 0


(*let rec mkifstmt st (e::elist) lhs: stmt = 
  match st with
     |[x,y] -> let s1 = If(BinOp(Eq,lhs,e,TInt(IInt,[])), (mkBlock [x]), (mkBlock [y]), locUnknown) in
                     slist := !slist @ [mkStmt s1];
                     mkStmt (Block (mkBlock !slist))

     |(x :: y) -> let s1 = If(BinOp(Eq,lhs,e,TInt(IInt,[])), (mkBlock x), (mkBlock []), locUnknown) in
                     slist := !slist @ [mkStmt s1];
                    mkifstmt y elist lhs  
   *)                        


let rec switchtoifFixStmt (s : stmt) : unit = 
   match s.skind with
    |Switch(e,blk,st,loc) ->
               let lhs = e in

               let expList =
                 L.map (fun s ->
                              (L.map (fun l -> match l with
                                                | Case(ex,_) -> E.log "label : %a expression = %a\n" d_label l d_exp ex;
                                                                count := !count + 1;
                                                                ex;
                                                | _ -> E.log "Not if statement\n"; mkString "";
                                       ) s.labels);
                                s.labels = [];     
                         ) blk.bstmts in
           

        List.iter (fun v -> E.log "stmts = %a\n" d_stmt v) st;
                              
             (*   L.iter2 (fun v ->  if !count == 1 then
                                     
                                 else
                                   (let exp1 = BinOp(Eq,lhs,x,TInt(IInt,[])) in
                                       count := !count - 1;
                                       E.log "\n Explist : %a\n" d_exp exp1;
                                       )
                        )  st (List.concat expList); 
 
               let b1 = mkifstmt blk.bstmts (List.concat expList) lhs in
                  s.skind <- b1  *)
           

    | _ -> ()

and switchtoifFixBlock (b : block) : unit = L.iter switchtoifFixStmt b.bstmts

let switchtoifFixFunction (fd : fundec) : unit = switchtoifFixBlock fd.sbody

let switchtoif (f:file) : unit = 
   L.iter (fun g ->
      match g with
       |GFun (fd, loc)->
        switchtoifFixFunction fd
       | _ -> ())
   f.globals

let feature : featureDescr = 
  { fd_name = "switchtoif";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = switchtoif;
    fd_post_check = true
  } 

