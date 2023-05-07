.data
cartao: .word 4 6 7 9 0 7 1 6 4 5 7 2 8 3 5 6
##### START MODIFIQUE AQUI START #####

# Este espaço eh para você definir as suas constantes e vetores auxiliares.
addi s1, zero, 2
addi s2, zero, 1
# Tamanho do vetor
addi s9, zero, 16
addi s10, zero, 10
##### END MODIFIQUE AQUI END #####
.text
main:
la a0, cartao
jal ra, verifica
beq zero,zero,FIM
##### START MODIFIQUE AQUI START #####
verifica:
        # Guarda o endereço de retorno que chamou o procedimento "verifica"
        addi sp, sp, -4
	    sw ra, 0(sp)
        jal ra, multvetores
        lw ra, 0(sp)
	    addi sp, sp, 4
        # Pega a soma que é feita em mulvetores e tira o módulo por 10
        rem s3, a2, s10
        # Subtrai 10 do resto da soma por 10, caso a subtração seja 10, é feito o módulo de s4 por 10 para considerar que 10 = 0
        sub s4, s10, s3
        rem s4, s4, s10
        lw s5, 0(a0)
        # Se a última posição do vetor for igual a conta feita, o cartão é válido. No caso, s5 sempre será o último número do cartão, pois o procedimento multvetores deixa o vetor na posição correta 
        beq s5, s4, valid
        addi a0, zero, 0
        beq zero, zero, endVerifica
valid: addi a0, zero, 1
        beq zero, zero, endVerifica
endVerifica: jalr zero, 0(ra) 
multvetores:
        # Variável para alternar entre coluna ímpar e par
        addi s3, zero, 0
        # Soma do vetor
        addi s4, zero, 0
        # Inicialize o iterador
        addi s8, zero, 0
internalMultiLoop: beq s8, s9, endMulti
        addi s8, s8, 1
        lw s6, 0(a0)
        addi a0, a0, 4
        beq s3, zero, multiOdd
        beq zero, zero multiEven
        continue: add s4, s4, s7
        beq zero, zero internalMultiLoop
endMulti: add a2, s4, zero
        jalr zero, 0(ra)
multiOdd: addi s3, zero 1
        mul s7,s6, s1
        # ONo caso da múltiplicação ser maior que 10, só vai acontecer se a coluna for par, então é verificado se a multiplicação é > 10, se sim, é subtraído por 9 para normalizar o valor
        blt s7, s10, continue
        # Ex: 9*2 = 18- 9 = 1 + 8 = 9
         addi s7, s7, -9
        beq zero, zero, continue
multiEven: addi s3, zero, 0
        mul s7,s6, s2
        beq zero, zero, continue
##### END MODIFIQUE AQUI END #####
FIM: add zero, zero, zero