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
  | ')'            { RPAREN }
  | '('            { LPAREN }
  | ';'            {POINTVIR}
  | ','             { VIRGU }
  | "initial state:" {INIT_STATE}
  | "states:"     {STATES}
  | "transitions:" {TRANS}
  | lettre      { LETTRE(Lexing.lexeme lexbuf) }
  | eof            { EOF }
  | _            { failwith ("unexpected character: " ^Lexing.lexeme lexbuf) }