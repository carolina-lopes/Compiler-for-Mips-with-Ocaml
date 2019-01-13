
(* The type of tokens. *)

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
  | INT of (int)
  | IN
  | IF
  | IDENT of (string)
  | FLOAT of (float)
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

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (MipsAst.program)
