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

let rec get_string_from_suite (su:suitelettres_nonvide) :string =
  match su with 
  |Lettre_nonvide(s) -> s
  |Suitelettres_nonvide(s,su2) -> s ^ (get_string_from_suite su2)
;;

let get_input_symbols (decla : declaration) :string =
  match decla with 
  |Declaration(inp,_,_,_,_) -> begin match inp with
                              |Inputsymbols(su) -> get_string_from_suite su
                              end
;; 

let get_stack_symbols (decla : declaration) :string =
  match decla with 
  |Declaration(_,sa,_,_,_) ->  match sa with
                              |Stacksymbols(su) -> get_string_from_suite su
;;

let get_state_symbols (decla : declaration) :string =
  match decla with 
  |Declaration(_,_,st,_,_) ->  match st with
                              |States(su) -> get_string_from_suite su
;;

let count_elem_tranlist (transis:translist) : int =
  let rec count_elem_tranlist_rec (transis:translist) (i:int) : int =
    match transis with 
    |Translist(_,next) -> count_elem_tranlist_rec next (i+1)
    |None -> i
  in count_elem_tranlist_rec transis 0
;;

let string_to_stringlist (s:string) :string list=
  let rec exp i l =
    if i < 0 then l else exp (i - 1) ((String.make 1 s.[i]) :: l) in
  exp (String.length s - 1) []
;;

let is_deterministe (symbol:lettre_ou_vide list) (stack:string list) (state:string list) (transis:translist) :bool =

  let rec is_deterministe_rec (symbol:lettre_ou_vide list) (stack:string list) (o_stack:string list)
  (state:string list) (o_state:string list) (transis:translist) :bool =  
    match symbol with 
    |x::l1 -> (match stack with 
                |y::l2 -> (match state with
                          |z::l3 -> ((count_elem_tranlist (get_transis_from_symbol (get_transis_from_stack (get_transis_from_state transis z) y) x)) < 2)  
                                    && is_deterministe_rec symbol  stack o_stack l3 o_state transis
                          |[] -> is_deterministe_rec symbol l2 o_stack o_state o_state transis)

                |[] -> is_deterministe_rec l1 o_stack o_stack o_state o_state transis)
                
    |[] -> true
    in is_deterministe_rec (None::symbol) stack stack state state transis
;;

let explode (s:string)  : lettre_ou_vide list=
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (Lettre_ou_vide(String.make 1 s.[i]) :: l) in
  exp (String.length s - 1) []
;;

let launch (word:string) :unit = 
  let lexbuf = Lexing.from_channel stdin in 
  let ast = Parser.input Lexer.main lexbuf in 
  
  let input_symbols = get_input_symbols (get_declaration ast) in
  let stack_symbols = get_stack_symbols (get_declaration ast) in
  let state_symbols = get_state_symbols (get_declaration ast) in

  let current_state =  get_initial_state (get_declaration ast) in

  if (not (String.contains stack_symbols (get_initial_stack (get_declaration ast)).[0])) then failwith("initial stack pas dans la liste");
  if (not (String.contains state_symbols current_state.[0])) then failwith("Initial state pas dans la liste");
  
  let symbol = explode input_symbols in
  let stack = string_to_stringlist stack_symbols in
  let state = string_to_stringlist state_symbols in

  let transis = get_transis ast in

  if not(is_deterministe symbol stack state transis) then failwith("Automate pas deterministe");


  let current_stack =  Stack.create() in
  let mot = explode word in
  

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
