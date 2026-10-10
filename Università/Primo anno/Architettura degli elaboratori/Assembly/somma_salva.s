num1   dcd     10
       mov     R1,#10
       mov     R2,#20
       add     r3,R1,R2
       mov     r5,#num1;in r5 carico indirizzo di memoria di num1
       str     r3,[r5];[r5] è un puntatore, salvo in r5 il valore r3
       ldr     r6,[r5];carico in r6 il valore di r5
       end
       