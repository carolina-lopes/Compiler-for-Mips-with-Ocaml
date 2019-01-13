open Format
open Mips
open MipsAst
open MipsTyping

let (genvar: (string, text) Hashtbl.t) = Hashtbl.create 17
let counter = ref 0
let iterator = ref 0
let frame_size = ref 0

exception VarUndef of string

module StrMap = Map.Make(String)

let compile_expr =
  let rec comprec env next= function
    Cst i ->
    begin
        match i with
            I j -> li t0 j 
            |F f ->li32 t0 (Int32.bits_of_float f)++ mtc1 t0 f0
            |B true-> li t0 1
            |B false -> li t0 0
    end
    |Var str -> Hashtbl.find genvar str
    |Binop (op,e1,e2)->
    let x= comprec env next e1 in
    let y= comprec env next e2 in
    begin
        match op with
            Add ->
            begin 
              match type_expr e1 with
                Int -> x ++ move t1 t0 ++ y ++ move t2 t0 ++ add t0 t1 oreg t2
                |Float -> x ++ movs f1 f0 ++ y ++ movs f2 f0 ++ adds f0 f1 oreg f2
                |_ ->nop
            end
            |Sub ->
            begin
              match type_expr e1 with
                Int -> x ++ move t1 t0 ++ y ++ move t2 t0 ++ sub t0 t1 oreg t2
                |Float -> x ++ movs f1 f0 ++ y ++ movs f2 f0 ++ subs f0 f1 oreg f2
                |_ -> nop
            end
            |Mul ->
            begin
              match type_expr e1 with
                Int -> x ++ move t3 t0 ++ y ++ move t4 t0 ++ mul t0 t3 oreg t4
                |Float -> x ++ movs f3 f0 ++ y ++ movs f4 f0 ++ muls f0 f3 oreg f4
                |_ ->nop
            end
            |Div ->
            begin
              match type_expr e1 with
                Int -> x ++ move t3 t0 ++ y ++ move t4 t0 ++ div t3 t4 ++ mflo t0
                |Float-> x ++ movs f3 f0 ++ y ++ movs f4 f0 ++ divs f0 f3 oreg f4
                |_ -> nop
            end
            |Smaller ->
            begin
              match type_expr e1 with
                Int -> x ++ move t5 t0 ++ y ++ move t6 t0 ++ slt t0 t5 oreg t6
                |Float-> x ++ movs f5 f0 ++ y ++ movs f6 f0 ++ clts f5 f6 ++ jal ("true") ++ bc1f ("false")
                |_ -> nop
            end
            |Bigger ->
            begin
              match type_expr e1 with
                Int -> x ++ move t5 t0 ++ y ++ move t6 t0 ++ sgt t0 t5 oreg t6
                |Float -> x ++ movs f5 f0 ++ y ++ movs f6 f0 ++ clts f6 f5 ++ jal ("true") ++ bc1f ("false")
                |_ -> nop
            end
            |EqSmaller ->
            begin
              match type_expr e1 with
              Int -> x ++ move t5 t0 ++ y ++ move t6 t0 ++ sle t0 t5 oreg t6
              |Float -> x ++ movs f5 f0 ++ y ++ movs f6 f0 ++ cles f5 f6 ++ jal ("true") ++ bc1f ("false")
              |_ ->nop
            end
            |EqBigger ->
            begin
              match type_expr e1 with
                Int -> x ++ move t5 t0 ++ y ++ move t6 t0 ++ sge t0 t5 oreg t6
                |Float ->  x ++ movs f5 f0 ++ y ++ movs f6 f0 ++ cles f6 f5 ++ jal ("true") ++ bc1f ("false")
                |_ -> nop
            end
            |Equals ->
            begin 
              match type_expr e1 with
              Int -> x ++ move t5 t0 ++ y ++ move t6 t0 ++ seq t0 t5 oreg t6
              |Float ->  x ++ movs f5 f0 ++ y ++ movs f6 f0 ++ ceqs f5 f6 ++ jal ("true") ++ bc1f ("false")
              |_ -> nop
            end
            |Differs ->
            begin
              match type_expr e1 with
                Int -> x ++ move t5 t0 ++ y ++ move t6 t0 ++ sne t0 t5 oreg t6
                |Float ->  x ++ movs f5 f0 ++ y ++ movs f6 f0 ++ ceqs f5 f6 ++ jal ("falseDiff") ++ bc1f ("trueDiff")
                |_ ->nop
            end
    end
    |Unop (binop,e)->
    let first = comprec env next e in
      begin
        match binop with 
          Sub -> first ++ move t1 t0 ++ neg t0 t1
          |_ -> nop
      end
in
comprec StrMap.empty 0

let rec compile_instr ofile = function
    Set (str,e) ->
      let codes=compile_expr e in
      Hashtbl.replace genvar str codes;
      codes ++ lw t0 alab (str)
    |Print (e) ->
    begin
      match type_expr e with
        Int -> li v0 1 ++ compile_expr e ++ move a0 t0 ++ syscall ++ addi v0 zero oreg "0xB" ++ addi a0 zero oreg "0xA" ++ syscall
        |Float -> li v0 2 ++ compile_expr e ++ movs f12 f0 ++ syscall ++ addi v0 zero oreg "0xB" ++ addi a0 zero oreg "0xA" ++ syscall
        |Bool -> li v0 1 ++ compile_expr e ++ move a0 t0 ++ syscall ++ addi v0 zero oreg "0xB" ++ addi a0 zero oreg "0xA" ++ syscall
    end
    |If (e,stmt) ->
    counter := !counter+1;
    let skipif = "skip" ^ string_of_int(!counter) in
    let stmtl = List.map(compile_instr ofile) stmt in
    let stmtl = List.fold_right (++) stmtl nop in
    compile_expr e ++ beqz t0 skipif ++ stmtl ++ label skipif
    |IfElse (e,stmt1,stmt2) ->
    counter := !counter+1;
    let skipif = "skip" ^ string_of_int(!counter) in
    let scndCode = "scndCode" ^ string_of_int(!counter) in
    let stmtl1 = List.map(compile_instr ofile) stmt1 in
    let stmtl1 = List.fold_right (++) stmtl1 nop in
    let stmtl2 = List.map(compile_instr ofile) stmt2 in
    let stmtl2 = List.fold_right (++) stmtl2 nop in
    compile_expr e ++ beqz t0 scndCode ++ stmtl1 ++ jal skipif ++ label scndCode ++ stmtl2 ++ label skipif

(* Compilação do programa p e grava o código no ficheiro ofile *)
let compile_program p ofile =
  let code = List.map (compile_instr ofile) p in
  let code = List.fold_right (++) code nop in
  let p =
    { text =
        label "main" ++
        code ++
        jal ("end") ++
        label "false" ++
        li t0 0 ++
        addi ra ra oi 4++
        jr ra ++
        label "true" ++
        li t0 1 ++
        jr ra ++
        label "falseDiff" ++
        li t0 0 ++
        jr ra ++
        label "trueDiff" ++
        li t0 1 ++
        addi ra ra oi 4 ++
        jr ra ++
        label "end";
        data =Hashtbl.fold (fun x _ l -> label x ++ dword [1] ++ l) genvar (label ".Sprint_int");
    }
  in
  let f = open_out ofile in
  let fmt = formatter_of_out_channel f in
  Mips.print_program fmt p;
  (* "flush" do buffer para garantir que tudo foi para aí escrito
     antes de o fechar *)
  fprintf fmt "@?";
  close_out f