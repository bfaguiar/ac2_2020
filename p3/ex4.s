	
		.equ TRISE, 0x6100
		.equ SFR_BASE_HI, 0xBF88 
		.equ LATE, 0x6120

		.equ READ_CORE_TIMER, 11
		.equ RESET_CORE_TIMER, 12
		.equ K, 20000

		.data
		.text
		.globl main

main:	addiu $sp, $sp, -12
		sw $ra, 0($sp)
		sw $s0, 4($sp)
		sw $s1, 8($sp)

		li $s0, 0
		
		lui $s1, SFR_BASE_HI

		lw $t3, TRISE($s1)
		andi $t3, $t3, 0xFFFE
		sw $t3, TRISE($s1)

while1:  lw $t0, LATE($s1)
		andi $t0, $t0, 0xFFFE
		or $t0, $t0, $s0
		sw $t0, LATE($s1)

		li $a0, 500
		jal delay

		xori $s0, $s0, 1

		j while1

		lw $ra, 0($sp)
		lw $s0, 4($sp)
		lw $s1, 8($sp)
		subu $sp, $sp, -12

		jr $ra

delay:	blez $a0, efor
		li $v0, RESET_CORE_TIMER
		syscall
while:  li $v0, READ_CORE_TIMER
		syscall
		bge $v0, K, endw
		j while
endw:   		
		addi $a0, $a0, -1
		j delay
efor:   jr $ra