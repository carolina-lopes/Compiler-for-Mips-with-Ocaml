.text
main:
	li $t0, 5
	lw $t0, x
	li $v0, 1
	li $t0, 5
	move $t1, $t0
	li $t0, 5
	move $t2, $t0
	add $t0, $t1, $t2
	move $a0, $t0
	syscall
	addi $v0, $zero, 0xB
	addi $a0, $zero, 0xA
	syscall
	li $v0, 1
	li $t0, 5
	move $a0, $t0
	syscall
	addi $v0, $zero, 0xB
	addi $a0, $zero, 0xA
	syscall
	jal end
false:
	li $t0, 0
	addi $ra, $ra, 4
	jr $ra
true:
	li $t0, 1
	jr $ra
falseDiff:
	li $t0, 0
	jr $ra
trueDiff:
	li $t0, 1
	addi $ra, $ra, 4
	jr $ra
end:
.data
x:
	.word 1
.Sprint_int:
