{
open Parser
}

let layout = [ ' ' '\t' '\n' ]
let lettre = ['0'-'9' 'a'-'z' 'A'-'Z' ]

rule main = parse
  | layout        { main lexbuf }
  | "input symbols:" {INPUT_SY}
  | "stack symbols:" {STACK_SY}
  | "initial stack symbol:" {INIT_STACK}
  | "case"           {CASE}
  | "program:"       {PROGRAM}
  | "state"          {STATE}
  | "of"             {OF}
  | "next"           {NEXT}
  | "push"          {PUSH}
  | "change"        {CHANGE}
  | "pop"            {POP}
  | ')'            { RPAREN }
  | '('            { LPAREN }
  | ';'            {POINTVIR}
  | ':'             {DEUXPO}
  | ','             {VIRGU}
  | "begin"         {BEGIN}
  | "end"         {END}
  | "initial state:" {INIT_STATE}
  | "states:"     {STATES}
  | lettre      { LETTRE(Lexing.lexeme lexbuf) }
  | eof            { EOF }
  | _            { failwith ("unexpected character: " ^Lexing.lexeme lexbuf) }