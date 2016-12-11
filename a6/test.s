ld $0x0, r0         # r0 = i = 0
ld $0x0, r2         # r2 = haha = 0
ld $0xfffffffb, r3  # r3 = -5
ld $5,r5            # r5=5

main:
mov r0, r4    # r4 = i
add r3, r4    # r4 = -5
beq r4, end   # end if i=5
bgt r4, end   # end if i>5
add r4,r2
add r5,r2     # haha=haha+i
gpc $6, r6    # r6 = return address
j add2        # goto add2
inc r0        # i++
br main       # goto main

add2:
ld $2,r7      # r7=2
add r7, r2    # r2 = haha+2
j 0(r6)       # return to caller

end:
ld $haha, r1  # r1 = address of haha
ld $i,r3      # r3=address of i
st r2, 0(r1)  # haha=r2
st r0, 4(r1)  # i=r0

halt

.pos 0x1000
haha:               .long 0x00000000
i:               .long 0x00000000


#void main(){
#int haha=0;
#for(int i=0;i<5;i++){
#    haha+=i;
#    add2(haha);
#}
#
#}
#
#void add2(int a){
#    a+=2;
#}
