type automate = Automate of  declaration * transitions

and declaration = Declaration of inputsymbols * stacksymbols * states * initialstate * initialstack

and inputsymbols = Inputsymbols of suitelettres_nonvide

and stacksymbols = Stacksymbols of  suitelettres_nonvide

and states = States of  suitelettres_nonvide

and initialstate =  Initialstate of string

and initialstack = Initialstack of string

and suitelettres_nonvide = 
| Lettre_nonvide of string 
| Suitelettres_nonvide of string * suitelettres_nonvide

and program = 
| Program of caseslist

and caseslist = 
| None
|caseslist of case * caseslist

and case = 

(*and transitions = Transitions of translist

and translist = 
| None
| Translist of transition * translist

and transition = Transition of string * lettre_ou_vide * string * string * stack
*)
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

