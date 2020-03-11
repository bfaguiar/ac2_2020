		
		.equ SFR_BASE_HI, 0xBF88 
		.equ LATE, 0x6120
		.equ TRISB, 0x6040
		.equ PORTB, 0x6050
		.data
		.text
		.globl main



main:	lui $t1, SFR_BASE_HI
		lw $t2, TRISE($t1)
		andi $t2, $t2, 0xFFF0
		sw $t2, TRISE($t1)

		lw $t2, TRISB($t1)
		ori $t2, $t2, 0x000F
		sw $t2, TRISB($t1)

while:  lw $t2, PORTB($t1)
		andi $t2, $t2, 0x000F

		lw $t3, LATE($t1)
		andi $t3, $t3, 0xFFF0

		or $t3, $t3, $t2
		xori $t3, $t3, 0x0009
		sw $t3, LATE($t1)

		j while

		jr $ra




