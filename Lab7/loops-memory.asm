.globl indexOf max sum13 sum67
.text

#addi $a0, $0, 1
#addi $a1, $0, 1
#jal indexOf

#addi $a0, $0, 1
#ddi $a1, $0, 1
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


