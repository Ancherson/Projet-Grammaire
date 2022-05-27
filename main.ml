open Ast;;

let print_stack (stack : string Stack.t ) =
  if (Stack.is_empty stack) then print_string ("current stack:\n\n")
  else print_string ("current stack: ");

  Stack.iter print_string stack;
  print_string("\n\n");
;;

let print_lettre (l : lettre_ou_vide) =
  print_string ("current character: ");
  match l with 
  |Lettre_ou_vide(s) -> print_string(s^"\n");
  |None -> print_string("\'\'\n");
;;

let rec push_nonEmpty_stack (stack : string Stack.t) (s : nonemptystack) : string Stack.t =
  match s with
  |Monostack(st) -> Stack.push st stack; stack
  |Nonemptystack(st,non_empty) -> Stack.push st stack; push_nonEmpty_stack stack non_empty
;;

let rec push_stack (stack : string Stack.t) (s : stack) : string Stack.t =
  match s with 
  |Stack(non_empty) -> push_nonEmpty_stack stack non_empty
  |None -> stack
;;

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

let lettre_equals (l1 : lettre_ou_vide) (l2:lettre_ou_vide) : bool=
  let s1 =
  match l1 with 
  |Lettre_ou_vide(s) -> s
  |None -> "" 
  in

  let s2 = 
  match l2 with 
  |Lettre_ou_vide(s) -> s
  |None -> "" 
  in

  String.equal s1 s2 
;;


let with_symbol (trans : transition) (symbol : lettre_ou_vide) : bool =
match trans with
|Transition(_,sy,_,_,_) -> if sy = None then true
                          else lettre_equals sy symbol
  
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

let get_first_trans (symbol : lettre_ou_vide) (transis : translist) : transition=
  match transis with 
  |Translist(trans,_) -> trans
  |None -> if symbol = None
            then failwith("l’entrée est épuisée sans que la pile soit vide")
            else failwith("il n’y a aucune transition qui s’applique")
;;

let rec eval_symbol (symbol : lettre_ou_vide) (transis : translist) (stack : string Stack.t) (state : string) : string Stack.t * string =
  print_string ("current state: "^state^"\n");print_stack(stack); print_lettre (symbol);

  if (Stack.is_empty stack && symbol = None) then (stack,state)

  else if (Stack.is_empty stack) then failwith("la pile est vide sans que l’entrée soit épuisée")

  else let current_stack = Stack.pop stack in

  match get_first_trans symbol (get_transis_from_symbol (get_transis_from_stack (get_transis_from_state transis state) current_stack) symbol) with 
  |Transition(_,sy,_,new_state,new_stack) -> if sy = None 
                                            then eval_symbol symbol transis (push_stack stack new_stack) new_state
                                            else (push_stack stack new_stack,new_state)
  (* TODO on faire ici les 3 cas d'erreurs *)
;;


 let rec eval_mot (mot : lettre_ou_vide list) (transis : translist) (stack: string Stack.t) (state:string) :unit =
  match mot with
  |symbol::reste -> let (new_stack,new_state) = eval_symbol symbol transis stack state in 
                    eval_mot reste transis new_stack new_state
  |[] -> if (Stack.is_empty stack)
          then print_string("mot accepte\n")
          else let (new_stack,new_state) = eval_symbol None transis stack state in 
                eval_mot [] transis new_stack new_state
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

let get_transis (auto:automate) : translist =
  match auto with 
  |Automate(_,transi) -> match transi with
                          |Transitions(transis) -> transis
;;


let explode s  : lettre_ou_vide list=
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (Lettre_ou_vide(String.make 1 s.[i]) :: l) in
  exp (String.length s - 1) []
;;

let launch (word:string) :unit = 
  let lexbuf = Lexing.from_channel stdin in 
  let ast = Parser.input Lexer.main lexbuf in 
  let current_stack =  Stack.create() in
  let current_state =  get_initial_state (get_declaration ast) in
  let mot = explode word in
  let transis = get_transis ast in
  Stack.push (get_initial_stack (get_declaration ast)) current_stack;
  eval_mot mot transis current_stack current_state
;;


let main () =
  match Sys.argv with
  |[|_;word|] ->  launch word
  |_ -> print_string "need a single word\n"
;;
(* lancement de ce main *)
let () = main () ;;
