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
  |{None}
  |c=case cl=caselist {Caselist(c,cl)}

case :
  |CASE STATE OF l=LETTRE DEUXPO BEGIN cl=caselist END {State(l,cl)}
  |CASE TOP OF l=LETTRE DEUXPO BEGIN cl=caselist END {TOP(l,cl)}
  |CASE NEXT OF l=LETTRE DEUXPO a=action {Next(l,a)}

action :
  |p=POP {Action(p)}
  |r=REJECT {ACTION(r)}
  |c=CHANGE l=LETTRE {Action(c,l)}
  |p=PUSH l=LETTRE {Action(p,l)}

