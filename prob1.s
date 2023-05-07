.data
vetor: .word 0 0 0 0
##### START MODIFIQUE AQUI START #####

##### END MODIFIQUE AQUI END #####
.text
main:
add s0, zero, zero
#Teste 1
addi a0, zero, 5
addi a1, zero, 7
la a2, vetor
jal ra, primos
addi t0, zero, 2
beq t0, a0, OK1
beq zero, zero, T2
OK1: addi s0, s0, 1 #Teste ok, passou
#Teste 2
T2: addi a0, zero, 11
addi a1, zero, 6
la a2, vetor
jal ra, primos
addi t0, zero, 3
beq t0, a0, OK2
beq zero,zero, FIM
OK2: addi s0, s0, 1 #Teste ok, passou
beq zero,zero, FIM
##### START MODIFIQUE AQUI START #####
isPrime:
addi t1, zero, 2
increasePrimeTest: beq t1, a4, truePrime
    rem t2, a4, t1 
    addi t1, t1, 1
    bne t2, zero, increasePrimeTest 
    addi a3, zero, 0
    jalr zero, 0(x1)
truePrime: addi a3, zero, 1
    jalr zero, 0(x1)
primos: 
	add s2, a0, zero
    add s4, zero, zero
    addi s5, zero, 1
    addi s6, a1, 1
    add a4, s2, zero
	addi s7, zero, 2
    # Se o valor incial for 1 -> incrementa o iterador em um
    bge s2, s7, primosLoop
    addi a4, a4, 1
primosLoop: beq a4, s6, end
  	addi sp, sp, -4
	sw ra, 0(sp)
	jal ra, isPrime
	lw ra, 0(sp)
	addi sp, sp, 4
	addi a4, a4, 1
    beq a3, s5, saveInRegister
    beq x0, x0, primosLoop
saveInRegister: sw a4, 0(a2)
                addi s4, s4, 1
                addi a2, a2, 4
                beq x0, x0, primosLoop
end:  add a0, s4, zero
    jalr zero, 0(x1)
##### END MODIFIQUE AQUI END #####
FIM: add zero, zero, zero
#Final da execucao, s0 deve ter o valor igual a 2.