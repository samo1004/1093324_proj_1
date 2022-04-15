# 1093324_proj_1

## 使用變數 :
  _t0_ : 存n\
  _t1_ : 存最後要輸出的值\
  _t2、t3、t4_ : 存一些拿來比較、運算的值
## 程式碼解說 :
  先把一些輸入輸出時的引導字串設定好
  ```asm
  endl:	.string "\n"  #edit
  Input:  .string "Input a number: \n"
  Output:	.string "The damage: \n"
  ```
  依照題義輸入一個整數n，n的範圍為0~99，將n assign到t0(後續都以t0做運算和比較)\
  接著將t1設定為0，當作累積傷害量的變數\
  進入Function
  ```asm
  la a0,Input     #load Input 到 a0
	li a7,4         #syscall mode 4 print string
	ecall           #syscall
	li a7,5         #syscall mode 5 enter and put in a0
	ecall           #syscall
	add t0,zero,a0  #assign the entering interger to t0
	
	add t1,x0,x0#t1 歸0
	jal ra,F#第一次call function
  ```
## 範例輸入 :
  5\
  10\
  15\
  20\
  25
## 範例輸出 :
  28\
  309\
  1118\
  4472\
  78

