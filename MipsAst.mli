type binop = Add | Sub | Mul | Div |Smaller |Bigger |EqSmaller |EqBigger |Equals |Differs

type cst=
  | I of int
  | F of float
  | B of bool


type expr =
  | Cst of cst
  | Var of string
  | Binop of binop * expr * expr
  | Unop of binop * expr



type stmt =
  | Set of string * expr
  | Print of expr
  | If of expr * stmt list
  | IfElse of expr * stmt list * stmt list 

type program = stmt list