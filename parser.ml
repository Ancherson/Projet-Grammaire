
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VIRGU
    | TRANS
    | STATES
    | STACK_SY
    | RPAREN
    | POINTVIR
    | LPAREN
    | LETTRE of (
# 6 "parser.mly"
      (string)
# 22 "parser.ml"
  )
    | INPUT_SY
    | INIT_STATE
    | INIT_STACK
    | EOF
  
end

include MenhirBasics

# 1 "parser.mly"
  
open Ast

# 37 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState01 : ('s, _menhir_box_input) _menhir_state
    (** State 01.
        Stack shape : .
        Start symbol: input. *)

  | MenhirState03 : (('s, _menhir_box_input) _menhir_cell1_LETTRE, _menhir_box_input) _menhir_state
    (** State 03.
        Stack shape : LETTRE.
        Start symbol: input. *)

  | MenhirState07 : ('s _menhir_cell0_inputsymbols, _menhir_box_input) _menhir_state
    (** State 07.
        Stack shape : inputsymbols.
        Start symbol: input. *)

  | MenhirState10 : ('s _menhir_cell0_inputsymbols _menhir_cell0_stacksymbols, _menhir_box_input) _menhir_state
    (** State 10.
        Stack shape : inputsymbols stacksymbols.
        Start symbol: input. *)

  | MenhirState21 : ('s _menhir_cell0_declaration, _menhir_box_input) _menhir_state
    (** State 21.
        Stack shape : declaration.
        Start symbol: input. *)

  | MenhirState31 : (('s, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_LETTRE _menhir_cell0_lettre_ou_vide _menhir_cell0_LETTRE _menhir_cell0_LETTRE, _menhir_box_input) _menhir_state
    (** State 31.
        Stack shape : LPAREN LETTRE lettre_ou_vide LETTRE LETTRE.
        Start symbol: input. *)

  | MenhirState33 : (('s, _menhir_box_input) _menhir_cell1_LETTRE, _menhir_box_input) _menhir_state
    (** State 33.
        Stack shape : LETTRE.
        Start symbol: input. *)

  | MenhirState39 : (('s, _menhir_box_input) _menhir_cell1_transition, _menhir_box_input) _menhir_state
    (** State 39.
        Stack shape : transition.
        Start symbol: input. *)


and 's _menhir_cell0_declaration = 
  | MenhirCell0_declaration of 's * (Ast.declaration)

and 's _menhir_cell0_initialstate = 
  | MenhirCell0_initialstate of 's * (Ast.initialstate)

and 's _menhir_cell0_inputsymbols = 
  | MenhirCell0_inputsymbols of 's * (Ast.inputsymbols)

and 's _menhir_cell0_lettre_ou_vide = 
  | MenhirCell0_lettre_ou_vide of 's * (Ast.lettre_ou_vide)

and 's _menhir_cell0_stacksymbols = 
  | MenhirCell0_stacksymbols of 's * (Ast.stacksymbols)

and 's _menhir_cell0_states = 
  | MenhirCell0_states of 's * (Ast.states)

and ('s, 'r) _menhir_cell1_transition = 
  | MenhirCell1_transition of 's * ('s, 'r) _menhir_state * (Ast.transition)

and ('s, 'r) _menhir_cell1_LETTRE = 
  | MenhirCell1_LETTRE of 's * ('s, 'r) _menhir_state * (
# 6 "parser.mly"
      (string)
# 106 "parser.ml"
)

and 's _menhir_cell0_LETTRE = 
  | MenhirCell0_LETTRE of 's * (
# 6 "parser.mly"
      (string)
# 113 "parser.ml"
)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and _menhir_box_input = 
  | MenhirBox_input of (Ast.automate) [@@unboxed]

let _menhir_action_01 =
  fun d t ->
    (
# 16 "parser.mly"
                             (Automate(d,t))
# 127 "parser.ml"
     : (Ast.automate))

let _menhir_action_02 =
  fun i isti istk s st ->
    (
# 19 "parser.mly"
                                                                              (Declaration(i,s,st,isti,istk))
# 135 "parser.ml"
     : (Ast.declaration))

let _menhir_action_03 =
  fun l ->
    (
# 34 "parser.mly"
                      (Initialstack(l))
# 143 "parser.ml"
     : (Ast.initialstack))

let _menhir_action_04 =
  fun l ->
    (
# 31 "parser.mly"
                       (Initialstate(l))
# 151 "parser.ml"
     : (Ast.initialstate))

let _menhir_action_05 =
  fun c ->
    (
# 13 "parser.mly"
                        (c)
# 159 "parser.ml"
     : (Ast.automate))

let _menhir_action_06 =
  fun s ->
    (
# 22 "parser.mly"
                                    (Inputsymbols(s))
# 167 "parser.ml"
     : (Ast.inputsymbols))

let _menhir_action_07 =
  fun () ->
    (
# 51 "parser.mly"
     (None)
# 175 "parser.ml"
     : (Ast.lettre_ou_vide))

let _menhir_action_08 =
  fun l ->
    (
# 52 "parser.mly"
             (Lettre_ou_vide(l))
# 183 "parser.ml"
     : (Ast.lettre_ou_vide))

let _menhir_action_09 =
  fun l ->
    (
# 59 "parser.mly"
             (Monostack(l) )
# 191 "parser.ml"
     : (Ast.nonemptystack))

let _menhir_action_10 =
  fun l ns ->
    (
# 60 "parser.mly"
                                       (Nonemptystack (l,ns))
# 199 "parser.ml"
     : (Ast.nonemptystack))

let _menhir_action_11 =
  fun () ->
    (
# 55 "parser.mly"
     (None)
# 207 "parser.ml"
     : (Ast.stack))

let _menhir_action_12 =
  fun s ->
    (
# 56 "parser.mly"
                    (Stack(s))
# 215 "parser.ml"
     : (Ast.stack))

let _menhir_action_13 =
  fun s ->
    (
# 25 "parser.mly"
                                    (Stacksymbols(s))
# 223 "parser.ml"
     : (Ast.stacksymbols))

let _menhir_action_14 =
  fun s ->
    (
# 28 "parser.mly"
                                  (States(s))
# 231 "parser.ml"
     : (Ast.states))

let _menhir_action_15 =
  fun l ->
    (
# 37 "parser.mly"
             (Lettre_nonvide(l))
# 239 "parser.ml"
     : (Ast.suitelettres_nonvide))

let _menhir_action_16 =
  fun l s ->
    (
# 38 "parser.mly"
                                          (Suitelettres_nonvide(l,s))
# 247 "parser.ml"
     : (Ast.suitelettres_nonvide))

let _menhir_action_17 =
  fun l1 l2 l3 lv s ->
    (
# 48 "parser.mly"
                                                                                                (Transition(l1,lv,l2,l3,s))
# 255 "parser.ml"
     : (Ast.transition))

let _menhir_action_18 =
  fun l ->
    (
# 41 "parser.mly"
                     (Transitions(l))
# 263 "parser.ml"
     : (Ast.transitions))

let _menhir_action_19 =
  fun () ->
    (
# 44 "parser.mly"
     (None)
# 271 "parser.ml"
     : (Ast.translist))

let _menhir_action_20 =
  fun t tl ->
    (
# 45 "parser.mly"
                              (Translist(t,tl))
# 279 "parser.ml"
     : (Ast.translist))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | EOF ->
        "EOF"
    | INIT_STACK ->
        "INIT_STACK"
    | INIT_STATE ->
        "INIT_STATE"
    | INPUT_SY ->
        "INPUT_SY"
    | LETTRE _ ->
        "LETTRE"
    | LPAREN ->
        "LPAREN"
    | POINTVIR ->
        "POINTVIR"
    | RPAREN ->
        "RPAREN"
    | STACK_SY ->
        "STACK_SY"
    | STATES ->
        "STATES"
    | TRANS ->
        "TRANS"
    | VIRGU ->
        "VIRGU"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_38 : type  ttv_stack. ttv_stack _menhir_cell0_declaration -> _ -> _menhir_box_input =
    fun _menhir_stack _v ->
      let l = _v in
      let _v = _menhir_action_18 l in
      let MenhirCell0_declaration (_menhir_stack, d) = _menhir_stack in
      let t = _v in
      let _v = _menhir_action_01 d t in
      let c = _v in
      let _v = _menhir_action_05 c in
      MenhirBox_input _v
  
  let rec _menhir_run_40 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_transition -> _ -> _menhir_box_input =
    fun _menhir_stack _v ->
      let MenhirCell1_transition (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let tl = _v in
      let _v = _menhir_action_20 t tl in
      _menhir_goto_translist _menhir_stack _v _menhir_s
  
  and _menhir_goto_translist : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState39 ->
          _menhir_run_40 _menhir_stack _v
      | MenhirState21 ->
          _menhir_run_38 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_22 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LETTRE _v ->
          let _menhir_stack = MenhirCell0_LETTRE (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VIRGU ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LETTRE _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let l = _v_0 in
                  let _v = _menhir_action_08 l in
                  _menhir_goto_lettre_ou_vide _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | VIRGU ->
                  let _v = _menhir_action_07 () in
                  _menhir_goto_lettre_ou_vide _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_lettre_ou_vide : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_LETTRE -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_lettre_ou_vide (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | VIRGU ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LETTRE _v ->
              let _menhir_stack = MenhirCell0_LETTRE (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | VIRGU ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LETTRE _v ->
                      let _menhir_stack = MenhirCell0_LETTRE (_menhir_stack, _v) in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | VIRGU ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | LETTRE _v ->
                              _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31
                          | RPAREN ->
                              let _v = _menhir_action_11 () in
                              _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | POINTVIR ->
          let _menhir_stack = MenhirCell1_LETTRE (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LETTRE _v ->
              _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState33
          | _ ->
              _eRR ())
      | RPAREN ->
          let l = _v in
          let _v = _menhir_action_09 l in
          _menhir_goto_nonemptystack _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonemptystack : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState31 ->
          _menhir_run_37_spec_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState33 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_37_spec_31 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_LETTRE _menhir_cell0_lettre_ou_vide _menhir_cell0_LETTRE _menhir_cell0_LETTRE -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let s = _v in
      let _v = _menhir_action_12 s in
      _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_35 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_LETTRE _menhir_cell0_lettre_ou_vide _menhir_cell0_LETTRE _menhir_cell0_LETTRE -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_LETTRE (_menhir_stack, l3) = _menhir_stack in
      let MenhirCell0_LETTRE (_menhir_stack, l2) = _menhir_stack in
      let MenhirCell0_lettre_ou_vide (_menhir_stack, lv) = _menhir_stack in
      let MenhirCell0_LETTRE (_menhir_stack, l1) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let s = _v in
      let _v = _menhir_action_17 l1 l2 l3 lv s in
      let _menhir_stack = MenhirCell1_transition (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
      | EOF ->
          let _v = _menhir_action_19 () in
          _menhir_run_40 _menhir_stack _v
      | _ ->
          _eRR ()
  
  and _menhir_run_34 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_LETTRE -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_LETTRE (_menhir_stack, _menhir_s, l) = _menhir_stack in
      let ns = _v in
      let _v = _menhir_action_10 l ns in
      _menhir_goto_nonemptystack _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  let rec _menhir_run_11 : type  ttv_stack. ttv_stack _menhir_cell0_inputsymbols _menhir_cell0_stacksymbols -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let s = _v in
      let _v = _menhir_action_14 s in
      let _menhir_stack = MenhirCell0_states (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | INIT_STATE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LETTRE _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let l = _v_0 in
              let _v = _menhir_action_04 l in
              let _menhir_stack = MenhirCell0_initialstate (_menhir_stack, _v) in
              (match (_tok : MenhirBasics.token) with
              | INIT_STACK ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LETTRE _v_0 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let l = _v_0 in
                      let _v = _menhir_action_03 l in
                      let MenhirCell0_initialstate (_menhir_stack, isti) = _menhir_stack in
                      let MenhirCell0_states (_menhir_stack, st) = _menhir_stack in
                      let MenhirCell0_stacksymbols (_menhir_stack, s) = _menhir_stack in
                      let MenhirCell0_inputsymbols (_menhir_stack, i) = _menhir_stack in
                      let istk = _v in
                      let _v = _menhir_action_02 i isti istk s st in
                      let _menhir_stack = MenhirCell0_declaration (_menhir_stack, _v) in
                      (match (_tok : MenhirBasics.token) with
                      | TRANS ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | LPAREN ->
                              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
                          | EOF ->
                              let _v = _menhir_action_19 () in
                              _menhir_run_38 _menhir_stack _v
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VIRGU ->
          let _menhir_stack = MenhirCell1_LETTRE (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LETTRE _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03
          | _ ->
              _eRR ())
      | INIT_STATE | STACK_SY | STATES ->
          let l = _v in
          let _v = _menhir_action_15 l in
          _menhir_goto_suitelettres_nonvide _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_suitelettres_nonvide : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState10 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState01 ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState03 ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack _menhir_cell0_inputsymbols -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let s = _v in
      let _v = _menhir_action_13 s in
      let _menhir_stack = MenhirCell0_stacksymbols (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | STATES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LETTRE _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState10
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let s = _v in
      let _v = _menhir_action_06 s in
      let _menhir_stack = MenhirCell0_inputsymbols (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | STACK_SY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LETTRE _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_LETTRE -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_LETTRE (_menhir_stack, _menhir_s, l) = _menhir_stack in
      let s = _v in
      let _v = _menhir_action_16 l s in
      _menhir_goto_suitelettres_nonvide _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INPUT_SY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LETTRE _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let input =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_input v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
