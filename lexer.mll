{
open Parser
}

let layout = [ ' ' '\t' '\n' ]
let lettre = ['0'-'9' 'a'-'z' 'A'-'Z' ]

rule main = parse
  | layout        { main lexbuf }
  | ')'            { RPAREN }
  | '('            { LPAREN }
  | lettre as c     { LETTRE(c) }
  | ','             { VIRGU }
  | "input symbols:" {INPUT_SY}
  | "stack symbols:" {STACK_SY}
  | "initial state:" {INIT_STATE}
  | "initial stack symbol:" {INIT_STACK}
  | "states:"     {STATES}
  | "transitions:" {TRANS}
  | ''              {EPSILON}
  | eof            { EOF }
  | _            { failwith "unexpected character" }