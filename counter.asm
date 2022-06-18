# Nhập vào một số nguyên, hiển thị 2 chữ số cuối của số nguyên đó


.eqv	SEVENSEG_LEFT	0xFFFF0011
.eqv 	SEVENSEG_RIGHT	0XFFFF0010

	# 0 - abcdef 	- 0011 1111	63
	# 1 - cb	- 0000 0110	6
	# 2 - abdeg	- 0101 1011	91
	# 3 - abcdg	- 0100 1111	79
	# 4 - bcfg	- 0110 0110	102
	# 5 - acdfg	- 0110 1101	109
	# 6 - acdefg	- 0111 1101	125
	# 7 - abc	- 0000 0111	7
	# 8 - abcdefg	- 0111 1111	127
	# 9 - abcdfg	- 0110 1111	111
.data
	arr:	.word	63, 6, 91, 79, 102, 109, 125, 7, 127, 111
	
.text
	la	$s0, arr
	li	$s1, 10		# s1 = arr.length


main:

	li	$t9, 0	# i = 0
while:
	beq	$t9, $s1, endmain
	nop
	
	sll	$t1, $t9, 2
	add	$s2, $s0, $t1	# s2 = &a[i]
	lw	$v0, 0($s2)	# v0 = s[i]
	
	addi	$a0, $0, 63
	jal	SHOW_7SEG_LEFT
	nop
	
	add	$a0, $0, $v0
	jal	SHOW_7SEG_RIGHT
	nop
	
	li $v0, 32
	li $a0, 1000
	syscall

	addi	$t9, $t9, 1
	j	while

SHOW_7SEG_LEFT:
	li	$t0, SEVENSEG_LEFT
	sb	$a0, 0($t0)
	jr	$ra
	
SHOW_7SEG_RIGHT:
	li	$t0, SEVENSEG_RIGHT
	sb	$a0, 0($t0)
	jr	$ra

endmain:

