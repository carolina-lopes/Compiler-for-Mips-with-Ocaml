open Format
open Lexing
open MipsLexer
open MipsTyping

(* Opção de compilação, para parar na fase de parsing *)
let parse_only = ref false

(* Nome dos ficheiros fonte e alvo *)
let ifile = ref ""
let ofile = ref ""

let set_file f s = f := s

(* As opções do compilador que são mostradas quando é invocada o comando Mips --help *)
let options =
  ["-parse-only", Arg.Set parse_only,
   "  Executar somente o parsing";
   "-o", Arg.String (set_file ofile),
   "<file>  Para indicar o nome do ficheiro em saída"]

let usage = "usage: MIPS [option] file.in"

(* localiza um erro indicando a linha e a coluna *)
let localisation pos =
  let l = pos.pos_lnum in
  let c = pos.pos_cnum - pos.pos_bol + 1 in
  eprintf "File \"%s\", line %d, characters %d-%d:\n" !ifile l (c-1) c

let () =
  (* Parsing da linha de comando *)
  Arg.parse options (set_file ifile) usage;

  (* Verifica-se que o nome do ficheiro fonte foi bem introduzido *)
  if !ifile="" then begin eprintf "Nenhum ficheiro para compilar\n@?"; exit 1 end;

  (* Este ficheiro deve ter como extensão  .exp *)
  if not (Filename.check_suffix !ifile ".in") then begin
    eprintf "O ficheiro em entrada deve ter a extensão .in\n@?";
    Arg.usage options usage;
    exit 1
  end;

  (* Por omissão, o ficheiro alvo tem o mesmo nome que o ficheiro fonte,
     só muda a extensão *)
  if !ofile="" then ofile := Filename.chop_suffix !ifile ".in" ^ ".s";

  (* Abertura do ficheiro fonte em leitura *)
  let f = open_in !ifile in

  (* Criação do buffer de análise léxica *)
  let buf = Lexing.from_channel f in

  try
    (* Parsing: A função Parser.prog transforma o buffer d'análise léxica  
       numa árvore de sintaxe abstracta se nenujk erro  (léxico ou sintáctico) 
       foi detectado.
       A função Lexer.token é utilizada por Parser.prog para obter
       o próximo token. *)
    let p = MipsParser.prog MipsLexer.token buf in
    close_in f;

    (* Pára-se aqui se só queremos o parsing *)
    if !parse_only then exit 0;
    MipsTyping.type_prog p;
    MipsCompile.compile_program p "test.asm";
     with
      | MipsLexer.Lexing_error s ->
    localisation (Lexing.lexeme_start_p buf);
    eprintf "lexical error: %s@." s;
    exit 1
      | MipsTyping.Type_exception s  ->
    eprintf "error: %s@." s;
    exit 1