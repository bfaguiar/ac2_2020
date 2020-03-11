
		
		.equ READ_CORE_TIMER, 11
		.equ RESET_CORE_TIMER, 12
		.equ K, 20000
		.equ PUT_CHAR, 3
		.equ PRINT_INT, 6

		.data
		.text
		.globl main

main:  	
while1:	lui $t1, 0xBF88
		lw  $t2, 0x6050($t1)
		andi $t2, $t2, 0x000F
		move $a0, $t2
		li $a1, 2
		li $v0, PRINT_INT
		syscall
		li $a0, ' '
		li $v0, PUT_CHAR
		syscall
		# printInt ( $t2, 2)
		li $a0, 500
		jal delay
		j while1
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
