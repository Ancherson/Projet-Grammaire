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
  | ','             { VIRGU }
  | "initial state:" {INIT_STATE}
  | "states:"     {STATES}
  | "transitions:" {TRANS}
  | ''              {EPSILON}
  | lettre as c     { LETTRE(c) }
  | eof            { EOF }
  | _            { failwith "unexpected character" }