(* Lexer para Mips *)

{
  open Lexing
  open MipsAst
  open MipsParser

  exception Lexing_error of string

  let kwd_tbl = ["let",LET; "in",IN; "set",SET; "print",PRINT;"if",IF;"then",THEN;"else", ELSE; "true",TRUE; "false", FALSE;"done", DONE]

  let id_or_kwd s = try List.assoc s kwd_tbl with _ -> IDENT s

  let newline lexbuf =
    let pos = lexbuf.lex_curr_p in
    lexbuf.lex_curr_p <-
      { pos with pos_lnum = pos.pos_lnum + 1; pos_bol = pos.pos_cnum }

}

let letter = ['a'-'z' 'A'-'Z']
let digit = ['0'-'9']
let ident = letter (letter | digit | '_')*
let integer = ['0'-'9']+
let float = digit* '.' digit+
let boolean = ("true" | "false")
let space = [' ' '\t']

rule token = parse
  | "//" [^ '\n']* '\n'
  | ('\n' | "\r\n" )   { newline lexbuf; token lexbuf }
  | "#" [^'\n']* '\n' { newline lexbuf; token lexbuf }
  | space+  { token lexbuf }
  | ident as id { id_or_kwd id }
  | '+'     { PLUS }
  | '-'     { MINUS }
  | '*'     { TIMES }
  | '/'     { DIV }
  | '='     { EQ }
  | '>'     {BIGGER} 
  | '<'     {SMALLER}
  | "=="    {EQUALS}
  | "!="    {DIFFERS}
  | ">="    {EQBIG}
  | "<="    {EQSMALL}
  | '('     { LP }
  | ')'     { RP }
  | ';'     {SMC}
  | "(*"    { comment lexbuf }
  | integer as s { INT (int_of_string s) }
  | float as s { FLOAT (float_of_string s) }
  | "true" {TRUE}
  | "false" {FALSE}
  | "//" [^ '\n']* eof
  | eof     {EOF}
  | _ as c {raise (Lexing_error ("illegal character: " ^ String.make 1 c))}

and comment = parse
  | "*)"    { token lexbuf }
  | _       { comment lexbuf }
  | eof     { raise (Lexing_error ("unterminated comment")) }

