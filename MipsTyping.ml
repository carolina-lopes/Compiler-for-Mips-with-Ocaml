open MipsAst
open Format
open List

let ctx'=Hashtbl.create 12

type t = Int | Bool | Float

exception Type_exception of string;;

let rec type_expr = function
    Cst (I _) -> Int
    | Cst (F _) -> Float
    | Cst (B _) -> Bool
    | Var (id) ->type_expr(Hashtbl.find ctx' id) 
    | Binop (op, e1, e2) ->
        let t_e1 = type_expr e1 in
        let t_e2 = type_expr e2 in
        begin match t_e1, op, t_e2 with
            Int, Add, Int -> Int
            |Int, Add, _ -> raise(Type_exception ("Wrong type, expected type: Int"))
            |_,Add, Int ->raise (Type_exception ("Wrong type, expected type: Int"))
            |Float, Add, Float -> Float
            |Float, Add, _ -> raise (Type_exception ("Wrong type, expected type:Float"))
            |_, Add, Float ->raise (Type_exception ("Wrong type, expected type:Int"))
            |_,Add,_->raise (Type_exception ("Not valid type"))
            |Int, Sub, Int -> Int
            |Int, Sub, _ ->  raise (Type_exception ("Wrong type, expected type:Int"))
            |_,Sub, Int ->raise (Type_exception ("Wrong type, expected type: Int"))
            |Float, Sub, Float -> Float
            |Float, Sub, _  -> raise (Type_exception ("Wrong type, expected type:Float"))
            |_, Sub, Float ->raise (Type_exception ("Wrong type, expected type:Int"))
            |_,Sub,_->raise (Type_exception ("Not valid type"))
            |Int, Mul, Int -> Int
            |Int, Mul, _ ->  raise (Type_exception ("Wrong type, expected type:Int"))
            |_,Mul, Int ->raise (Type_exception ("Wrong type, expected type:Int"))
            |Float, Mul, Float -> Float
            |Float, Mul, _  -> raise (Type_exception ("Wrong type, expected type:Float"))
            |_, Mul, Float ->raise (Type_exception ("Wrong type, expected type:Int"))
            |_,Mul,_->raise (Type_exception ("Not valid type"))
            |Int, Div, Int -> Int
            |Int, Div, _ ->  raise (Type_exception ("Wrong type, expected type:Int"))
            |_,Div, Int ->raise (Type_exception ("Wrong type, expected type:Int"))
            |Float, Div, Float -> Float
            |Float, Div, _  -> raise (Type_exception ("Wrong type, expected type:Float"))
            |_, Div, Float ->raise (Type_exception ("Wrong type, expected type:Float"))
            |_,Div,_->raise (Type_exception ("Not valid type"))
            |Int, Smaller, Int -> Bool
            |Int, Smaller, _ ->  raise (Type_exception ("Wrong type, expected type:Int"))
            |_,Smaller, Int ->raise (Type_exception ("Wrong type, expected type:Int"))
            |Float, Smaller, Float -> Bool
            |Float, Smaller, _  -> raise (Type_exception ("Wrong type, expected type:Float"))
            |_, Smaller, Float ->raise (Type_exception ("Wrong type, expected type:Float"))
            |_,Smaller,_->raise (Type_exception ("Not valid type"))
            |Int, Bigger, Int -> Bool
            |Int, Bigger, _ ->  raise (Type_exception ("Wrong type, expected type:Int"))
            |_,Bigger, Int ->raise (Type_exception ("Wrong type, expected type:Int"))
            |Float, Bigger, Float -> Bool
            |Float, Bigger, _  -> raise (Type_exception ("Wrong type, expected type:Float"))
            |_, Bigger, Float ->raise (Type_exception ("Wrong type, expected type:Int"))
            |_,Bigger,_->raise (Type_exception ("Not valid type"))
            |Int, EqSmaller, Int -> Bool
            |Int, EqSmaller, _ ->  raise (Type_exception ("Wrong type, expected type: Int"))
            |_,EqSmaller, Int ->raise (Type_exception ("Wrong type, expected type: Int"))
            |Float, EqSmaller, Float -> Bool
            |Float, EqSmaller, _  -> raise (Type_exception ("Wrong type, expected type:Float"))
            |_, EqSmaller, Float ->raise (Type_exception ("Wrong type, expected type:Float"))
            |_,EqSmaller,_->raise (Type_exception ("Not valid type"))
            |Int, EqBigger, Int -> Bool
            |Int, EqBigger, _ ->  raise (Type_exception ("Wrong type, expected type:Int"))
            |_,EqBigger,Int ->raise (Type_exception ("Wrong type, expected type:Int"))
            |Float, EqBigger, Float -> Bool
            |Float, EqBigger, _  -> raise (Type_exception ("Wrong type, expected type:Float"))
            |_, EqBigger, Float ->raise (Type_exception ("Wrong type, expected type:Int"))
            |_,EqBigger,_->raise (Type_exception ("Not valid type"))
            |Int, Equals, Int -> Bool
            |Int, Equals, _ ->  raise (Type_exception ("Wrong type, expected type:Int"))
            |_,Equals, Int ->raise (Type_exception ("Wrong type, expected type:Int"))
            |Float, Equals, Float -> Bool
            |Float, Equals, _  -> raise (Type_exception ("Wrong type, expected type:Float"))
            |_, Equals, Float ->raise (Type_exception ("Wrong type, expected type:Int"))
            |Bool,Equals,Bool ->Bool
            |Int, Differs, Int -> Bool
            |Int, Differs, _ ->  raise (Type_exception ("Wrong type, expected type:Int"))
            |_,Differs, Int ->raise (Type_exception ("Wrong type, expected type:Int"))
            |Float, Differs, Float -> Bool
            |Float, Differs, _  -> raise (Type_exception("Wrong type, expected type:Float"))
            |_, Differs, Float ->raise (Type_exception ("Wrong type, expected type:Int")) 
            |Bool,Differs,Bool->Bool
        end
    | Unop(op, e1) ->
        let t_e1 = type_expr e1 in
        begin match op,t_e1 with
            Sub, Int -> Int
            |Sub, Float -> Float
            |Sub, _ ->raise (Type_exception ("Wrong operation, expected operation:Sub"))
            |Add,_->raise (Type_exception ("Wrong operation, expected operation:Sub"))
            |Div,_->raise (Type_exception ("Wrong operation, expected operation:Sub"))
            |Mul,_->raise (Type_exception ("Wrong operation, expected operation:Sub"))
            |Smaller,_->raise (Type_exception ("Wrong operation, expected operation:Sub"))
            |Bigger,_->raise (Type_exception ("Wrong operation, expected operation:Sub"))
            |EqSmaller,_->raise (Type_exception ("Wrong operation, expected operation:Sub"))
            |EqBigger,_->raise (Type_exception ("Wrong operation, expected operation:Sub"))
            |Equals,_->raise (Type_exception ("Wrong operation, expected operation:Sub"))
            |Differs,_->raise (Type_exception ("Wrong operation, expected operation:Sub"))
    end

let rec type_stmt= function
    Set(id,e1) ->
        let t_e1=type_expr e1 in
        begin match id, t_e1 with
            string, Int->Hashtbl.add ctx' id e1
            |string, Float -> Hashtbl.add ctx' id e1
            |string, Bool-> Hashtbl.add ctx' id e1
        end
    |Print(e1) ->
        let t_e1=type_expr e1 in
        begin match t_e1 with
            Int-> ()
            |Float->()
            |Bool->()
        end
    |If(e1,stmt) ->
        let t_e1=type_expr e1 in
        let tstmt = type_prog stmt in
        begin match t_e1,tstmt with
            Bool, () -> ()
            |_->raise(Type_exception ("Wrong type") )
        end

   |IfElse(e1,stmt1,stmt2)->
        let t_e1=type_expr e1 in
        let t_s1=type_prog stmt1 in
        let t_s2=type_prog stmt1 in
        begin match t_e1, t_s1, t_s2 with
            Bool,(),()->()
            |_->raise(Type_exception ("Wrong type") )
          
        end
 and type_prog stmt =
        match stmt with
        |[] -> ()
        |hd::tl-> type_stmt(hd); type_prog tl