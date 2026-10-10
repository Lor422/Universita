         ;       COMPITO D'ESAME: determinare la posizione del numero più piccolo di una lista
         ;       presente in memoria e il numero più grande nella lista
         ;       inserire i due valori agli indirizzi POSMIN e VALMAX
         ;       indirizzo dell'array memorizzato in memoria all'indirizzo ARR
         ;       lunghezza memorizzata in memoria all'indirizzo LUNG
         ;       gli elementi della lista hanno lunghezza 4 byte e occupano posizioni consecutive


ARR      dcd     5,4,7,9,10,3,2,1
LUNG     dcd     8
POSMIN   fill    4
VALMAX   fill    4

         mov     r1,#LUNG
         ldr     r1,[r1]
         mov     r2,#ARR
         mov     r3,#0 ; per il maggiore
         mov     r4,#0 ; per il minore. due clear
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

maggiore mov     r3,r5
         b       ciclo
minore   mov     r4,r5
         mov     r9,r2
         b       ciclo

esci     mov     r7,#POSMIN
         str     r9,[r7]
         mov     r8,#VALMAX
         str     r3,[r8]
         end
