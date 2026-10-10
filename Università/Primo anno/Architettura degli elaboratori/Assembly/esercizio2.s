RISA   dcd     0
RISS   dcd     0
       mov     r1,#9
       mov     r2,#1
       adds    r3,r1,r2
       mov     r4,#RISA
       str     r3,[r4]
       subs    r3,r1,r2
       mov     r4,#RISS
       str     r3,[r4]