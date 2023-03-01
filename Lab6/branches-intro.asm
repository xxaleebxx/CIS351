.globl makes10 intMax close10 dateFashion
.text

addi $a0, $0, 1
addi $a1, $0, 1
jal makes10

addi $a0, $0, 1
addi $a1, $0, 1
jal intMax

addi $a0, $0, 1
addi $a1, $0, 1
jal close10

addi $a0, $0, 1
addi $a1, $0, 1
jal dateFashion


addi $v0, $0, 10
syscall

makes10:
	# Two arguments: a ($a0), b ($a1)
	# Return: 1 if 10, 0 if not 10
	
	addi $t0, $0, 0 # False ($t0)
	addi $t1, $0, 1 # True ($t1)
	addi $a2, $0, 10 # $a2 = 10
	
	beq $a0, $a2, is_true_10
	add $a3, $a0, $a1 # $a3 = a + b
	beq $a3, $a2, is_true_10
	j end_block
	
	beq $a1, $a2, is_true_10
	add $a3, $a0, $a1 # $a3 = a + b
	beq $a3, $a2, is_true_10
	j end_block
	
	
	is_true_10:
		addi $v0, $0, 1
		
	end_block:
		jr $ra
		
intMax:

close10:

dateFashion:
