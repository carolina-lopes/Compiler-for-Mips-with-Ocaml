%{
  open MipsAst
%}

%token <int> INT 
%token <float> FLOAT
%token <string> IDENT
%token SET LET IN PRINT IF THEN ELSE DONE
%token TRUE FALSE 
%token EOF
%token LP RP
%token PLUS MINUS TIMES DIV 
%token BIGGER SMALLER EQSMALL EQBIG EQUALS DIFFERS
%token EQ
%token SMC

%nonassoc IN
%left BIGGER SMALLER EQSMALL EQBIG EQUALS DIFFERS
%left PLUS MINUS
%left TIMES DIV
%nonassoc uminus

%start prog

%type <MipsAst.program> prog

%%

prog:
 p = stmts EOF { List.rev p }
;

stmts:
 i = stmt                  { [i] }
| l = stmts SMC i = stmt    { i :: l }
;

expr:
 c= cst                         { Cst c }
| id = IDENT                     { Var id }
| e1 = expr o = op e2 = expr     { Binop (o, e1, e2) }
| MINUS e = expr %prec uminus    { Unop (Sub, e) }
| LP e = expr RP                 { e }
;

cst:
 i=INT     {I i}
| f=FLOAT   {F f}
| TRUE {B true}
| FALSE {B false}
;

stmt:
 SET id = IDENT EQ e = expr                                  { Set (id, e) }
| PRINT e = expr                                             { Print e }
| IF e = expr THEN s = stmts DONE                            { If (e,s)}
| IF e= expr THEN s=stmts ELSE s2=stmts DONE                 { IfElse (e,s,s2)}
;

%inline op:
 PLUS     { Add }
| MINUS   { Sub }
| TIMES   { Mul }
| DIV     { Div }
| BIGGER  { Bigger }
| SMALLER { Smaller }
| EQSMALL { EqSmaller}
| EQBIG   { EqBigger}
| EQUALS  {Equals}
| DIFFERS {Differs}
;





