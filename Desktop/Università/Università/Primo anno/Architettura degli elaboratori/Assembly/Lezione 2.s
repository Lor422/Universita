numa      equ     9
numb      equ     1;equ è una dichiarazione di variabile da usare nel programma
risultati fill    8;riserviamo 8 byte
          mov     r1,#numa
          mov     r2,#numb
          add     r3,r1,r2
          sub     r4,r1,r2
          mov     r5,#risultati
          str     r3,[r5]
          str     r4,[r5,#4];indirizzamento per spiazzzamento, shifta il
          ;posto  in cui viene inserito il numero di quando indicato
          ;invece di modificare il valore di r5
          ;i      quadrati in basso a destra sono bit di esito dei salti, e sono raggruppati in un apposito
          ;registro nel processore
          ;ADDS   E SUBS fanno le stesse cose di add e sub ma aggiornano i bit di esito

          ;Possiamo usare un ciclo per semplificare la somma
          ;n=10   elementi,Prendi due elementi, li sommi, controlli se ne hai altri da sommare
          ;e      continui.
          ;
          ;n=4
          ;mov    r1,n
          ;ciclo  mov r2,[r3]
          ;add    r3,r3,r2
          ;sub    r1,r1,#1
          ;branch_if_[r1]>0 ciclo (salta all'etichetta ciclo)
          ;str    r3,D

lista     dcd     1,2,3,4
dim       dcd     4
risultato fill    4

          mov     r1,#dim
          ldr     r1,[r1]
          mov     r2,#lista
          mov     r4,#0
ciclo     ldr     r3,[r2]
          add     r4,r4,r3
          add     r2,r2,#4;per puntare all'elemento successivo nella lista
          subs    r1,r1,#1
          bgt     ciclo;controllo ciclo, controlla bit di esito
          mov     r7,#risultato
          str     r4,[r7]


