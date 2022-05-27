
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | VIRGU
    | TOP
    | STATES
    | STATE
    | STACK_SY
    | REJECT
    | PUSH
    | PROGRAM
    | POP
    | OF
    | NEXT
    | LETTRE of (
# 6 "parser2.mly"
      (string)
# 22 "parser2.ml"
  )
    | INPUT_SY
    | INIT_STATE
    | INIT_STACK
    | EOF
    | END
    | DEUXPO
    | CHANGE
    | CASE
    | BEGIN
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState34
  | MenhirState27
  | MenhirState21
  | MenhirState10
  | MenhirState7
  | MenhirState3
  | MenhirState1

# 1 "parser2.mly"
  
open Ast

# 61 "parser2.ml"

let rec _menhir_goto_case : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_case -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv189 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 72 "parser2.ml"
        )))) * _menhir_state * 'tv_case) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv185 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 82 "parser2.ml"
            )))) * _menhir_state * 'tv_case) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv183 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 89 "parser2.ml"
            )))) * _menhir_state * 'tv_case) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (l : (
# 6 "parser2.mly"
      (string)
# 94 "parser2.ml"
            ))), _, (c : 'tv_case)) = _menhir_stack in
            let _8 = () in
            let _6 = () in
            let _5 = () in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_case = 
# 45 "parser2.mly"
                                                (TOP(l,c))
# 105 "parser2.ml"
             in
            _menhir_goto_case _menhir_env _menhir_stack _menhir_s _v) : 'freshtv184)) : 'freshtv186)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv187 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 115 "parser2.ml"
            )))) * _menhir_state * 'tv_case) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)) : 'freshtv190)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv197 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 124 "parser2.ml"
        )))) * _menhir_state * 'tv_case) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv193 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 134 "parser2.ml"
            )))) * _menhir_state * 'tv_case) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv191 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 141 "parser2.ml"
            )))) * _menhir_state * 'tv_case) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (l : (
# 6 "parser2.mly"
      (string)
