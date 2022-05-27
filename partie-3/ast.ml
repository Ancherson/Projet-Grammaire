type automate = Automate of  declaration * program

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
| Program of caselist

and caselist =
|None
|Caselist of case * caselist

and case = 
| Statess of stateslist
| Tops of  toplist
| Nexts of actionlist

and stateslist =
|None
|Stateslist of state * stateslist

and state =
State of string * case

and toplist =
|None
|Toplist of top * toplist

and top =
|Top of string * case
|Top_action of string * action

and actionlist=
|None
|Actionlist of action * actionlist

and action =
|Pop_epsilon
|Reject_espilon
|Change_espilon of string
|Push_espilon of string
|Pop of string
|Reject of string 
|Change of string * string
|Push of string * string

and lettre_ou_vide = 
| None
| Lettre_ou_vide of string




