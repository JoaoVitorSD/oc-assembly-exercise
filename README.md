# Problema 1:	Números	primos (prob1.s) (5 pontos)
Escreva	um	procedimento	que	calcule	os	números	primos	na	faixa	a	ser	indicada,	salvando	o	dado	em	uma	posição	de	
memória	especificada.	O	seu	procedimento	deve	ter	o	nome	“primos”,	e	irá	receber	os	seguintes	parâmetros:
- a0:	valor	de	início	para	a	pesquisa	(inclusive)
- a1:	valor	de	fim	para	a	pesquisa	(inclusive)
- a2:	ponteiro	para	posição	de	memória	aonde	os	números	primos	devem	estar

O	seu	programa	deve	retornar	quantos	números	primos	foram	encontrados	na	sequência. Assuma	que	a	memória	onde os	números	primos	serão	escritos	possui	espaço	suficiente	para	que	todos	eles	sejam	escritos.
Utilize	o	esqueleto	a	seguir	para	o	seu	arquivo prob1.s **(repare	que	a	parte	acima	e	abaixo	do	MODIFIQUE	AQUI poderá	ser	alterada	pelo	professor/monitor no	momento	da	correção)**:

```assembly
.data
vetor: .word 0 0 0 0
##### START MODIFIQUE AQUI START #####
#
# Este espaço eh para você definir as suas constantes e vetores auxiliares.
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
T2: addi a0, zero, 1
addi a1, zero, 6
la a2, vetor
jal ra, primos
addi t0, zero, 3
beq t0, a0, OK2
beq zero,bzero, FIM
OK2: addi s0, s0, 1 #Teste ok, passou
beq zero,bzero, FIM
##### START MODIFIQUE AQUI START #####
primos: jalr zero, 0(ra)
##### END MODIFIQUE AQUI END #####
FIM: add zero, zero, zero
#Final da execucao, s0 deve ter o valor igual a 2.
```
***
# Problema 2: Validador de cartão de crédito (prob2.s) (5 pontos)

Este	 programa	irá	exercitar	 um	 conceito	muito	importante	 no	assembly:	a	gestão	 da	 pilha de	 chamadas	 de	 forma	correta,	que	é	necessária	para	desenvolvermos	programas	em	que	um	procedimento	chama	outro	procedimento ou para	 que	 seja	 possível	 usar	 bibliotecas	 de	 terceiros.	 Este	 conhecimento	 será	 exercido	implementando	 dois procedimentos.	 Os	 procedimentos	 vão	 seguir	 o	 algoritmo	 de	 Luhn,	 que	 valida	 números	 de	 cartão	 de	 crédito. 

**Observação:	o	código	de	correção	automática	pode	fazer	a	chamada	dos	procedimentos separadamente	para fins	de	verificação	de	que	a	gestão	da	pilha	está	correta. Uma descrição	do	algoritmo	pode ser	encontrada	na	página	a seguir: [https://suporte.braspag.com.br/hc/pt-br/articles/360050638051-Como-validar-um-cart%C3%A3oMod10]**

1. verifica:	 Procedimento	 que	 recebe	 uma	string de	 inteiros	 representando	 os	 dígitos	 do	 cartão	 de	 crédito.	 Ele retorna	1	se	o	cartão é	válido	e	0	se o	cartão é	inválido.	O	único	argumento	é	o	ponteiro	para	os	dígitos	do	cartão	de	crédito.
2. multvetores:	Procedimento	que	executa	o	passo	2	do	algoritmo	apresentado	na	página	Web.	Em	outras	palavras,	
ele	calcula	a	multiplicação	do	vetor	que	contém	os	dígitos	do	cartão	de	crédito	pelo	vetor	de	base	(um	vetor	com	
o	valor	1	para	os	índices	ímpares	e	2	para	os	índices	pares,	começando	o	vetor	com	o	índice	zero).	O	retorno	deste	
procedimento	 deve	 ser	 o	 escalar	 que	 resultante	 da	multiplicação	 dos	 dois	 vetores. O	 único	 argumento	 deste	
procedimento	é	o	vetor	com	os	dígitos	do	cartão	de	crédito.

```assembly
.data
cartao: .word 4 9 1 6 6 4 1 8 5 9 3 6 9 0 8 0
##### START MODIFIQUE AQUI START #####
#
# Este espaço eh para você definir as suas constantes e vetores auxiliares.
##### END MODIFIQUE AQUI END #####
.text
main:
la a0, cartao
jal ra, verifica
beq zero,zero,FIM
##### START MODIFIQUE AQUI START #####
verifica: jalr zero, 0(ra)
multvetores: jalr zero, 0(ra)
##### END MODIFIQUE AQUI END #####
FIM: add zero, zero, zero
```