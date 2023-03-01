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


add $v0, $0, 10
syscall


