let lexbuf = Lexing.from_channel stdin 

let ast = Parser.input Lexer.main lexbuf 


let main () =
  print_string ("l'automate est reconnu par la grammaire\n")
;;
(* lancement de ce main *)
let () = main () ;;
