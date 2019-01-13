(* Biblioteca para produzir código MIPS

   2008 Jean-Christophe Filliâtre (CNRS)
   2013 Kim Nguyen (Université Paris Sud)
*)

open Format

type register =  string
let v0 : register = "$v0" (* Avalia expressões e retorna resuls*)
let v1 : register = "$v1"(* Avalia expressões e retorna resuls*)
let a0 : register = "$a0"(*Args*)
let a1 : register = "$a1"(*Args*)
let a2 : register = "$a2"(*Args*)
let a3 : register = "$a3"(*Args*)
let t0 : register = "$t0"(*Temps*)
let t1 : register = "$t1"(*Temps*)
let t2 : register = "$t2"(*Temps*)
let t3 : register = "$t3"(*Temps*)
let t4 : register = "$t4"(*Temps*)
let t5 : register = "$t5"(*Temps*)
let t6 : register = "$t6"(*Temps*)
let t7 : register = "$t7"(*Temps*)
let s0 : register = "$s0"(*Saved Temps*)
let s1 : register = "$s1"(*Saved Temps*)
let f0 : register = "$f0"(*CoProcessor Floating Point Adress*)
let f1 : register = "$f1"(*CoProcessor Floating Point Adress*)
let f2 : register = "$f2"(*CoProcessor Floating Point Adress*)
let f3 : register = "$f3"(*CoProcessor Floating Point Adress*)
let f4 : register = "$f4"(*CoProcessor Floating Point Adress*)
let f5 : register = "$f5"(*CoProcessor Floating Point Adress*)
let f6 : register = "$f6"(*CoProcessor Floating Point Adress*)
let f7 : register = "$f7"(*CoProcessor Floating Point Adress*)
let f8 : register = "$f8"(*CoProcessor Floating Point Adress*)
let f9 : register = "$f9"(*CoProcessor Floating Point Adress*)
let f10 : register = "$f10"(*CoProcessor Floating Point Adress*)
let f11 : register = "$f11"(*CoProcessor Floating Point Adress*)
let f12 : register = "$f12"(*CoProcessor Floating Point Adress*)
let ra : register = "$ra"(*Return Adress *)
let sp : register = "$sp"(*Stack Pointer*)
let fp : register = "$fp"(*Frame Pointer *)
let gp : register = "$gp"(*Pointer to global Area *)
let zero : register = "$zero" (*constante 0 *)

type label = string
type 'a address = formatter -> 'a -> unit
let alab : label address = fun fmt  (s : label) -> fprintf fmt "%s" s
let areg : (int * register) address = fun fmt (x, y) -> fprintf fmt "%i(%s)" x y
type 'a operand = formatter -> 'a -> unit
let oreg : register operand = fun fmt (r : register) -> fprintf fmt "%s" r
let oi : int operand = fun fmt i -> fprintf fmt "%i" i
let oi32 : int32 operand = fun fmt i -> fprintf fmt "%li" i

type 'a asm =
  | Nop
  | S of string
  | Cat of 'a asm * 'a asm

type text = [`text ] asm
type data = [`data ] asm

let buf = Buffer.create 17
let fmt = formatter_of_buffer buf
let ins x =
  Buffer.add_char buf '\t';
  kfprintf (fun fmt ->
    fprintf fmt "\n";
    pp_print_flush fmt ();
    let s = Buffer.contents buf in
    Buffer.clear buf;
    S s
  ) fmt x

let pr_list fmt pr = function
  | []      -> ()
  | [i]     -> pr fmt i
  | i :: ll -> pr fmt i; List.iter (fun i -> fprintf fmt ", %a" pr i) ll

let pr_ilist fmt l =
  pr_list fmt (fun fmt i -> fprintf fmt "%i" i) l

let pr_alist fmt l =
  pr_list fmt (fun fmt (a : label) -> fprintf fmt "%s" a) l

