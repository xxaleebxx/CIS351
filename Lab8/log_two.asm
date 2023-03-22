// Thomas Jones
// Autumn Bertram


.globl log_two
.text

addi $a0, $0, 1
addi $a1, $0, 1
addi $a2, $0, 1
jal log_two

addi $v0, $0, 10
syscall

log_two:
    //code here
    