.globl makes10 intMax close10 dateFashion
.text

addi $a0, $0, 1
addi $a1, $0, 1
jal makes10

addi $a0, $0, 1
addi $a1, $0, 1
addi $a2, $0, 1
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
	beq $a1, $a2, is_true_10
	add $a3, $a0, $a1 # $a3 = a + b
	beq $a3, $a2, is_true_10
	add $v0, $0, $0
	j end_block	
	is_true_10:
		addi $v0, $0, 1
		j end_block
		
	end_block:
		jr $ra
		
intMax:
	# Three arguments a ($a0) b ($a1) c ($a2)
	
	ble $a0, $a1, a_lesseq_b # if
	ble $a0, $a2, a_lesseq_c # else
	add $v0, $0, $a0
	j end_block2
	 
	a_lesseq_b: 
		ble $a1, $a2, b_lesseq_c
		add $v0, $0, $a1
		j end_block2
		
		b_lesseq_c:
			add $v0, $0, $a2
			j end_block2
	
	a_lesseq_c:
		add $v0, $0, $a2
		j end_block2
	
	end_block2:
		jr $ra

close10:
    #two arguments a ($a0) b ($a1)
    #Return 0 if equal distance from 10, a if a is the least distance 10, b if b is the least distance from 10

    # t2 = 10
    addi $t2, $0, 10

    # t0 = t2 - a0
    sub $t0, $t2, $a0

    # t1 = abs(t0)
    abs $t1, $t0

    # t3 = t2 - a1
    sub $t3, $t2, $a1

    # t4 = abs(t3)
    abs $t4, $t3
    # slt $t7, $t3, $0

    


    # t6 = 1
    addi $t6, $0, 1

    # if a_dist == b_dist, return 0
    beq $t1, $t4, v_0

    # else, if a_dist less than b_dist, t5 = 1. otherwise, t5 = 0
    slt $t5, $t1, $t4

    beq $t5, $t6, a_less
    addi $v0, $a1, 0
    j end


    v_0:
        addi $v0, $0, 0
        j end

    a_less:
        addi $v0, $a0, 0
        j end

    end:
        jr $ra

dateFashion:
    # 2 arguments: you (a0), date (a1)
    # if date or you >= 8, return 2
    # else if date or you <= 2, return 0
    # else, return 1

    addi $t0, $0, 1

    # check if arguments are <= 2
    addi $t5, $0, 3
    slt $t1, $a0, $t5
    slt $t2, $a1, $t5
    beq $t1, $t0, no
    beq $t2, $t0, no

    # check if arguments are >= 8
    addi $t6, $0, 8
    slt $t3, $a0, $t6
    slt $t4, $a1, $t6
    beq $t3, $0, yes
    beq $t4, $0, yes

    no:
        addi $v0, $0, 0
        j ending
    
    yes: 
        addi $v0, $0, 2
        j ending

    ending:
        jr $ra
