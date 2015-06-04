

let help_msg = "Computes the Coverage Percentage of a program"

module Self = Plugin.Register
(struct
	let name = "Testgen"
	let shortname = "Testgen"
	let help = help_msg
end)

let run () =
(

)


let () =  Db.Main.extend run
