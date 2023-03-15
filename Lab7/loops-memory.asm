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



sum13:



sum67:



