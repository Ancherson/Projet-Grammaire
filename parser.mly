%{
open Ast
%}

%token LPAREN RPAREN EOF VIRGU INPUT_SY STACK_SY INIT_STATE INIT_STACK STATES TRANS
%token<string> LETTRE

%start<Ast.automate> input

%%

  
input: c = automate EOF { c }

automate :
 d=declaration  t=transition {Automate(d,t)}

declaration :
  i=inputsymbols s=stacksymbols st=states isti=initialstate istk=initialstack {Declaration(i,s,st,istt,istk)}

inputsymbols :
  s = suitelettres_nonvide {Inputsymbols(s)}

stacksymbols :
  s = suitelettres_nonvide {Stacksymbols(s)}

states :
  s = suitelettres_nonvide {States(s)}

initialstate :
   INIT_STATE l=LETTRE {Initialstate(l)}

initialstack :
  INIT_STACK l=LETTRE {Initialstack(l)}

suitelettres_nonvide  :
  | l=LETTRE {Suitelettres_nonvide(l)} 
  | l=LETTRE s=suitelettres_nonvide {Suitelettres_nonvide(l,s)}

transitions :
  TRANS l=translist  {Transitions(l)}

translist  :
  | None {Translist()}
  | t=transition tl=translist {Translist(t,tl)}

transition :
  LPAREN  l1=LETTRE  lv=lettre_ou_vide  l2=LETTRE  l3=LETTRE  s=stack  RPAREN {Transition(l1,lv,l2,l3,s)}

lettre_ou_vide :
  | None
  | lettre

stack :
  | None
  | nonemptystack 

nonemptystack :
  | None
  | lettre  nonemptystack 
