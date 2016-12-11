.pos 0x0
                 ld   $sb, r5
                 inca r5                    #r5=address of word after stack
                 gpc  $6, r6                #r6=pc+6
                 j    main               #call the function in address 0x300
                 halt                     


.pos 0x200
main:
                 deca r5
                 st r6,(r5)
                 gpc $6,r6
                 j    copy
                 ld   (r5),r6
                 inca r5
                 j    (r6)

.pos 0x300
copy:            ld   $0xfffffff0, r0     #r0=-16=-(size of caller part of next frame
                 add  r0, r5              #allocate caller part of the next frame
                 st   r6, 0xc(r5)         #save ra on the stack
                 ld   $0, r0            #r0=1=value of a0
                 st   r0, 0x8(r5)         #save the value of a0 to stack
                ld $src,r1
loop:

ld (r1,r0,4),r7
beq r7,end
st r7,(r5,r0,4)
inc r0
br loop



end:
ld $0,r2
st r2,(r5,r0,4)
                ld   0xc(r5), r6         #r6=return address
                 ld   $0x10, r0            #r0=16
                 add  r0, r5              #deallocate callee part of the main function
                 j    0x0(r6)            #return to main
.pos 0x1000
src:
                 .long 0x00000001
                 .long 0x00000001
.long 0x00000001
.long 0x00001014
.long 0x0
.long 0x0000ffff
.long 0xffff0100
.long 0xffffffff
.long 0x0200ffff
.long 0xffff0300
.long 0xffffffff
.long 0x0400ffff
.long 0xffff0500
.long 0xffffffff
.long 0x0600ffff
.long 0xffff0700
.long 0xffffffff
.long 0xf0000000

.pos 0x8000
# These are here so you can see (some of) the stack contents.
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
sb: .long 0
