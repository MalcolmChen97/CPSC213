ld $s, r0         # r0 = address of s
ld $i, r1         # r1 = address of i
ld $a, r2         # r2 = address of a
ld $0xfffffffb, r3  # r3 = -5

main:
ld $0,r4
ld (r0),r6      #r6=s
st r4,(r1)
ld (r1),r1    # r1=i=0
mov r1, r4    # r4 = i=0
add r3, r4    # r4 = -5

loop:

beq r4, end   # end if i=5
bgt r4, end   # end if i>5
ld (r2,r1,4),r5  #r5=a[i]
mov r5,r7      #r7=r5
not r7
inc r7
beq r7,haha
bgt r7,haha      #end if a[i]<0

add r5,r6       #r6=s+a[i]
inc r1
inc r4
br loop


haha:
inc r1
inc r4
br loop

end:

st r6, 0(r0)


halt

.pos 0x1000
s:               .long 0x00000000
i:               .long 0x0000000a
a:               .long 10
                 .long 0xffffffe2
                 .long 0xfffffff4
                 .long 4
                 .long 8



