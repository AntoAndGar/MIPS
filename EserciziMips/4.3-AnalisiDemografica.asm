# L'ISTAT ha rivisto le stime dell'aspettativa di vita (life expentancy, LE) della popolazione italiana in 84.8 per le donne e 80.5 per gli uomini.
# Realizzare un programma in assembly MIPS che acquisca da input un carattere F o M per discriminare il genere di un campione e un valore intero che rappresenta l'età 
# e determinare se il campione immesso ha superato la media oppure no. Il programma termina quando l'utente inserisce il carattere X
# ESEMPIO
# F;85;M;80;M;82;F;45;X
# OUTPUT
# OLTRE LA MEDIA LE; SOTTO LA MEDIA LE; OLTRE LA MEDIA LE; SOTTO LA MEDIA LE

.text 
.globl main

main:
	lb $t2, end
	lb $t3, femmina
loop:
	la $a0, buf
	li $a1, 2
	li $v0, 8
	syscall
	lb $t0, ($a0)
	beq $t0, $t2, fine 
	move $t1, $a1
	
	li $v0, 6
	syscall
	
	beq $t0, $t3, donna
	l.s $f2, uomini
	c.lt.s $f0, $f2
	bc1t meno
	bc1f sopra
	
donna:
	l.s $f2, donne
	c.lt.s $f0, $f2
	bc1t meno
	bc1f sopra
	
meno:
	la $a0, sotto
	li $v0, 4
	syscall
	j loop

sopra:
	la $a0, oltre
	li $v0, 4
	syscall
	j loop
	
fine:
	li $v0, 10
	syscall
	
.data
buf: .space 2
end: .asciiz "X"
femmina: .asciiz "F"
donne: .float 84.8
uomini: .float 80.5
oltre: .asciiz "oltre la media LE;"
sotto: .asciiz "sotto la media LE;"
