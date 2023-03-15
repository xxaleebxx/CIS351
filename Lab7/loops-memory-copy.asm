.globl indexOf max sum13 sum67
.text


 

indexOf:
    jr $ra


max:
    jr $ra


sum13:

# $a0 = int[] nums
# $a1 = nums[i]
# $a2 = sum
# $a3 = 13

addi $a2, $0, 0
addi $a3, $0, 13

    for13:
        lw $a1, ($a0)
        blt $a1, $0, end_array13
        beq $a1, $a3, unlucky
        add $a2, $a2, $a1
        addi $a1, $a1, 4
        j for

        unlucky:
            addi $a0, $a0, 8
            j for

    empty_array:
        addi $v0, $0, 0
        jr $ra

    end_array13:
        add $v0, $0, $a2
        jr $ra

sum67:
    jr $ra


