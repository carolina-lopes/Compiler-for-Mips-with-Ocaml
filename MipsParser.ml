
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | TRUE
    | TIMES
    | THEN
    | SMC
    | SMALLER
    | SET
    | RP
    | PRINT
    | PLUS
    | MINUS
    | LP
    | LET
    | INT of (
# 5 "MipsParser.mly"
       (int)
# 23 "MipsParser.ml"
  )
    | IN
    | IF
    | IDENT of (
# 7 "MipsParser.mly"
       (string)
# 30 "MipsParser.ml"
  )
    | FLOAT of (
# 6 "MipsParser.mly"
       (float)
# 35 "MipsParser.ml"
  )
    | FALSE
    | EQUALS
    | EQSMALL
    | EQBIG
    | EQ
    | EOF
    | ELSE
    | DONE
    | DIV
    | DIFFERS
    | BIGGER
  
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
  | MenhirState44
  | MenhirState42
  | MenhirState40
  | MenhirState38
  | MenhirState36
  | MenhirState32
  | MenhirState30
  | MenhirState28
  | MenhirState26
  | MenhirState24
  | MenhirState21
  | MenhirState19
  | MenhirState17
  | MenhirState15
  | MenhirState12
  | MenhirState6
  | MenhirState5
  | MenhirState3
  | MenhirState0

# 1 "MipsParser.mly"
  
  open MipsAst

# 88 "MipsParser.ml"

let rec _menhir_run42 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_stmts -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IF ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | PRINT ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | SET ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_goto_stmts : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmts -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv165 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DONE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv159 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv157 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (e : 'tv_expr)), _, (s : 'tv_stmts)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_stmt = 
# 56 "MipsParser.mly"
                                                             ( If (e,s))
# 129 "MipsParser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv158)) : 'freshtv160)
        | ELSE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv161 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IF ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | PRINT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | SET ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv162)
        | SMC ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv163 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)) : 'freshtv166)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv173 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DONE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv169 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv167 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (e : 'tv_expr)), _, (s : 'tv_stmts)), _, (s2 : 'tv_stmts)) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_stmt = 
# 57 "MipsParser.mly"
                                                             ( IfElse (e,s,s2))
# 177 "MipsParser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv168)) : 'freshtv170)
        | SMC ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv171 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)) : 'freshtv174)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv187 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv183 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv181 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (p : 'tv_stmts)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 25 "MipsParser.mly"
      (MipsAst.program)
# 205 "MipsParser.ml"
            ) = 
# 30 "MipsParser.mly"
               ( List.rev p )
# 209 "MipsParser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv179) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 25 "MipsParser.mly"
      (MipsAst.program)
# 217 "MipsParser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv177) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 25 "MipsParser.mly"
      (MipsAst.program)
# 225 "MipsParser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv175) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 25 "MipsParser.mly"
      (MipsAst.program)
