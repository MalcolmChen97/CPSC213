












.pos 0x100

#c=5
ld $c,r0		#r[0]=address of c
ld $5,r1		#r[1]=5
st r1,(r0)		#store 5 at the address of c

#b=c+10
ld $10,r1		#r[1]=10
ld (r0),r2		#r[2]=value of c
add r2,r1		#r[1]=c+10
ld $b,r3		#r[3]=address of b
st r1,(r3)		#b=c+10

#a[8]=8
ld $a,r1		#r[1]=address of a
ld $8,r2		#r[2]=8
st r2,(r1,r2,4)	       	#a[8]=8

#a[4]=a[4]+4
ld $4,r2		#r[2]=4
ld (r1,r2,4),r4		#r[4]=a[4]
add r2,r4		#r[4]=a[4]+4
st r4,(r1,r2,4)		#a[4]=a[4]+4

#a[c]=a[8]+b+a[b&0x7]
ld (r0),r2		#r[2]=value of c
ld $7,r4		#r[4]=7
ld $8,r5		#r[5]=8
ld (r3),r6		#r[6]=value of b
and r6,r4		#r[4]=b&7
ld (r1,r4,4),r4		#r[4]=a[b & 0x7]
add r6,r4		#r[4]=b+a[b & 0x7]
ld (r1,r5,4),r5		#r[5]=a[8]
add r5,r4		#r[4]=a[b & 0x7]+b+a[8]
st r4,(r1,r2,4)		#a[c]=a[8]+b+a[b&0x7]

halt			#end the program


.pos 0x200
#data area

b: .long 0  	#b
c: .long 0	#c
a: 
	.long 0		#a[0]
	.long 0		#a[1]
	.long 0		#a[2]
	.long 0		#a[3]
	.long 0		#a[4]
	.long 0		#a[5]
	.long 0		#a[6]
	.long 0		#a[7]
	.long 0		#a[8]
	.long 0		#a[9]
