package arch.sm213.machine.student;
import machine.AbstractMainMemory;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;
/**
 * Created by MalcolmChen on 2016-09-20.
 */
public class MainMemoryTest {
    private MainMemory memory;

    @Before
    public void setUp() throws Exception {
        memory = new MainMemory(64);
    }


    @Test
    public void isAccessAligned() throws Exception {
        assertTrue(memory.isAccessAligned(32,2));
        assertTrue(memory.isAccessAligned(32,4));
        assertTrue(memory.isAccessAligned(32,8));
        assertTrue(memory.isAccessAligned(32,16));
        //test of address that is 0
        assertTrue(memory.isAccessAligned(0,2));
        assertTrue(memory.isAccessAligned(0,3));
        assertTrue(memory.isAccessAligned(0,32));
        //test of memory that is not aligned
        assertFalse(memory.isAccessAligned(3,2));
        assertFalse(memory.isAccessAligned(5,3));
        assertFalse(memory.isAccessAligned(7,6));
        assertFalse(memory.isAccessAligned(34,9));
        assertFalse(memory.isAccessAligned(1,2));
    }

    @Test
    public void bytesToInteger() throws Exception {
        //test of 0
        assertEquals(0, memory.bytesToInteger((byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00));
        //test of -1
        assertEquals(-1, memory.bytesToInteger((byte) 0xff, (byte) 0xff, (byte) 0xff, (byte) 0xff));
        //test of 1
        assertEquals(1, memory.bytesToInteger((byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x01));

        assertEquals(1234, memory.bytesToInteger((byte) 0x00, (byte) 0x00, (byte) 0x04, (byte) 0xd2));


        assertEquals(-10000, memory.bytesToInteger((byte) 0xff, (byte) 0xff, (byte) 0xd8, (byte) 0xf0));

    }

    @Test
    public void integerToBytes() throws Exception {
        byte[] testbytes1 = new byte[] {(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00};
        byte[] testbytes2 = new byte[] {(byte) 0xff, (byte) 0xff, (byte) 0xff, (byte) 0xff};
        byte[] testbytes3 = new byte[] {(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x01};
        byte[] testbytes4 = new byte[] {(byte) 0x00, (byte) 0x00, (byte) 0x04, (byte) 0xd2};
        byte[] testbytes5 = new byte[] {(byte) 0xff, (byte) 0xff, (byte) 0xd8, (byte) 0xf0};
        int testInteger1=0;
        int testInteger2=-1;
        int testInteger3=1;
        int testInteger4=1234;
        int testInteger5=-10000;
        assertArrayEquals(testbytes1, memory.integerToBytes(testInteger1));
        assertArrayEquals(testbytes2, memory.integerToBytes(testInteger2));
        assertArrayEquals(testbytes3, memory.integerToBytes(testInteger3));
        assertArrayEquals(testbytes4, memory.integerToBytes(testInteger4));
        assertArrayEquals(testbytes5, memory.integerToBytes(testInteger5));
    }

    @Test
    public void TestSetAndGet() throws Exception {
        byte[] testbytes1 = new byte[] {(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00};
        byte[] testbytes2 = new byte[] {(byte) 0xff, (byte) 0xff, (byte) 0xff, (byte) 0xff};
        memory.set(4, testbytes1);
        assertArrayEquals(testbytes1, memory.get(4, testbytes1.length));
        //test of overwriting
        memory.set(5,testbytes2);
        assertArrayEquals(testbytes2, memory.get(5, testbytes2.length));
    }

    @Test (expected = AbstractMainMemory.InvalidAddressException.class)
    public void testGetExce1() throws AbstractMainMemory.InvalidAddressException {

        memory.get(-1, 2);

    }
    @Test (expected = AbstractMainMemory.InvalidAddressException.class)
    public void testGetExce2() throws AbstractMainMemory.InvalidAddressException {
        //test of boundary
        memory.get(64, 1);

    }

    @Test (expected = AbstractMainMemory.InvalidAddressException.class)
    public void testSetExce() throws AbstractMainMemory.InvalidAddressException {
        byte[] testbytes1 = new byte[] {(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00};
        //test of boundary
        memory.set(61,testbytes1);


    }
    @Test (expected = AbstractMainMemory.InvalidAddressException.class)
    public void testSetExce2() throws AbstractMainMemory.InvalidAddressException {
        byte[] testbytes1 = new byte[] {(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00};

        memory.set(63,testbytes1);


    }

}