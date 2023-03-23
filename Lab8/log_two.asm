# Thomas Jones
# Autumn Bertram


.globl log_two
.text

addi $a0, $0, 1
addi $a1, $0, 1
addi $a2, $0, 1
jal log_two

addi $v0, $0, 10
syscall

log_two:
        #code here
        #space on the stack
        addi $sp, $sp, -4
        sw $ra, 0($sp)

        # basecases
        addi $t0, $0, 1
        beq $a0, $t0, base_case_1

        slt $t1, $a0, $t0
        beq $t1, $t0, base_case_neg
        
        # recursion
        sra $a0, $a0, 1
        jal log_two 

        addi $v0, $v0, 1
        j return

    base_case_1:
        addi $v0, $0, 0
        j return

    base_case_neg:
        addi $v0, $0, -1
        j return

    return:
        lw $ra, 0($sp)
        addi $sp, $sp, 4

        jr $ra
