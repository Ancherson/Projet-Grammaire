%{
open Ast
%}

%token POINTVIR LPAREN PROGRAM RPAREN EOF VIRGU INPUT_SY CASE STATE OF NEXT PUSH CHANGE POP DEUXPO BEGIN END STACK_SY INIT_STATE INIT_STACK STATES TRANS
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

program : 
  PROGRAM p = caseslist {Program(p)}

caseslist :
  | {None}
  |  c = case cl = caseslist {Caseslist(c,cl)}

case :
  |CASE c = case cl = caseslist {Caseslist(c,cl)}
  (* un case peut contenir un (state etc) ou bien une listes de cases *)

casetype :
  |NEXT OF {}
  |PUSH OF {}

lettre_ou_vide :
  |  {None}
  | l=LETTRE {Lettre_ou_vide(l)}

stack :
  |  {None}
  | s=nonemptystack {Stack(s)}

nonemptystack :
  | l=LETTRE {Monostack(l) }
  | l=LETTRE POINTVIR ns=nonemptystack {Nonemptystack (l,ns)}
