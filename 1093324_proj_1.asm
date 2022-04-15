.globl main
.data 	
    
	endl:		.string "\n"#edit
   	Input:	.string "Input a number: \n"
   	Output:	.string "The damage: \n"
.text
main:

	la a0,Input#load Input 到 a0
	li a7,4#syscall mode 4 print string
	ecall#syscall
	li a7,5#syscall mode 5 enter and put in a0
	ecall#syscall
	add t0,zero,a0#assign the entering interger to t0
	
	add t1,x0,x0#t1 歸0
	jal ra,F#第一次call function
	
	la a0,Output#ra要回來的地方
	li a7,4#print string
	ecall
	mv a0,t1#t1 存ans
	li a7,1#mode 1  print int
	ecall
    	li a7,10
	ecall
F:
	addi sp,sp,-8#空出兩格 #一格-4
	sw ra,0(sp)#把return address存起來
	sw t0,4(sp)#把n存起來
	addi t2,zero,0#t2拿來比較n
	beq t0,zero,xeq0#n=0
	addi t2,zero,1#t2=1
	beq t0,t2,xeq1#n=1
	addi t2,zero,11#t2=11
	blt t0,t2,xb1s11#n>1 n<=10
	addi t2,zero,21#t2=21
	blt t0,t2,xb10s21#n>10 n<=20
	bge t0,t2,xb20#>20

xeq0:	
	addi t1,t1,1#+1
	j Exit
	
xeq1:
	addi t1,t1,5#+5
	j Exit
xb1s11:
	addi t0,t0,-1#n-1
	jal ra, F#跳過去做
	addi t0,t0,-1#n-2
	jal ra,F#跳過去做
	j Exit#跳出
xb10s21:
	addi t0,t0,-2#n-2
	jal ra,F
	addi t0,t0,-1#n-3
	jal ra,F
	j Exit
xb20:
	add t2,zero,t0#先存個n
	slli t2,t2,1#n*2
	add t1,t1,t2#+n*2
	addi t3,zero,5#等等除5
	div t0,t0,t3#n/5
	jal ra,F
	j Exit
Exit:
	lw ra,0(sp)
	lw t0,4(sp)#把F讀進去的存回來
	addi sp,sp,8
	jalr x0,0(ra)

	
	


