open Ast;;

let lexbuf = Lexing.from_channel stdin 

let ast = Parser.input Lexer.main lexbuf 



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

(* let eval_mot (mot : string list) (auto : ast) =
  match mot with
  |symbole::reste ->
  *)