# 146 "parser2.ml"
            ))), _, (c : 'tv_case)) = _menhir_stack in
            let _8 = () in
            let _6 = () in
            let _5 = () in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_case = 
# 44 "parser2.mly"
                                                  (State(l,c))
# 157 "parser2.ml"
             in
            _menhir_goto_case _menhir_env _menhir_stack _menhir_s _v) : 'freshtv192)) : 'freshtv194)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv195 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 167 "parser2.ml"
            )))) * _menhir_state * 'tv_case) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)) : 'freshtv198)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv223) * _menhir_state * 'tv_case) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv221) * _menhir_state * 'tv_case) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (c : 'tv_case)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_program = 
# 41 "parser2.mly"
                   (Program(c))
# 181 "parser2.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv219) = _menhir_stack in
        let (_v : 'tv_program) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * 'tv_declaration) = Obj.magic _menhir_stack in
        let (_v : 'tv_program) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * 'tv_declaration) = Obj.magic _menhir_stack in
        let ((p : 'tv_program) : 'tv_program) = _v in
        ((let (_menhir_stack, (d : 'tv_declaration)) = _menhir_stack in
        let _v : 'tv_automate = 
# 16 "parser2.mly"
                         (Automate(d,p))
# 196 "parser2.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv213) = _menhir_stack in
        let (_v : 'tv_automate) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv211 * 'tv_automate) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv207 * 'tv_automate) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv205 * 'tv_automate) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, (c : 'tv_automate)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 8 "parser2.mly"
      (Ast.automate)
# 217 "parser2.ml"
            ) = 
# 13 "parser2.mly"
                        (c)
# 221 "parser2.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv203) = _menhir_stack in
            let (_v : (
# 8 "parser2.mly"
      (Ast.automate)
# 228 "parser2.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv201) = Obj.magic _menhir_stack in
            let (_v : (
# 8 "parser2.mly"
      (Ast.automate)
# 235 "parser2.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv199) = Obj.magic _menhir_stack in
            let ((_1 : (
# 8 "parser2.mly"
      (Ast.automate)
# 242 "parser2.ml"
            )) : (
# 8 "parser2.mly"
      (Ast.automate)
# 246 "parser2.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv200)) : 'freshtv202)) : 'freshtv204)) : 'freshtv206)) : 'freshtv208)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv209 * 'tv_automate) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv210)) : 'freshtv212)) : 'freshtv214)) : 'freshtv216)) : 'freshtv218)) : 'freshtv220)) : 'freshtv222)) : 'freshtv224)
    | _ ->
        _menhir_fail ()

and _menhir_goto_action : _menhir_env -> 'ttv_tail -> 'tv_action -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (((('freshtv181 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 264 "parser2.ml"
    ))) = Obj.magic _menhir_stack in
    let (_v : 'tv_action) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (((('freshtv179 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 271 "parser2.ml"
    ))) = Obj.magic _menhir_stack in
    let ((a : 'tv_action) : 'tv_action) = _v in
    ((let ((_menhir_stack, _menhir_s), (l : (
# 6 "parser2.mly"
      (string)
# 277 "parser2.ml"
    ))) = _menhir_stack in
    let _5 = () in
    let _3 = () in
    let _2 = () in
    let _1 = () in
    let _v : 'tv_case = 
# 46 "parser2.mly"
                                         (Next(l,c))
# 286 "parser2.ml"
     in
    _menhir_goto_case _menhir_env _menhir_stack _menhir_s _v) : 'freshtv180)) : 'freshtv182)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NEXT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv135 * _menhir_state)) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LETTRE _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv131 * _menhir_state))) = Obj.magic _menhir_stack in
                let (_v : (
# 6 "parser2.mly"
      (string)
# 319 "parser2.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | DEUXPO ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv127 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 330 "parser2.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | CHANGE ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv107) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | LETTRE _v ->
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : 'freshtv103) = Obj.magic _menhir_stack in
                            let (_v : (
# 6 "parser2.mly"
      (string)
# 347 "parser2.ml"
                            )) = _v in
                            ((let _menhir_env = _menhir_discard _menhir_env in
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : 'freshtv101) = Obj.magic _menhir_stack in
                            let ((l : (
# 6 "parser2.mly"
      (string)
# 355 "parser2.ml"
                            )) : (
# 6 "parser2.mly"
      (string)
# 359 "parser2.ml"
                            )) = _v in
                            ((let c = () in
                            let _v : 'tv_action = 
# 51 "parser2.mly"
                     (Action(c,l))
# 365 "parser2.ml"
                             in
                            _menhir_goto_action _menhir_env _menhir_stack _v) : 'freshtv102)) : 'freshtv104)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : 'freshtv105) = Obj.magic _menhir_stack in
                            (raise _eRR : 'freshtv106)) : 'freshtv108)
                    | POP ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv111) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv109) = Obj.magic _menhir_stack in
                        ((let p = () in
                        let _v : 'tv_action = 
# 49 "parser2.mly"
         (Action(p))
# 384 "parser2.ml"
                         in
                        _menhir_goto_action _menhir_env _menhir_stack _v) : 'freshtv110)) : 'freshtv112)
                    | PUSH ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv119) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | LETTRE _v ->
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : 'freshtv115) = Obj.magic _menhir_stack in
                            let (_v : (
# 6 "parser2.mly"
      (string)
# 399 "parser2.ml"
                            )) = _v in
                            ((let _menhir_env = _menhir_discard _menhir_env in
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : 'freshtv113) = Obj.magic _menhir_stack in
                            let ((l : (
# 6 "parser2.mly"
      (string)
# 407 "parser2.ml"
                            )) : (
# 6 "parser2.mly"
      (string)
# 411 "parser2.ml"
                            )) = _v in
                            ((let p = () in
                            let _v : 'tv_action = 
# 52 "parser2.mly"
                   (Action(p,l))
# 417 "parser2.ml"
                             in
                            _menhir_goto_action _menhir_env _menhir_stack _v) : 'freshtv114)) : 'freshtv116)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : 'freshtv117) = Obj.magic _menhir_stack in
                            (raise _eRR : 'freshtv118)) : 'freshtv120)
                    | REJECT ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv123) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv121) = Obj.magic _menhir_stack in
                        ((let r = () in
                        let _v : 'tv_action = 
# 50 "parser2.mly"
            (ACTION(r))
# 436 "parser2.ml"
                         in
                        _menhir_goto_action _menhir_env _menhir_stack _v) : 'freshtv122)) : 'freshtv124)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (((('freshtv125 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 446 "parser2.ml"
                        ))) = Obj.magic _menhir_stack in
                        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)) : 'freshtv128)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv129 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 457 "parser2.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)) : 'freshtv132)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv133 * _menhir_state))) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)) : 'freshtv136)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv137 * _menhir_state)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)) : 'freshtv140)
    | STATE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv153 * _menhir_state)) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LETTRE _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv149 * _menhir_state))) = Obj.magic _menhir_stack in
                let (_v : (
# 6 "parser2.mly"
      (string)
# 493 "parser2.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | DEUXPO ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv145 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 504 "parser2.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | BEGIN ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (((('freshtv141 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 514 "parser2.ml"
                        ))) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | CASE ->
                            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState34
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv142)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (((('freshtv143 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 532 "parser2.ml"
                        ))) = Obj.magic _menhir_stack in
                        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)) : 'freshtv146)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv147 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 543 "parser2.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)) : 'freshtv150)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv151 * _menhir_state))) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)) : 'freshtv154)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv155 * _menhir_state)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)) : 'freshtv158)
    | TOP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv175 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv171 * _menhir_state)) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LETTRE _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv167 * _menhir_state))) = Obj.magic _menhir_stack in
                let (_v : (
# 6 "parser2.mly"
      (string)
# 579 "parser2.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | DEUXPO ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv163 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 590 "parser2.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | BEGIN ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (((('freshtv159 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 600 "parser2.ml"
                        ))) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | CASE ->
                            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState27
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27) : 'freshtv160)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (((('freshtv161 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 618 "parser2.ml"
                        ))) = Obj.magic _menhir_stack in
                        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)) : 'freshtv164)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv165 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 629 "parser2.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)) : 'freshtv168)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv169 * _menhir_state))) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)) : 'freshtv172)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv173 * _menhir_state)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)) : 'freshtv176)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv177 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)

