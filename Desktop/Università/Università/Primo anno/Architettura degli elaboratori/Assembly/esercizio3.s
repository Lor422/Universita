lista  dcd     1,2,3,4,5,6,7,8
dim    dcd     8
som    fill    4
cost   equ     10

       mov     r1,#dim
       ldr     r1,[r1]
       mov     r2, #lista



ciclo  ldr     r5,[r2]
       subs    r1,r1,#1
       add     r5,r5,#cost
       add     r3,r3,r5
       add     r2,r2,#4
       bgt     ciclo

       mov     r6,#som
       str     r3,[r6]


