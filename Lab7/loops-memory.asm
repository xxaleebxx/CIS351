.globl indexOf max sum13 sum67
.text

addi $a0, $0, 1
addi $a1, $0, 1
jal indexOf

addi $a0, $0, 1
addi $a1, $0, 1
jal max

addi $a0, $0, 1
addi $a1, $0, 1
jal sum13

addi $a0, $0, 3
addi $a1, $0, 3
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
    # two arguments: int[] array (a0), length (a1)
    # return: largest value in the array

    # t0 = count (i)
    addi $t0, $0, 0

    # t1 = max value
    addi $t1, $0, 0

    #loop to check for max value
    loop_max:

        #if t0 == a1, go to end
        slt $t2, $t0, $a1
        beq $t2, $0, done_max

        sll $t2, $t0, 2
        add $t2, $t2, $a0

        # t3 = array[i]
        lw $t3, 0($t2)

        # compare array[i] to max, t3 to t1
        ble $t1, $t3, new_max

        # i = i + 1
        addi $t0, $t0, 1
        j loop_max

        new_max:
            addi $t1, $t3, 0

            # i = i + 1
            addi $t0, $t0, 1
            j loop_max

    done_max:
        addi $v0, $t1, 0
        jr $ra


sum13:

# $a0 = int[] nums
# $a1 = size
# $a2 = sum
# $a3 = 13
# $t4 = count
# $t5 = array[i]

    addi $a2, $0, 0
    addi $a3, $0, 13
    addi $t4, $0, 0
    addi $t5, $0, 0

    for13:
        
        bge $t4, $a1, end_array13
        
        
        sll $t0, $t4, 2
        add $t0, $t0, $a0

        lw $t5, 0($t0)
        
        beq $t5, $a3, unlucky
        add $a2, $a2, $t5

        addi $t4, $t4, 1
        j for13

        unlucky:
            addi $t4, $t4, 2
            j for13

    empty_array:
        addi $v0, $0, 0
        jr $ra

    end_array13:
        add $v0, $0, $a2
        jr $ra



sum67:
    # two arguments: int[] array (a0), size (a1)
    # return: sum of values in the array, except for sections of of numbers start at 6 and ending at 7

    # t0 = count (i)
    addi $t0, $0, 0

    # t1 = sum value
    addi $t1, $0, 0

    # t6 = 6
    addi $t6, $0, 6

    # t7 = 7
    addi $t7, $0, 7

    #loop to add values
    loop_67:
        
        #if t0 == a1, go to end
        slt $t2, $t0, $a1
        beq $t2, $0, done_67

        sll $t2, $t0, 2
        add $t2, $t2, $a0

        # t3 = array[i]
        lw $t3, 0($t2)

        # compare array[i] to 6, t3 to t6
        beq $t6, $t3, six

        # if array[1] != 6, add it to the sum (t1)
        add $t1, $t1, $t3

        # i = i + 1
        addi $t0, $t0, 1
        j loop_67

        six:
            # i = i + 1
            addi $t0, $t0, 1
            sll $t2, $t0, 2
            add $t2, $t2, $a0

            #t3 = array[i]
            lw $t3, 0($t2)

            # check if array[i] == 7, if not, loop
            beq $t3, $t7, seven
            j six

        seven:
            addi $t0, $t0, 1
            j loop_67

    done_67:
        addi $v0, $t1, 0
        jr $ra