and _menhir_goto_suitelettres_nonvide : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_suitelettres_nonvide -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv29 * _menhir_state * (
# 6 "parser2.mly"
      (string)
# 663 "parser2.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_suitelettres_nonvide) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv27 * _menhir_state * (
# 6 "parser2.mly"
      (string)
# 671 "parser2.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((s : 'tv_suitelettres_nonvide) : 'tv_suitelettres_nonvide) = _v in
        ((let (_menhir_stack, _menhir_s, (l : (
# 6 "parser2.mly"
      (string)
# 678 "parser2.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_suitelettres_nonvide = 
# 38 "parser2.mly"
                                          (Suitelettres_nonvide(l,s))
# 684 "parser2.ml"
         in
        _menhir_goto_suitelettres_nonvide _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)) : 'freshtv30)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_suitelettres_nonvide) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((s : 'tv_suitelettres_nonvide) : 'tv_suitelettres_nonvide) = _v in
        ((let _1 = () in
        let _v : 'tv_inputsymbols = 
# 22 "parser2.mly"
                                    (Inputsymbols(s))
# 700 "parser2.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37) = _menhir_stack in
        let (_v : 'tv_inputsymbols) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * 'tv_inputsymbols) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | STACK_SY ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv31) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LETTRE _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7) : 'freshtv32)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv33 * 'tv_inputsymbols) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv34)) : 'freshtv36)) : 'freshtv38)) : 'freshtv40)) : 'freshtv42)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_suitelettres_nonvide) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((s : 'tv_suitelettres_nonvide) : 'tv_suitelettres_nonvide) = _v in
        ((let _1 = () in
        let _v : 'tv_stacksymbols = 
# 25 "parser2.mly"
                                    (Stacksymbols(s))
# 742 "parser2.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49) = _menhir_stack in
        let (_v : 'tv_stacksymbols) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv47 * 'tv_inputsymbols) * 'tv_stacksymbols) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | STATES ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv43) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LETTRE _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10) : 'freshtv44)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv45 * 'tv_inputsymbols) * 'tv_stacksymbols) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv46)) : 'freshtv48)) : 'freshtv50)) : 'freshtv52)) : 'freshtv54)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_suitelettres_nonvide) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((s : 'tv_suitelettres_nonvide) : 'tv_suitelettres_nonvide) = _v in
        ((let _1 = () in
        let _v : 'tv_states = 
# 28 "parser2.mly"
                                  (States(s))
# 784 "parser2.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95) = _menhir_stack in
        let (_v : 'tv_states) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv93 * 'tv_inputsymbols) * 'tv_stacksymbols) * 'tv_states) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | INIT_STATE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv89) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LETTRE _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv85) = Obj.magic _menhir_stack in
                let (_v : (
# 6 "parser2.mly"
      (string)
# 807 "parser2.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv83) = Obj.magic _menhir_stack in
                let ((l : (
# 6 "parser2.mly"
      (string)
# 815 "parser2.ml"
                )) : (
# 6 "parser2.mly"
      (string)
# 819 "parser2.ml"
                )) = _v in
                ((let _1 = () in
                let _v : 'tv_initialstate = 
# 31 "parser2.mly"
                       (Initialstate(l))
# 825 "parser2.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv81) = _menhir_stack in
                let (_v : 'tv_initialstate) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv79 * 'tv_inputsymbols) * 'tv_stacksymbols) * 'tv_states) * 'tv_initialstate) = Obj.magic _menhir_stack in
                ((assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | INIT_STACK ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv75) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | LETTRE _v ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv71) = Obj.magic _menhir_stack in
                        let (_v : (
# 6 "parser2.mly"
      (string)
# 848 "parser2.ml"
                        )) = _v in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv69) = Obj.magic _menhir_stack in
                        let ((l : (
# 6 "parser2.mly"
      (string)
# 856 "parser2.ml"
                        )) : (
# 6 "parser2.mly"
      (string)
# 860 "parser2.ml"
                        )) = _v in
                        ((let _1 = () in
                        let _v : 'tv_initialstack = 
# 34 "parser2.mly"
                      (Initialstack(l))
# 866 "parser2.ml"
                         in
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv67) = _menhir_stack in
                        let (_v : 'tv_initialstack) = _v in
                        ((let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv65 * 'tv_inputsymbols) * 'tv_stacksymbols) * 'tv_states) * 'tv_initialstate) = Obj.magic _menhir_stack in
                        let (_v : 'tv_initialstack) = _v in
                        ((let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv63 * 'tv_inputsymbols) * 'tv_stacksymbols) * 'tv_states) * 'tv_initialstate) = Obj.magic _menhir_stack in
                        let ((istk : 'tv_initialstack) : 'tv_initialstack) = _v in
                        ((let ((((_menhir_stack, (i : 'tv_inputsymbols)), (s : 'tv_stacksymbols)), (st : 'tv_states)), (isti : 'tv_initialstate)) = _menhir_stack in
                        let _v : 'tv_declaration = 
# 19 "parser2.mly"
                                                                              (Declaration(i,s,st,isti,istk))
# 881 "parser2.ml"
                         in
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv61) = _menhir_stack in
                        let (_v : 'tv_declaration) = _v in
                        ((let _menhir_stack = (_menhir_stack, _v) in
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv59 * 'tv_declaration) = Obj.magic _menhir_stack in
                        ((assert (not _menhir_env._menhir_error);
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | PROGRAM ->
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : 'freshtv55) = Obj.magic _menhir_stack in
                            ((let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | CASE ->
                                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState21
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21) : 'freshtv56)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : 'freshtv57 * 'tv_declaration) = Obj.magic _menhir_stack in
                            (raise _eRR : 'freshtv58)) : 'freshtv60)) : 'freshtv62)) : 'freshtv64)) : 'freshtv66)) : 'freshtv68)) : 'freshtv70)) : 'freshtv72)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv73) = Obj.magic _menhir_stack in
                        (raise _eRR : 'freshtv74)) : 'freshtv76)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv77 * 'tv_inputsymbols) * 'tv_stacksymbols) * 'tv_states) * 'tv_initialstate) = Obj.magic _menhir_stack in
                    (raise _eRR : 'freshtv78)) : 'freshtv80)) : 'freshtv82)) : 'freshtv84)) : 'freshtv86)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv87) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv88)) : 'freshtv90)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv91 * 'tv_inputsymbols) * 'tv_stacksymbols) * 'tv_states) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv92)) : 'freshtv94)) : 'freshtv96)) : 'freshtv98)) : 'freshtv100)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv13 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 945 "parser2.ml"
        )))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv14)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv15 * _menhir_state))) * (
# 6 "parser2.mly"
      (string)
# 954 "parser2.ml"
        )))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv18)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv20)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv22)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv23 * _menhir_state * (
# 6 "parser2.mly"
      (string)
# 975 "parser2.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv26)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 6 "parser2.mly"
      (string)
# 987 "parser2.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VIRGU ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7 * _menhir_state * (
# 6 "parser2.mly"
      (string)
# 999 "parser2.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LETTRE _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv8)
    | INIT_STATE | STACK_SY | STATES ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9 * _menhir_state * (
# 6 "parser2.mly"
      (string)
# 1015 "parser2.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (l : (
# 6 "parser2.mly"
      (string)
# 1020 "parser2.ml"
        ))) = _menhir_stack in
        let _v : 'tv_suitelettres_nonvide = 
# 37 "parser2.mly"
             (Lettre_nonvide(l))
# 1025 "parser2.ml"
         in
        _menhir_goto_suitelettres_nonvide _menhir_env _menhir_stack _menhir_s _v) : 'freshtv10)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * _menhir_state * (
# 6 "parser2.mly"
      (string)
# 1035 "parser2.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and input : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 8 "parser2.mly"
      (Ast.automate)
# 1055 "parser2.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INPUT_SY ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LETTRE _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1) : 'freshtv2)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv4)) : 'freshtv6))

# 269 "<standard.mly>"
  

# 1096 "parser2.ml"
