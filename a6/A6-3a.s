.pos 0x0
                 ld   $sb, r5               #r5=the address of the last word of the stack
                 inca r5                    #r5=address of word after stack
                 gpc  $6, r6                #r6=pc+6
                 j    0x300                 #call the function in address 0x300
                 halt                     
.pos 0x100
                 .long 0x00001000         
.pos 0x200
                 ld   0x0(r5), r0          #r0=b0
                 ld   0x4(r5), r1         #r1=b1
                 ld   $0x100, r2          #r2=0x100
                 ld   0x0(r2), r2         #r2=0x1000
                 ld   (r2, r1, 4), r3     #r3=array[r1]
                 add  r3, r0              #r0=array[r1]+b0
                 st   r0, (r2, r1, 4)     #array[r1]=array[r1]+b0
                 j    0x0(r6)             #return
.pos 0x300
                 ld   $0xfffffff4, r0     #r0=-12=-(size of caller part of next frame
                 add  r0, r5              #allocate caller part of the next frame
                 st   r6, 0x8(r5)         #save ra on the stack
                 ld   $0x1, r0            #r0=1=value of a0
                 st   r0, 0x0(r5)         #save the value of a0 to stack
                 ld   $0x2, r0            #r0=2=value of a1
                 st   r0, 0x4(r5)         #save the value of a1 to stack
                 ld   $0xfffffff8, r0     #r0=-8=-size of caller part of another frame
                 add  r0, r5              #allocate caller part of another frame
                 ld   $0x3, r0            #r0=3=value of b0
                 st   r0, 0x0(r5)         #save the value of b0 to stack
                 ld   $0x4, r0            #r0=4=value of b1
                 st   r0, 0x4(r5)         #save the value of b1 to stack
                 gpc  $6, r6              #r6=pc+6
                 j    0x200               #call to the function in the address 0x200
                 ld   $0x8, r0            #r0=8
                 add  r0, r5              #deallocate caller parts of another frame
                 ld   0x0(r5), r1         #r1=a0=1
                 ld   0x4(r5), r2         #r2=a1=2
                 ld   $0xfffffff8, r0     #r0=-8
                 add  r0, r5              #allocate 3rd frame
                 st   r1, 0x0(r5)         #save a0 to the stack
                 st   r2, 0x4(r5)         #save a1 to the stack
                 gpc  $6, r6              #r6=pc+6
                 j    0x200               #call to function in the address 0x200
                 ld   $0x8, r0            #r0=8
                 add  r0, r5              #deallocate caller parts of the frame
                 ld   0x8(r5), r6         #r6=return address
                 ld   $0xc, r0            #r0=12
                 add  r0, r5              #deallocate callee part of the main function
                 j    0x0(r6)            #return to main
.pos 0x1000
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
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
