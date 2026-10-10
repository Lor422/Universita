ARR      dcd     1,2,3,4,5,6,7,8,9
LUNG     dcd     9
VALMAX   fill    4
POSMIN   fill    4

         mov     r1,#LUNG
         ldr     r1,[r1]
         mov     r2,#ARR
         mov     r3,#0
         mov     r4,#0
         ldr     r3,[r2]
         ldr     r4,[r2]
         sub     r1,r1,#1

ciclo    subs    r1,r1,#1
         blt     esci
         add     r2,r2,#4
         ldr     r5,[r2]
         cmp     r3,r5
         blt     maggiore
         cmp     r4,r5
         bgt     minore
         b       ciclo



maggiore mov     r4,r5

         b       ciclo

minore   mov     r3,r5
         b       ciclo

esci     mov     r7,#POSMIN
         str     r3,[r7]
         mov     r8,#VALMAX
         str     r4,[r8]
         end