# 233 "MipsParser.ml"
            )) : (
# 25 "MipsParser.mly"
      (MipsAst.program)
# 237 "MipsParser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv176)) : 'freshtv178)) : 'freshtv180)) : 'freshtv182)) : 'freshtv184)
        | SMC ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv185 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)) : 'freshtv188)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmt -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv151 * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_stmt) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv149 * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((i : 'tv_stmt) : 'tv_stmt) = _v in
        ((let (_menhir_stack, _menhir_s, (l : 'tv_stmts)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_stmts = 
# 35 "MipsParser.mly"
                            ( i :: l )
# 274 "MipsParser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv150)) : 'freshtv152)
    | MenhirState0 | MenhirState40 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv155) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_stmt) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((i : 'tv_stmt) : 'tv_stmt) = _v in
        ((let _v : 'tv_stmts = 
# 34 "MipsParser.mly"
                           ( [i] )
# 289 "MipsParser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv154)) : 'freshtv156)
    | _ ->
        _menhir_fail ()

and _menhir_run12 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12

and _menhir_run15 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run17 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run21 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_run24 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24

and _menhir_run26 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26

and _menhir_run28 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28

and _menhir_run19 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_run30 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30

and _menhir_run32 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BIGGER ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | DIFFERS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | EQBIG ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | EQSMALL ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | RP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv65 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv63 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 43 "MipsParser.mly"
                                 ( e )
# 573 "MipsParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv64)) : 'freshtv66)
        | SMALLER ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv67 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)) : 'freshtv70)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv73 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv71 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
        let _10 = () in
        let _v : 'tv_expr = let o =
          let _1 = _10 in
          
# 63 "MipsParser.mly"
          ( Mul )
# 599 "MipsParser.ml"
          
        in
        
# 41 "MipsParser.mly"
                                 ( Binop (o, e1, e2) )
# 605 "MipsParser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv72)) : 'freshtv74)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv79 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | BIGGER | DIFFERS | DONE | ELSE | EOF | EQBIG | EQSMALL | EQUALS | RP | SMALLER | SMC | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv75 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 66 "MipsParser.mly"
          ( Smaller )
# 632 "MipsParser.ml"
              
            in
            
# 41 "MipsParser.mly"
                                 ( Binop (o, e1, e2) )
# 638 "MipsParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv76)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv77 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)) : 'freshtv80)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv85 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | BIGGER | DIFFERS | DONE | ELSE | EOF | EQBIG | EQSMALL | EQUALS | MINUS | PLUS | RP | SMALLER | SMC | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv81 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 61 "MipsParser.mly"
          ( Add )
# 668 "MipsParser.ml"
              
            in
            
# 41 "MipsParser.mly"
                                 ( Binop (o, e1, e2) )
# 674 "MipsParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv82)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv83 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)) : 'freshtv86)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv89 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv87 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
        let _10 = () in
        let _v : 'tv_expr = let o =
          let _1 = _10 in
          
# 64 "MipsParser.mly"
          ( Div )
# 696 "MipsParser.ml"
          
        in
        
# 41 "MipsParser.mly"
                                 ( Binop (o, e1, e2) )
# 702 "MipsParser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv88)) : 'freshtv90)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv95 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | BIGGER | DIFFERS | DONE | ELSE | EOF | EQBIG | EQSMALL | EQUALS | MINUS | PLUS | RP | SMALLER | SMC | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv91 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 62 "MipsParser.mly"
          ( Sub )
# 725 "MipsParser.ml"
              
            in
            
# 41 "MipsParser.mly"
                                 ( Binop (o, e1, e2) )
# 731 "MipsParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv92)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv93 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)) : 'freshtv96)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv101 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | BIGGER | DIFFERS | DONE | ELSE | EOF | EQBIG | EQSMALL | EQUALS | RP | SMALLER | SMC | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv97 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 69 "MipsParser.mly"
          (Equals)
# 765 "MipsParser.ml"
              
            in
            
# 41 "MipsParser.mly"
                                 ( Binop (o, e1, e2) )
# 771 "MipsParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv98)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv99 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)) : 'freshtv102)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv107 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | BIGGER | DIFFERS | DONE | ELSE | EOF | EQBIG | EQSMALL | EQUALS | RP | SMALLER | SMC | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv103 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 67 "MipsParser.mly"
          ( EqSmaller)
# 805 "MipsParser.ml"
              
            in
            
# 41 "MipsParser.mly"
                                 ( Binop (o, e1, e2) )
# 811 "MipsParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv104)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv105 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)) : 'freshtv108)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv113 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | BIGGER | DIFFERS | DONE | ELSE | EOF | EQBIG | EQSMALL | EQUALS | RP | SMALLER | SMC | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv109 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 68 "MipsParser.mly"
          ( EqBigger)
# 845 "MipsParser.ml"
              
            in
            
# 41 "MipsParser.mly"
                                 ( Binop (o, e1, e2) )
# 851 "MipsParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv110)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv111 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)) : 'freshtv114)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv119 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | BIGGER | DIFFERS | DONE | ELSE | EOF | EQBIG | EQSMALL | EQUALS | RP | SMALLER | SMC | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv115 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 70 "MipsParser.mly"
          (Differs)
# 885 "MipsParser.ml"
              
            in
            
# 41 "MipsParser.mly"
                                 ( Binop (o, e1, e2) )
# 891 "MipsParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv116)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv117 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)) : 'freshtv120)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv125 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | BIGGER | DIFFERS | DONE | ELSE | EOF | EQBIG | EQSMALL | EQUALS | RP | SMALLER | SMC | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv121 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 65 "MipsParser.mly"
          ( Bigger )
# 925 "MipsParser.ml"
              
            in
            
# 41 "MipsParser.mly"
                                 ( Binop (o, e1, e2) )
# 931 "MipsParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv122)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv123 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)) : 'freshtv126)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv127 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_expr = 
# 42 "MipsParser.mly"
                                 ( Unop (Sub, e) )
# 951 "MipsParser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv128)) : 'freshtv130)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv135 * _menhir_state) * (
# 7 "MipsParser.mly"
       (string)
# 959 "MipsParser.ml"
        ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BIGGER ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | DIFFERS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | EQBIG ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | EQSMALL ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | SMALLER ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | DONE | ELSE | EOF | SMC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv131 * _menhir_state) * (
# 7 "MipsParser.mly"
       (string)
# 989 "MipsParser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (id : (
# 7 "MipsParser.mly"
       (string)
# 994 "MipsParser.ml"
            ))), _, (e : 'tv_expr)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_stmt = 
# 54 "MipsParser.mly"
                                                             ( Set (id, e) )
# 1001 "MipsParser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv132)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv133 * _menhir_state) * (
# 7 "MipsParser.mly"
       (string)
# 1011 "MipsParser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)) : 'freshtv136)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv141 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BIGGER ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | DIFFERS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | EQBIG ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | EQSMALL ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | SMALLER ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | DONE | ELSE | EOF | SMC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv137 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_stmt = 
# 55 "MipsParser.mly"
                                                             ( Print e )
# 1049 "MipsParser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv138)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv139 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)) : 'freshtv142)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv147 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BIGGER ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | DIFFERS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | EQBIG ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | EQSMALL ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | SMALLER ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv143 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IF ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | PRINT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | SET ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40) : 'freshtv144)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv145 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)) : 'freshtv148)
    | _ ->
        _menhir_fail ()

and _menhir_goto_cst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_cst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv61) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_cst) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv59) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((c : 'tv_cst) : 'tv_cst) = _v in
    ((let _v : 'tv_expr = 
# 39 "MipsParser.mly"
                                ( Cst c )
# 1124 "MipsParser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv60)) : 'freshtv62)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv57) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_cst = 
# 49 "MipsParser.mly"
       (B true)
# 1138 "MipsParser.ml"
     in
    _menhir_goto_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv58)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 5 "MipsParser.mly"
       (int)
# 1195 "MipsParser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv55) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 5 "MipsParser.mly"
       (int)
# 1205 "MipsParser.ml"
    )) : (
# 5 "MipsParser.mly"
       (int)
# 1209 "MipsParser.ml"
    )) = _v in
    ((let _v : 'tv_cst = 
# 47 "MipsParser.mly"
           (I i)
# 1214 "MipsParser.ml"
     in
    _menhir_goto_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv56)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 7 "MipsParser.mly"
       (string)
# 1221 "MipsParser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv53) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((id : (
# 7 "MipsParser.mly"
       (string)
# 1231 "MipsParser.ml"
    )) : (
# 7 "MipsParser.mly"
       (string)
# 1235 "MipsParser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 40 "MipsParser.mly"
                                 ( Var id )
# 1240 "MipsParser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv54)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 6 "MipsParser.mly"
       (float)
# 1247 "MipsParser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv51) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((f : (
# 6 "MipsParser.mly"
       (float)
# 1257 "MipsParser.ml"
    )) : (
# 6 "MipsParser.mly"
       (float)
# 1261 "MipsParser.ml"
    )) = _v in
    ((let _v : 'tv_cst = 
# 48 "MipsParser.mly"
            (F f)
# 1266 "MipsParser.ml"
     in
    _menhir_goto_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv52)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv49) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_cst = 
# 50 "MipsParser.mly"
        (B false)
# 1280 "MipsParser.ml"
     in
    _menhir_goto_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv50)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv11 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv13 * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv14)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv15 * _menhir_state) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv21 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv23 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv25 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv27 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv29 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv31 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv33 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv35 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv37 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv39 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * _menhir_state) * (
# 7 "MipsParser.mly"
       (string)
# 1377 "MipsParser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv48)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 7 "MipsParser.mly"
       (string)
# 1398 "MipsParser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv3 * _menhir_state) * (
# 7 "MipsParser.mly"
       (string)
# 1409 "MipsParser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | FALSE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | FLOAT _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
            | IDENT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
            | INT _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
            | LP ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | MINUS ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | TRUE ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv4)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv5 * _menhir_state) * (
# 7 "MipsParser.mly"
       (string)
# 1439 "MipsParser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv6)) : 'freshtv8)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv10)

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | FLOAT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | IDENT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | LP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | MINUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38

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

and prog : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 25 "MipsParser.mly"
      (MipsAst.program)
# 1516 "MipsParser.ml"
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
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IF ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PRINT ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SET ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 219 "/usr/share/menhir/standard.mly"
  


# 1550 "MipsParser.ml"
