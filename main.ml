open Ast;;



let is_from_state (trans : transition) (state : string) : bool =
match trans with
|Transition(st,_,_,_,_) -> st = state
;;


let rec get_transis_from_state (transis : translist) (state : string) : translist=
  match transis with
  |Translist (trans,ll) -> if (is_from_state trans state) 
                then Translist(trans,get_transis_from_state ll state)
                else (get_transis_from_state ll state)
  |_ -> None
;;


let with_symbol (trans : transition) (symbol : lettre_ou_vide) : bool =
match trans with
|Transition(_,sy,_,_,_) -> sy = symbol
;;

let rec get_transis_from_symbol (transis : translist) (symbol : lettre_ou_vide) : translist=
  match transis with
  |Translist (trans,next) -> if (with_symbol trans symbol) 
                then Translist(trans,get_transis_from_symbol next symbol)
                else (get_transis_from_symbol next symbol)
  |_ -> None
;;


let is_from_stack (trans : transition) (stack : string) : bool =
match trans with
|Transition(_,_,st,_,_) -> st = stack
;;

let rec get_transis_from_stack (transis : translist) (stack : string) : translist=
  match transis with
  |Translist (trans,next) -> if (is_from_stack trans stack) 
                then Translist(trans,get_transis_from_stack next stack)
                else (get_transis_from_stack next stack)
  |_ -> None
;;





 let rec eval_mot (mot : string list) (auto : automate) (stack: string Stack.t) (state:string) :unit =
  match mot with
  |symbole::reste -> eval_mot reste auto stack state
  |[] -> print_string "fin"
;;



let get_initial_state (decla : declaration) : string =
  match decla with 
  |Declaration (_,_,_,ini_stat,_) -> match ini_stat with
                                    |Initialstate(init) -> init
;;

let get_initial_stack (decla : declaration) : string =
  match decla with
  |Declaration(_,_,_,_,ini_stack) -> match ini_stack with
                                    |Initialstack(init) -> init
;;

let get_declaration (auto:automate) : declaration =
  match auto with
  |Automate(decla,_) -> decla
;;


let get_first_trans (transis : translist) : transition=
  match transis with 
  |Translist(trans,_) -> trans
  |_ -> failwith("pas de transition dispo")
;;

let explode s  : string list=
  let rec exp i l =
    if i < 0 then l else exp (i - 1) ((String.make 1 s.[i]) :: l) in
  exp (String.length s - 1) []
;;

let init (word:string) :unit = 
  let lexbuf = Lexing.from_channel stdin in 
  let ast = Parser.input Lexer.main lexbuf in 
  let current_stack =  Stack.create() in
  let current_state =  get_initial_state (get_declaration ast) in
  let mot = explode word in

  Stack.push (get_initial_stack (get_declaration ast)) current_stack;
  eval_mot mot ast current_stack current_state
;;


let main () =
  match Sys.argv with
  |[|_;word|] ->  init word
  |_ -> print_string "need a word"
;;
(* lancement de ce main *)
let () = main () ;;
