.pos 0x0
                 ld   $0x1028, r5         #initialise stack
                 ld   $0xfffffff4, r0     #r0=-12
                 add  r0, r5              #allocate frame on stack
                 ld   $0x200, r0          #r0= 0x200
                 ld   0x0(r0), r0         #load 0x200
                 st   r0, 0x0(r5)         #store 0x200 into stack
                 ld   $0x204, r0          #r0= 0x204
                 ld   0x0(r0), r0         #load 0x204
                 st   r0, 0x4(r5)         #store 0x204 into stack
                 ld   $0x208, r0          #r0= 0x208
                 ld   0x0(r0), r0         #load 0x208
                 st   r0, 0x8(r5)         #store 0x208 into stack
                 gpc  $6, r6              # set return address    
                 j    0x300               # call 0x300(function foo)
                 ld   $0x20c, r1          #r1=0x20c
                 st   r0, 0x0(r1)         #store output into 0x20c
                 halt                     
.pos 0x200
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
.pos 0x300                                
                 ld   0x0(r5), r0         #load arg0
                 ld   0x4(r5), r1         #load arg1
                 ld   0x8(r5), r2         #load arg2
                 ld   $0xfffffff6, r3     #r3=-10
                 add  r3, r0              #add -10 to r0(r0=arg0-10)
                 mov  r0, r3              #r3=r0
                 not  r3                  #!r3
                 inc  r3                  #-r3
                 bgt  r3, L6              #if -r3>0(10>arg0), jump to L6
                 mov  r0, r3              #r3=r0
                 ld   $0xfffffff8, r4     #r4=-8
                 add  r4, r3              #r3=arg0-8-10
                 bgt  r3, L6              #if r3>0(arg0>18), jump to L6
                 ld   $0x400, r3          #re= 0x400
                 j    *(r3, r0, 4)        #jump to 0x400[arg0-10]
.pos 0x330
                 add  r1, r2              #r2=r1+r2(c=b+c)
                 br   L7                  #branch L7
                 not  r2                  #!r2
                 inc  r2                  #r2=-r2
                 add  r1, r2              #r2=r1+r2(c=b-c)
                 br   L7                  #branch L7
                 not  r2                  #!r2
                 inc  r2                  #r2=-r2
                 add  r1, r2              #r2=r1+r2
                 bgt  r2, L0              #if r2>=0,go to L0
                 ld   $0x0, r2            #r2=0
                 br   L1                  #branch L1
L0:              ld   $0x1, r2            #r2=1
L1:              br   L7                  #branch L7
                 not  r1                  #!r1
                 inc  r1                  #r1=-r1
                 add  r2, r1              #r1=r2+r1(b=c-b)
                 bgt  r1, L2              #if r1>=0, go to L2
                 ld   $0x0, r2            #r2=0
                 br   L3                  #branch L3
L2:              ld   $0x1, r2            #r2=1
L3:              br   L7                  #branch L7
                 not  r2                  #!r2
                 inc  r2                  #r2=-r2
                 add  r1, r2              #r2=r1+r2
                 beq  r2, L4              #if r2=0(b=c), go to L4
                 ld   $0x0, r2            #r2=0
                 br   L5                  #branch L5
L4:              ld   $0x1, r2            #r2=1
L5:              br   L7                  #branch L7
L6:              ld   $0x0, r2            #r2=0(c=0)
                 br   L7                  #branch L7
L7:              mov  r2, r0              #r0=r2
                 j    0x0(r6)             #return
.pos 0x400
                 .long 0x00000330         
                 .long 0x00000384         
                 .long 0x00000334         
                 .long 0x00000384         
                 .long 0x0000033c         
                 .long 0x00000384         
                 .long 0x00000354         
                 .long 0x00000384         
                 .long 0x0000036c         
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
