
.pos 0x100
ld $i,r1
ld (r1),r1  #r1=value of i
ld $val,r2  #r2=address of val
ld $t,r3    #r3=address of t
ld $j,r4    #r4=address of j
ld (r2),r2  #r2=address of m(which is the address of the block malloced)
ld (r2,r1,4),r5 #r5=val[i]
st r5,(r3)  #t=val[i]
ld (r4),r4  #r4=value of j
ld (r2,r4,4),r5 #r5=val[j]
st r5,(r2,r1,4) #val[i] = val[j]
ld (r3),r6    #r6=t
st r6,(r2,r4,4) #val[j] = t

halt





.pos 0x200
#data area
i:  .long 0
j:  .long 1
val:.long m
t:  .long 7
m:  .long 0
.long 1
.long 2
.long 3
.long 4
