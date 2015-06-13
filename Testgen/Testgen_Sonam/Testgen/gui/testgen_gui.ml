open Cil_types

let x1 = ref "./Testgen.sh "
let x2 = ref " "
let line = ref " "
let x = ref " "
let filen = ref " "


let testfun() =
(


if !x = "main" then
x:= "main1";

let x3 = Kernel.Files.get() in 
(*List.iter (printf "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#############%s ") x3;*)
let x4 = List.hd(x3) in
let z = !x1 ^ x4 ^ " " ^ !x  in 
ignore(Guiregister.Self.result "%s" x4);



ignore(Sys.command z);

(*List.iter (printf "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#############%s ") x3;*)


let in_file = open_in "src/src/coverage.txt" in
let line = input_line in_file in
close_in in_file;
print_endline line;
ignore(Guiregister.Self.result "###################");
ignore(Guiregister.Self.result "Coverage Percentage = %s" line);
ignore(Guiregister.Self.result "###################");

)

let fn_selector (popup_factory: GMenu.menu GMenu.factory ) main_ui ~button:_ localizable =
    match localizable with
   | Pretty_source.PVDecl(_, ({vtype = TFun(_,_,_,_)} as vi)) ->
      let callback () = 
         let kf = Globals.Functions.get vi in
         let fundec = Kernel_function.get_definition kf in 
          x := fundec.svar.vname;
         ignore(Guiregister.Self.result "%s" fundec.svar.vname);  
	 (*ignore(Guiregister.Self.result "%s" fundec.svar.vdecl);*)
         testfun()
         in
         ignore (popup_factory#add_item "Show Coverage" ~callback)
        | _->()
    
let main_gui main_ui = main_ui#register_source_selector fn_selector
  
let () = Design.register_extension main_gui
  
  







  



