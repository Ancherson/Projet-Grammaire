%{
open Ast
%}

%token POINTVIR LPAREN RPAREN EOF VIRGU INPUT_SY STACK_SY INIT_STATE INIT_STACK STATES TRANS
%token<string> LETTRE

%start<Ast.automate> input

%%

  
input: c = automate EOF {c}

automate :
 d=declaration t=transitions {Automate(d,t)}

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

transitions :
  TRANS l=translist  {Transitions(l)}

translist  :
  |  {None}
  | t=transition tl=translist {Translist(t,tl)}

transition :
  LPAREN l1=LETTRE VIRGU lv=lettre_ou_vide VIRGU l2=LETTRE VIRGU l3=LETTRE VIRGU s=stack RPAREN {Transition(l1,lv,l2,l3,s)}

lettre_ou_vide :
  |  {None}
  | l=LETTRE {Lettre_ou_vide(l)}

stack :
  |  {None}
  | s=nonemptystack {Stack(s)}

nonemptystack :
  | l=LETTRE {Monostack(l) }
  | l=LETTRE POINTVIR ns=nonemptystack {Nonemptystack (l,ns)}
