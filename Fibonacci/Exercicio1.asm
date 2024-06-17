// Implementação de função para determinar o n-ésimo termo da Sequência de Fibonacci;
// Use a função implementada em no item anterior para determinar o 30° número de Fibonacci;
// Implementação de função para determinar a razão áurea ϕ;
// Use a função implementada acima para determinar ϕ usando F41 e F40;


// O valor do 30° termo da Série de Fibonacci deve estar armazenado no registrador $s1;
// O valor do 41° termo da Série de Fibonacci deve estar em $s2;
// O valor do 40° termo da Série de Fibonacci deve estar em $s3;
// O valor da razão áurea ϕ (phi) deve  estar em $f0;

.data
msg_fib: .asciiz "O 30° termo da Série de Fibonacci é: "
msg_phi: .asciiz "O valor da razão áurea φ (phi) é: "

.text
.globl main

main:
    li $a0, 30          
    jal fibonacci
    move $s1, $v0       

    li $a0, 41          
    jal fibonacci
    move $s2, $v0       

    li $a0, 40          
    jal fibonacci
    move $s3, $v0       

    mtc1 $s2, $f4       
    mtc1 $s3, $f6       
    cvt.s.w $f4, $f4    
    cvt.s.w $f6, $f6    
    div.s $f0, $f4, $f6 

    li $v0, 4
    la $a0, msg_fib
    syscall
    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 4
    la $a0, msg_phi
    syscall
    li $v0, 2
    mov.s $f12, $f0
    syscall

    li $v0, 10
    syscall

fibonacci:
    li $t0, 0         
    li $t1, 1          
    move $t2, $a0      
    addi $t2, $t2, 1	
    li $t3, 2          

fib_loop:
    add $t4, $t0, $t1  
    move $t0, $t1      
    move $t1, $t4      
    addi $t3, $t3, 1   
    bne $t3, $t2, fib_loop  

    move $v0, $t1      
    jr $ra            