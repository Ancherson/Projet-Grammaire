type automate = Automate of  declaration * transition

and declaration = Declaration of inputsymbols * stacksymbols * states * initialstate * initialstack

and inputsymbols = Inputsymbols of suitelettres_nonvide

and stacksymbols = Stacksymbols of  suitelettres_nonvide

and states = States of  suitelettres_nonvide

and initialstate =  Initialstate of string

and initialstack = Initialstack of string

and suitelettres_nonvide = 
| Lettre_nonvide of string 
| Suitelettres_nonvide of string * suitelettres_nonvide

and transitions = Transitions of translist

and translist = 
| None
| Translist of transition * translist

and transition = Transition of string * lettre_ou_vide * string * string * stack

and lettre_ou_vide = 
| None
| Lettre_ou_vide of string

and stack =
| None
| Stack of nonemptystack 

and nonemptystack = 
| Monostack of string
| Nonemptystack of  string * nonemptystack 

(* let rec as_lettre = function


and apply op l r = 

and apply_decl var l r =
"( let " ^ as_lettre var ^ " = " ^ as_lettre l ^ " in " ^ as_lettre r ^ ")" *)

let rec as_string = function
  | Automate(d,t) -> as_string d ^ "\n" ^ "transitions:\n\n" ^ as_string t ^ " "
  | Declarations(i,s,st,is,iS) -> "input symbols: " ^ as_string i ^ "\n stack symbols: " ^ as_string s ^ "\n states: " ^ as_string st ^ "\n initial state: " ^ as_string is ^ "\n initial stack: " ^ as_string iS ^ "\n"
  | Inputsymbols(x) -> as_string x
  | Stacksymbols(x) -> as_string x
  | States(x) -> as_string x
  | Snitialstate(x) -> as_string x
  | Initialstack(x) -> as_string x
  | Suitelettres_nonvide(x) -> (match x with 
    | Lettre(x) -> x
    | SUIT(x,y) -> as_string x ^ ", " ^ as_string y
  )
  | Transitions(x) -> as_string x
  | Translist(x) -> (match x with 
    | EPS(x) -> as_string x
    | TRANSL(x,y) -> as_string x ^ "\n" ^ as_string y
  )
  | Transition(x,y,z,w,s) -> "(" ^ as_string x ^ " " ^ as_string y ^ " " ^ as_string z ^ " " ^ as_string w ^ " " ^ as_string s ^ ")"
  | Lettre_ou_vide(x) -> (match x with 
    | EPS -> ""
    | Lettre(x) -> as_string x
  )
  | Stack(x) -> (match x with 
    | EPS -> ""
    | NES(x) -> as_string x
  )
  | Nonempty_stack(x) -> (match x with 
    | Lettre(x) -> as_string x
    | NES(x, y) -> x ^ ";" ^ as_string y
  )