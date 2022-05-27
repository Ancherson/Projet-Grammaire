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
| Program of case

and case = 
| State of string * case
| Top of string * case
| Next of string * action

and action =
|Action of string
|Action of string * string


and lettre_ou_vide = 
| None
| Lettre_ou_vide of string




