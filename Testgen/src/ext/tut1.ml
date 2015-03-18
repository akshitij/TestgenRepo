open Cil

module E = Errormsg
module L = List


let levelH : (exp, int) Hashtbl.t = (Hashtbl.create 100)

let leftStmt = ref dummyStmt
let parentExp = ref (mkString "")
let save  = ref []
let testNesting = ref 0


let testing (s:stmt) : unit = 
  match s.skind with
    | If(e,tb,fb,l) -> testNesting := 1
    | _ -> ()


let fixStmt (s:stmt) : unit = 
   match s.skind with
      | If(e,tb,fb,l) ->
      (*   E.log "\nSub  Expression %a\n" d_exp e;*)
     
      ignore(Pretty.fprintf stdout "\n\t [ %a ] -> %a\n" d_exp !parentExp d_exp e);

      Hashtbl.add levelH e ((Hashtbl.find levelH !parentExp) + 1);
 
      E.log "Added entry for key %a, Level %d\n" d_exp e (Hashtbl.find levelH e);


       L.iter testing tb.bstmts;
       L.iter testing fb.bstmts;

       if !testNesting==1 then
            save := !save @ [s]; testNesting := 0

                   
  
    (* List.iter (fun v-> E.log "list contents %a  " d_stmt v) !save   *)

    | _ -> ()


let rec tut1FixStmt (s : stmt) : unit = 

match s.skind with
    | If(e,tb,fb,l) ->
      (*E.log "\nMain  Expression %a\n" d_exp e;*)       

       parentExp := e;

       tut1FixBlock tb;
       tut1FixBlock fb;

    | _ -> ()

and tut1FixBlock (b : block) : unit = 

      L.iter fixStmt b.bstmts;

   if((List.length !save) > 1) then
     begin
     leftStmt := List.hd !save;
     save := List.tl !save;
     tut1FixStmt !leftStmt
     end;

 if((List.length !save) == 1) then
  begin
     leftStmt := List.hd !save;
     save := [];
     tut1FixStmt !leftStmt
   end


let tut1FixFunction (s : stmt) : unit = 
 match s.skind with
      | If(e,tb,fb,l) ->
           Hashtbl.add levelH e 1; 
           E.log "Added entry for key %a, value %d\n" d_exp e (Hashtbl.find levelH e);
            tut1FixStmt s

      | _ -> ()


let tut1 (f:file) : unit = 
      L.iter (fun g ->
      match g with
       |GFun (fd, loc)->
          L.iter (fun v ->
                       match v.vtype with
                        | TPtr(_ , _) ->  E.log "%s type : %a\n" v.vname d_type v.vtype
                        | _ -> E.log "Not pointer\n") fd.slocals;
                        

        L.iter tut1FixFunction fd.sbody.bstmts
       | _ -> ())
   f.globals

let feature : featureDescr = 
  { fd_name = "tut1";
    fd_enabled = ref false;
    fd_description = "";
    fd_extraopt = [];
    fd_doit = tut1;
    fd_post_check = true
  } 

