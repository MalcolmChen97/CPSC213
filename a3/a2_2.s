


.pos 0x100

#a[i] = a[i+1] + b[i+2];
ld $1,r0		#r0=1
ld $2,r1		#r1=2
ld $i,r2		#r2=address of i
ld (r2),r2		#r2=value of i
ld $a,r3		#r3=address of a
ld $b,r4		#r4=address of b
add r2,r0		#r0=i+1
add r2,r1		#r1=i+2
ld (r3,r0,4),r0 	#r0=a[i+1]
ld (r4,r1,4),r1 	#r1=b[i+2]
add r0,r1		#r1=a[i+1]+b[i+2]
st r1,(r3,r2,4)	 	#a[i] = a[i+1] + b[i+2]

#d[i] = a[i] + b[i];
ld $d,r0		#r0=address of d
ld (r0),r0		#r0=addess of the address pointed by d
ld (r3,r2,4),r1		#r1=a[i]
ld (r4,r2,4),r5		#r5=b[i]
add r1,r5		#r5=a[i]+b[i]
st r5,(r0,r2,4)		#d[i] = a[i] + b[i]

#d[i] = a[b[i]] + b[a[i]];
ld (r4,r2,4),r5		#r5=b[i]
ld (r3,r5,4),r5		#r5=a[b[i]]
ld (r4,r1,4),r1		#r1=b[a[i]]
add r1,r5		#r5=a[b[i]] + b[a[i]]
st r5,(r0,r2,4)		#d[i] = a[b[i]] + b[a[i]]

#d[b[i]] = b[a[i & 3] & 3] - a[b[i & 3] & 3] + d[i];
ld $3,r1		#r1=3
ld $3,r6		#r6=3
and r2,r6		#r6=i&3
ld (r4,r6,4),r7		#r7=b[i&3]
and r1,r7		#r7=b[i&3]&3
ld (r3,r7,4),r7		#r7=a[b[i&3]&3]
not r7			#r7=!r7
inc r7			#r7=-a[b[i&3]&3]
add r7,r5		#r5=-a[b[i & 3] & 3] + d[i]
ld (r3,r6,4),r7		#r7=a[i&3]
and r1,r7		#r7=a[i&3]&3
ld (r4,r7,4),r7		#r7=b[a[i&3]&3]
add r7,r5		#r5=b[a[i & 3] & 3] - a[b[i & 3] & 3] + d[i]
ld (r4,r2,4),r7		#r7=b[i]
st r5,(r0,r7,4)		#d[b[i]] = b[a[i & 3] & 3] - a[b[i & 3] & 3] + d[i]
halt

.pos 0x200
#data area
a:
.long 0		#a[0]=0
.long 11	#a[1]=11
.long 2		#a[2]=2
.long 0		#a[3]=0
.long 1		#a[4]=1
.long 2		#a[5]=2
.long 0		#a[6]=0
.long 1		#a[7]=1

b:
.long 2		#a[0]=2
.long 12	#a[1]=12
.long 0		#a[2]=0
.long 2		#a[3]=2
.long 1		#a[4]=1
.long 0		#a[5]=0
.long 2		#a[6]=2
.long 1		#a[7]=1

c:
.long 99	#a[0]=99
.long 6		#a[1]=6
.long 2		#a[2]=2
.long 1		#a[3]=1
.long 0		#a[4]=0
.long 2		#a[5]=2
.long 1		#a[6]=1
.long 0		#a[7]=0

i:
.long 5		#i=5

d:
.long c		#d=c