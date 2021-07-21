.text
.globl main

main:
	mtc1 $zero, $f5
	li $v0, 6
	syscall
	c.lt.s $f0, $f5
	bc1t raggio_neg
	l.s $f1, pi
	mul.s $f12, $f0, $f0
	mul.s $f12, $f12, $f1
	li $v0, 2
	syscall
	j fine
	
raggio_neg:
	li $v0, 4
	la $a0, Msg_Err
	syscall
	
fine: 
	li $v0, 10
	syscall
	
.data
pi: .float 3.14
Msg_Err: .asciiz "inserire raggio > 0"