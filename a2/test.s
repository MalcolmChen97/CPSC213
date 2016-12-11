ldi:  ld $0x11223344, r0
      ld $0x11223348, r7


ldbo: ld $0x04, r0
        ld 4(r0), r1

loid:   ld $0x01,r3
        ld (r0,r3,4),r2

SBO:    ld $0x11111111,r4
        st r4,4(r0)

STI:    ld $0x12345678,r4
        st r4,(r0,r3,4)

rmove:  mov r0,r1

add:    add r3,r1

and:    and r3,r1

inc:    inc r3

inca:   inca r3

dec:    dec r3

deca:    deca r3

not:    ld $0xffffffff,r4
        not r4

shift:  shl $0x1,r3
        shl $0xffffffff,r3
        shr $0x1,r3
