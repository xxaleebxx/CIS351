.globl indexOf max sum13 sum67
.text

#addi $a0, $0, 1
#addi $a1, $0, 1
#jal indexOf

#addi $a0, $0, 1
#addi $a1, $0, 1
#addi $a2, $0, 1
#jal max

#addi $a0, $0, 1
#addi $a1, $0, 1
#jal sum13

addi $a0, $0, 1
addi $a1, $0, 1
jal sum67


addi $v0, $0, 10
syscall
 

indexOf:
# $a0 = value
# $a1 = int[] array
# $a2 = i
# $a3 = array[i]

addi $a2, $0, 0
addi $a3, $0, 0

    for:
        lw $a3, 0($a1)
        beq $a0, $a3, value_found
        blt $a3, $0, end_array
        addi $a1, $a1, 4
        addi $a2, $a2, 1
        j for

    value_found:
        add $v0, $0, $a2
        jr $ra

    end_array:
        subi $v0, $0, 1
        jr $ra


max:
    jr $ra


sum13:

# $a0 = int[] nums
# $a1 = size
# $a2 = sum
# $a3 = 13
# $a4 = count
# $a5 = array[i]

addi $a2, $0, 0
addi $a3, $0, 13
addi $a4, $0, 0
addi $a5, $0, 0

    for13:
        lw $a5, 0($a0)
        beq $a5, $0, end_array13
        beq $a5, $a3, unlucky
        add $a2, $a2, $a5
        addi $a5, $a5, 4
        addi $a4, $0, 1
        j for13

        unlucky:
            addi $a0, $a0, 8
            j for13

    empty_array:
        addi $v0, $0, 0
        jr $ra

    end_array13:
        add $v0, $0, $a2
        jr $ra

sum67:
    jr $ra