let movs a b = ins "mov.s %s, %s" a b
let adds a b (o : 'a operand) = ins "add.s %s, %s, %a" a b o
let subs a b (o : 'a operand) = ins "sub.s %s, %s, %a" a b o
let divs a b (o : 'a operand) = ins "div.s %s, %s, %a" a b o
let muls a b (o : 'a operand) = ins "mul.s %s, %s, %a" a b o
let ceqs a b = ins "c.eq.s %s, %s" a b 
let cles a b = ins "c.le.s %s, %s" a b 
let clts a b = ins "c.lt.s %s, %s" a b 
let mtc1 a b = ins "mtc1 %s, %s" a b
let mtc0 a b = ins "mtc0 %s, %s" a b
let bc1f (a : label) = ins "bc1f %s" a

let addiu a b (o : 'a operand) x = ins "addiu %s, %s, %a" a b o x
let addi a b (o : 'a operand) x = ins "addi %s, %s, %a" a b o x
let abs a b = ins "abs %s, %s" a b
let add a b (o : 'a operand) x = ins "add %s, %s, %a" a b o x
let clz a b = ins "clz %s, %s" a b
let and_ a b c = ins "and %s, %s, %s" a b c
let div a b = ins "div %s, %s" a b
let mul a b (o : 'a operand) x = ins "mul %s, %s, %a" a b o x
let or_ a b c = ins "or %s, %s, %s" a b c
let not_ a b = ins "not %s, %s" a b
let rem a b (o : 'a operand) x = ins "rem %s, %s, %a" a b o x
let neg a b = ins "neg %s, %s" a b
let sub a b (o : 'a operand) = ins "sub %s, %s, %a" a b o
let li a b = ins "li %s, %i" a b
let li32 a b = ins "li %s, %li" a b
let seq a b (c : 'a operand) = ins "seq %s, %s, %a" a b c
let sge a b (c : 'a operand) = ins "sge %s, %s, %a" a b c
let sgt a b (c : 'a operand) = ins "sgt %s, %s, %a" a b c
let sle a b (c : 'a operand) = ins "sle %s, %s, %a" a b c
let slt a b (c : 'a operand) = ins "slt %s, %s, %a" a b c
let sne a b (c : 'a operand) = ins "sne %s, %s, %a" a b c
let b (z : label) = ins "b %s" z
let beq x y (z : label) = ins "beq %s, %s, %s" x y z
let bne x y (z : label) = ins "bne %s, %s, %s" x y z
let bge x y (z : label) = ins "bge %s, %s, %s" x y z
let bgt x y (z : label) = ins "bgt %s, %s, %s" x y z
let ble x y (z : label) = ins "ble %s, %s, %s" x y z
let blt x y (z : label) = ins "blt %s, %s, %s" x y z
let mflo x = ins "mflo %s" x

let beqz x (z : label) = ins "beqz %s, %s" x z
let bnez x (z : label) = ins "bnez %s, %s" x z
let bgez x (z : label) = ins "bgez %s, %s" x z
let bgtz x (z : label) = ins "bgtz %s, %s" x z
let blez x (z : label) = ins "blez %s, %s" x z
let bltz x (z : label) = ins "bltz %s, %s" x z

let jr a = ins "jr %s" a
let jal (z : label) = ins "jal %s" z
let jalr (z : register) = ins "jalr %s" z
let la x (p : 'a address)  = ins "la %s, %a" x p
let lb x (p : 'a address) = ins "lb %s, %a" x p
let lbu x (p : 'a address) = ins "lbu %s, %a" x p
let lw x (p : 'a address) = ins "lw %s, %a" x p
let sb x (p : 'a address) = ins "sb %s, %a" x p
let sw x (p : 'a address) = ins "sw %s, %a" x p
let move a b = ins "move %s, %s" a b
let nop = Nop
let label (s : label) = S (s ^ ":\n")
let syscall = S "\tsyscall\n"
let comment s = S ("#" ^ s ^ "\n")
let align n = ins ".align %i" n
let asciiz s = ins ".asciiz %S" s
let dword l = ins ".word %a" pr_ilist l
let address l = ins ".word %a" pr_alist l
let space n = ins ".space %d" n
let inline s = S s
let (++) x y = Cat (x, y)


let push r =
  sub sp sp oi 4 ++
  sw r areg (0, sp)

let peek r =
  lw r areg (0, sp)

let pop r =
  peek r ++
  add sp sp oi 4

let popn n =
  add sp sp oi n

type program = {
  text : [ `text ] asm;
  data : [ `data ] asm;
}

let rec pr_asm fmt = function
  | Nop          -> ()
  | S s          -> fprintf fmt "%s" s
  | Cat (a1, a2) -> pr_asm fmt a1; pr_asm fmt a2

let print_program fmt p =
  fprintf fmt ".text\n";
  pr_asm fmt p.text;
  fprintf fmt ".data\n";
  pr_asm fmt p.data;
  pp_print_flush fmt ()

let print_in_file ~file p =
  let c = open_out file in
  let fmt = formatter_of_out_channel c in
  print_program fmt p;
  close_out c