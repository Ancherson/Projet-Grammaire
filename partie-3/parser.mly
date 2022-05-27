%{
open Ast
%}

%token PROGRAM EOF VIRGU INPUT_SY CASE STATE OF NEXT PUSH CHANGE POP DEUXPO BEGIN END STACK_SY INIT_STATE INIT_STACK STATES REJECT TOP
%token<string> LETTRE

%start<Ast.automate> input

%%

  
input: c = automate EOF {c}

automate :
 d=declaration p=program {Automate(d,p)}

declaration :
  i=inputsymbols s=stacksymbols st=states isti=initialstate istk=initialstack {Declaration(i,s,st,isti,istk)}

inputsymbols :
  INPUT_SY s = suitelettres_nonvide {Inputsymbols(s)}

stacksymbols :
  STACK_SY s = suitelettres_nonvide {Stacksymbols(s)}

states :
  STATES s = suitelettres_nonvide {States(s)}

initialstate :
   INIT_STATE l=LETTRE {Initialstate(l)}

initialstack :
  INIT_STACK l=LETTRE {Initialstack(l)}

suitelettres_nonvide  :
  | l=LETTRE {Lettre_nonvide(l)} 
  | l=LETTRE VIRGU s=suitelettres_nonvide {Suitelettres_nonvide(l,s)}

program : 
  PROGRAM c = caselist {Program(c)}

caselist:
  |  {None}
  | c=case cl=caselist {Caselist(c,cl)}

case :
  |CASE STATE OF sl = stateslist {Statess(sl)}
  |CASE TOP OF tl = toplist {Tops(tl)}
  |CASE NEXT OF al = actionlist {Nexts(al)}

stateslist:
  |{None}
  |s = state st=stateslist {Stateslist(s,st)} 

state :
  l=LETTRE DEUXPO BEGIN c=case END {State(l,c)}

toplist :
|{None}
| t=top tl=toplist {Toplist(t,tl)}

top :
  |l=LETTRE DEUXPO BEGIN c=case END {Top(l,c)}
  |l=LETTRE DEUXPO a=action {Top_action(l,a)}

actionlist :
|{None}
| a=action al=actionlist {Actionlist(a,al)}

action :
  |POP {Pop_epsilon}
  |REJECT {Reject_espilon}
  |CHANGE ll=LETTRE {Change_espilon(ll)}
  |PUSH ll=LETTRE {Push_espilon(ll)}
  |l=LETTRE DEUXPO POP {Pop(l)}
  |l=LETTRE DEUXPO REJECT {Reject(l)}
  |l=LETTRE DEUXPO CHANGE ll=LETTRE {Change(l,ll)}
  |l=LETTRE DEUXPO PUSH ll=LETTRE {Push(l,ll)}


