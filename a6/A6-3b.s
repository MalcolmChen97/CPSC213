.pos 0x100
start:
    ld $sb, r5 #r5=the address of the last word of the stack
    inca    r5 #r5=address of word after stack
    gpc $6, r6 #r6=pc+6
    j main #call the main function
    halt

f:
    deca r5 #allocate stack frame
    ld $0, r0 #r0=b=0
    ld 4(r5), r1 #r1=a
    ld $0x80000000, r2 #r2=0x80000000
f_loop:
    beq r1, f_end #if a=0, then call to function f_end
    mov r1, r3 #r3=a
    and r2, r3 #r3= c =a & 0x80000000
    beq r3, f_if1 #if c=0, then call to function f_if1
    inc r0 #r0=b+1
f_if1:
    shl $1, r1 #shift r1 left by 1
    br f_loop #call to function f_loop
f_end:
    inca r5 #deallocate stack pointer for f
    j(r6) #return to main_loop

main:
    deca r5 #allocate frame in the stack
    deca r5 #decrease stack pointer 4 bytes
    st r6, 4(r5) #save return address into stack
    ld $8, r4 #r4=8
main_loop:
    beq r4, main_end #call to the function msin_end if r4=0
    dec r4 #r4=r4-1
    ld $x, r0 #r0=&x
    ld (r0,r4,4), r0 #r0=x[a]
    deca r5 #decrease stack pointer 
    st r0, (r5) #save the valve of r0 to stack
    gpc $6, r6 #r6=pc+6(set return address)
    j f #call to the function f
    inca r5 #deallocate caller part of the frame 
    ld $y, r1 #r1=&y
    st r0, (r1,r4,4) #y[a]=f(x[a])
    br main_loop #call to function main_loop
main_end:
    ld 4(r5), r6 #set return address
    inca r5 #increase stack pointer
    inca r5 #dealloacate callee part of the frame
    j (r6) #return

.pos 0x2000
x:
    .long 1             #x[0]
    .long 2             #x[1]
    .long 3             #x[2]
    .long 0xffffffff    #x[3]
    .long 0xfffffffe    #x[4]
    .long 0             #x[5]
    .long 184           #x[6]
    .long 340057058     #x[7]

y:
    .long 0             #y[0]
    .long 0             #y[1]
    .long 0             #y[2]
    .long 0             #y[3]
    .long 0             #y[4]
    .long 0             #y[5]
    .long 0             #y[6]
    .long 0             #y[7]

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

