import org.junit.Test;
import org.junit.Before;
import java.util.ArrayList;
import java.util.Arrays;

import static org.junit.Assert.*;

/**
 * Unit tests for the max heap.
 * @author Joanna Zolnik
 * @version 1.0
 */

public class MaxHeapTest {

    private static final int TIMEOUT = 150;
    private MaxHeap<Integer> heap;

    @Before
    public void setUp() {
        heap = new MaxHeap<>();
    }

    //add method tests
    @Test (timeout = TIMEOUT)
    public void addFirstElement() {
        /*
              1
        */

        heap.add(1);

        assertEquals(1, heap.size());
        Integer[] expected = new Integer[MaxHeap.INITIAL_CAPACITY];
        expected[1] = 1;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }


    @Test (timeout = TIMEOUT)
    public void addSecondElement() {
        /*
                1
               /
              2
              -->
                2
               /
              1
        */

        heap.add(1);
        heap.add(2);

        assertEquals(2, heap.size());
        Integer[] expected = new Integer[MaxHeap.INITIAL_CAPACITY];
        expected[1] = 2;
        expected[2] = 1;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void addThirdElement() {
        /*
                1
               / \
              2   4
              -->
                4
               / \
              1   2
        */

        heap.add(1);
        heap.add(2);
        heap.add(4);

        assertEquals(3, heap.size());
        Integer[] expected = new Integer[MaxHeap.INITIAL_CAPACITY];
        expected[1] = 4;
        expected[2] = 1;
        expected[3] = 2;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void addFourthElement() {
        /* 1,2,4,10

                1
               / \
              2   4
             /
            10
              -->
                  10
                 / \
                4   2
               /
              1
        */

        heap.add(1);
        heap.add(2);
        heap.add(4);
        heap.add(10);

        assertEquals(4, heap.size());
        Integer[] expected = new Integer[MaxHeap.INITIAL_CAPACITY];
        expected[1] = 10;
        expected[2] = 4;
        expected[3] = 2;
        expected[4] = 1;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void addFifthElement() {
        /* enqueue 20,0,6,4,7
           MaxHeap should become

                20
               / \
              7   6
             / \
            0   4
        */

        heap.add(20);
        heap.add(0);
        heap.add(6);
        heap.add(4);
        heap.add(7);

        assertEquals(5, heap.size());
        Integer[] expected = new Integer[MaxHeap.INITIAL_CAPACITY];
        expected[1] = 20;
        expected[2] = 7;
        expected[3] = 6;
        expected[4] = 0;
        expected[5] = 4;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void addSixthElement() {
        /* enqueue 1,2,7,0,9,12
           MaxHeap should become

                 12
               /   \
              7     9
             / \   /
            0   1 2
        */

        heap.add(1);
        heap.add(2);
        heap.add(7);
        heap.add(0);
        heap.add(9);
        heap.add(12);

        assertEquals(6, heap.size());
        Integer[] expected = new Integer[MaxHeap.INITIAL_CAPACITY];
        expected[1] = 12;
        expected[2] = 7;
        expected[3] = 9;
        expected[4] = 0;
        expected[5] = 1;
        expected[6] = 2;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void addSeventhElement() {
        /* enqueue 1,2,7,0,9,12,100
           MaxHeap should become

                100
               /   \
              7     12
             / \   / \
            0   1 2   9
        */

        heap.add(1);
        heap.add(2);
        heap.add(7);
        heap.add(0);
        heap.add(9);
        heap.add(12);
        heap.add(100);

        assertEquals(7, heap.size());
        Integer[] expected = new Integer[MaxHeap.INITIAL_CAPACITY];
        expected[1] = 100;
        expected[2] = 7;
        expected[3] = 12;
        expected[4] = 0;
        expected[5] = 1;
        expected[6] = 2;
        expected[7] = 9;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void addEightElementsVersionOne() {
        /* enqueue 20,15,100,8,0,6,4,200
           MaxHeap should become

                200
                / \
              100  20
              / \   /\
            15  0  6 4
           /
          8
        */

        heap.add(20);
        heap.add(15);
        heap.add(100);
        heap.add(8);
        heap.add(0);
        heap.add(6);
        heap.add(4);
        heap.add(200);

        assertEquals(8, heap.size());
        Integer[] expected = new Integer[MaxHeap.INITIAL_CAPACITY];
        expected[1] = 200;
        expected[2] = 100;
        expected[3] = 20;
        expected[4] = 15;
        expected[5] = 0;
        expected[6] = 6;
        expected[7] = 4;
        expected[8] = 8;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void addEightElementsVersionTwo() {
        /* enqueue 1,2,5,100,40,45,400,10
           MaxHeap should become

                 400
                /   \
               40    100
              / \    / \
            10   5  2   45
           /
          1
        */

        heap.add(1);
        heap.add(2);
        heap.add(5);
        heap.add(100);
        heap.add(40);
        heap.add(45);
        heap.add(400);
        heap.add(10);

        assertEquals(8, heap.size());
        Integer[] expected = new Integer[MaxHeap.INITIAL_CAPACITY];
        expected[1] = 400;
        expected[2] = 40;
        expected[3] = 100;
        expected[4] = 10;
        expected[5] = 5;
        expected[6] = 2;
        expected[7] = 45;
        expected[8] = 1;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    //In resize cases, the backing array should resize to backingArray.length * 2.
    @Test (timeout = TIMEOUT)
    public void addResizeCase() {
        /* backingArray should resize to capacity 26.
           1,2,5,100,40,45,400,10,200,500,12,13,15,17,18,19 (16 elements)
           MaxHeap should become

                   500
                  /   \
               400     100
              / \       / \
            40   200   15  45
           / \   / \   /\   / \
         19  10 5  12 2 13 17 18
        /
       1
        */

        heap.add(1);
        heap.add(2);
        heap.add(5);
        heap.add(100);
        heap.add(40);
        heap.add(45);
        heap.add(400);
        heap.add(10);
        heap.add(200);
        heap.add(500);
        heap.add(12);
        heap.add(13);
        heap.add(15);
        heap.add(17);
        heap.add(18);
        heap.add(19);

        assertEquals(16, heap.size());
        Integer[] expected = new Integer[MaxHeap.INITIAL_CAPACITY * 2];
        expected[1] = 500;
        expected[2] = 400;
        expected[3] = 100;
        expected[4] = 40;
        expected[5] = 200;
        expected[6] = 15;
        expected[7] = 45;
        expected[8] = 19;
        expected[9] = 10;
        expected[10] = 5;
        expected[11] = 12;
        expected[12] = 2;
        expected[13] = 13;
        expected[14] = 17;
        expected[15] = 18;
        expected[16] = 1;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    //MaxHeap method tests
    @Test (timeout = TIMEOUT)
    public void maxHeapOneElement() {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);

        heap = new MaxHeap<>(list);
        assertEquals(1, heap.size());

        Integer[] expected = new Integer[(2 * list.size()) + 1];
        expected[1] = 1;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void maxHeapTwoElements() {
        /*
                 1
               /
              2
            ->
                 2
               /
              1
        */

        ArrayList<Integer> data = new ArrayList<>();
        data.add(1);
        data.add(2);

        heap = new MaxHeap<>(data);

        assertEquals(2, heap.size());

        Integer[] expected = new Integer[5];
        expected[1] = 2;
        expected[2] = 1;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void maxHeapThreeElements() {
        /*
                 1
               /  \
              2    4
            ->
                 4
               /  \
              2    1
        */

        ArrayList<Integer> data = new ArrayList<>();
        data.add(1);
        data.add(2);
        data.add(4);

        heap = new MaxHeap<>(data);

        assertEquals(3, heap.size());

        Integer[] expected = new Integer[7];
        expected[1] = 4;
        expected[2] = 2;
        expected[3] = 1;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void maxHeapFourElements() {
        /*
                   1
                 /  \
                2    4
               /
              7
            ->
                  7
                 / \
                2   4
               /
              1
        */

        ArrayList<Integer> data = new ArrayList<>();
        data.add(1);
        data.add(2);
        data.add(4);
        data.add(7);

        heap = new MaxHeap<>(data);

        assertEquals(4, heap.size());

        Integer[] expected = new Integer[9];
        expected[1] = 7;
        expected[2] = 2;
        expected[3] = 4;
        expected[4] = 1;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void maxHeapFiveElements() {
        /*
                   1
                 /  \
                2    4
               / \
              7  9

            ->
                  9
                 / \
                7   4
               / \
              1   2
        */

        ArrayList<Integer> data = new ArrayList<>();
        data.add(1);
        data.add(2);
        data.add(4);
        data.add(7);
        data.add(9);

        heap = new MaxHeap<>(data);

        assertEquals(5, heap.size());

        Integer[] expected = new Integer[11];
        expected[1] = 9;
        expected[2] = 7;
        expected[3] = 4;
        expected[4] = 1;
        expected[5] = 2;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void maxHeapSixElements() {
        /* 1,2,4,7,9,12

                   1
                 /  \
                2    4
               / \   /
              7  9  12

            ->
                  12
                 /  \
                9    4
               / \   /
              7  2  1
        */

        ArrayList<Integer> data = new ArrayList<>();
        data.add(1);
        data.add(2);
        data.add(4);
        data.add(7);
        data.add(9);
        data.add(12);

        heap = new MaxHeap<>(data);

        assertEquals(6, heap.size());

        Integer[] expected = new Integer[13];
        expected[1] = 12;
        expected[2] = 9;
        expected[3] = 4;
        expected[4] = 7;
        expected[5] = 2;
        expected[6] = 1;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void maxHeapSevenElements() {
        /*
                   1
                 /   \
                2     4
               / \   / \
              7  9  12 15

            ->
                  15
                 /  \
                9    12
               / \   / \
              7  2  1   4
        */

        ArrayList<Integer> data = new ArrayList<>();
        data.add(1);
        data.add(2);
        data.add(4);
        data.add(7);
        data.add(9);
        data.add(12);
        data.add(15);

        heap = new MaxHeap<>(data);

        assertEquals(7, heap.size());

        Integer[] expected = new Integer[15];
        expected[1] = 15;
        expected[2] = 9;
        expected[3] = 12;
        expected[4] = 7;
        expected[5] = 2;
        expected[6] = 1;
        expected[7] = 4;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void maxHeapEightElements() {
        /*
                   1
                 /   \
                2     4
               / \   / \
              7  9  12 15
             /
            13

            ->
                   15
                 /   \
                13    12
               / \   / \
              7  9  1   4
             /
            2
        */

        ArrayList<Integer> data = new ArrayList<>();
        data.add(1);
        data.add(2);
        data.add(4);
        data.add(7);
        data.add(9);
        data.add(12);
        data.add(15);
        data.add(13);

        heap = new MaxHeap<>(data);

        assertEquals(8, heap.size());

        Integer[] expected = new Integer[17];
        expected[1] = 15;
        expected[2] = 13;
        expected[3] = 12;
        expected[4] = 7;
        expected[5] = 9;
        expected[6] = 1;
        expected[7] = 4;
        expected[8] = 2;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void maxHeapNineElements() {

        /* 1,2,4,7,9,12,15,13,20
                   1
                 /   \
                2     4
               / \   / \
              7  9  12 15
             / \
            13 20

            ->
                   20
                 /   \
                13    15
               / \   / \
              7  9  12   4
             /\
            2  1
        */

        ArrayList<Integer> data = new ArrayList<>();
        data.add(1);
        data.add(2);
        data.add(4);
        data.add(7);
        data.add(9);
        data.add(12);
        data.add(15);
        data.add(13);
        data.add(20);

        heap = new MaxHeap<>(data);

        assertEquals(9, heap.size());

        Integer[] expected = new Integer[19];
        expected[1] = 20;
        expected[2] = 13;
        expected[3] = 15;
        expected[4] = 7;
        expected[5] = 9;
        expected[6] = 12;
        expected[7] = 4;
        expected[8] = 2;
        expected[9] = 1;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void maxHeapFifteenElements() {

        /* 1,2,4,7,9,12,15,13,20,30,10,5,0,8,11
                        1
                     /     \
                   2         4
                 /  \       /  \
               7     9     12   15
              / \   /\     /\   /\
            13 20  30 10  5  0 8  11

            ->
                        30
                     /     \
                  20         15
                 /  \       /  \
               13    10    12   11
              / \   /\    / \   / \
             1  7  9  2  5  0  8   4
        */

        ArrayList<Integer> data = new ArrayList<>();
        data.add(1);
        data.add(2);
        data.add(4);
        data.add(7);
        data.add(9);
        data.add(12);
        data.add(15);
        data.add(13);
        data.add(20);
        data.add(30);
        data.add(10);
        data.add(5);
        data.add(0);
        data.add(8);
        data.add(11);

        heap = new MaxHeap<>(data);

        assertEquals(15, heap.size());

        Integer[] expected = new Integer[31];
        expected[1] = 30;
        expected[2] = 20;
        expected[3] = 15;
        expected[4] = 13;
        expected[5] = 10;
        expected[6] = 12;
        expected[7] = 11;
        expected[8] = 1;
        expected[9] = 7;
        expected[10] = 9;
        expected[11] = 2;
        expected[12] = 5;
        expected[13] = 0;
        expected[14] = 8;
        expected[15] = 4;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test (timeout = TIMEOUT)
    public void maxHeapThirty() {
        //thirty elements just because \(._.\)
        /* 1,2,4,7,9,12,15,13,20,30,10,5,0,8,11,31,61,90,3,14,16,17,91,100,87,66,49,44,52,27

                                             1
                                     /                   \
                                   /                      \
                                  /                        \
                                /                           \
                              /                              \
                             /                                \
                            2                                  4
                          /   \                              /   \
                        /      \                           /      \
                       /        \                         /        \
                      /          \                       /          \
                     /            \                     /            \
                    /              \                   /              \
                  7                9                 12               15
                 /\               /\                /\               /\
                /  \             /  \              /  \             /  \
               /    \           /    \            /    \           /    \
             13     20        30      10         5      0         8      11
            /\      /\       /\      /\        /\       /\       /\      /
           /  \    /  \     /  \    /  \      /  \     /  \     /  \    /
          31  61  90   3   14  16  17  91   100  87   66  49  44   52  27

            ->

                                             100
                                     /                   \
                                   /                      \
                                  /                        \
                                /                           \
                              /                              \
                             /                                \
                            91                                 87
                          /   \                              /   \
                        /      \                           /      \
                       /        \                         /        \
                      /          \                       /          \
                     /            \                     /            \
                    /              \                   /              \
                  90               30                66               52
                 /\               /\                /\               / \
                /  \             /  \              /  \             /   \
               /    \           /    \            /    \           /     \
             61     20        16      17         12     49        44      27
            /\      /\       /\      /\         /\       /\       /\      /
           /  \    /  \     /  \    /  \       /  \     /  \     /  \    /
          31  13  7   3   14   2   9   10     5   4    0    1   15   8  11


        */

        ArrayList<Integer> data = new ArrayList<>();
        data.add(1);
        data.add(2);
        data.add(4);
        data.add(7);
        data.add(9);
        data.add(12);
        data.add(15);
        data.add(13);
        data.add(20);
        data.add(30);
        data.add(10);
        data.add(5);
        data.add(0);
        data.add(8);
        data.add(11);
        data.add(31);
        data.add(61);
        data.add(90);
        data.add(3);
        data.add(14);
        data.add(16);
        data.add(17);
        data.add(91);
        data.add(100);
        data.add(87);
        data.add(66);
        data.add(49);
        data.add(44);
        data.add(52);
        data.add(27);

        heap = new MaxHeap<>(data);

        assertEquals(30, heap.size());

        Integer[] expected = new Integer[61];
        expected[1] = 100;
        expected[2] = 91;
        expected[3] = 87;
        expected[4] = 90;
        expected[5] = 30;
        expected[6] = 66;
        expected[7] = 52;
        expected[8] = 61;
        expected[9] = 20;
        expected[10] = 16;
        expected[11] = 17;
        expected[12] = 12;
        expected[13] = 49;
        expected[14] = 44;
        expected[15] = 27;
        expected[16] = 31;
        expected[17] = 13;
        expected[18] = 7;
        expected[19] = 3;
        expected[20] = 14;
        expected[21] = 2;
        expected[22] = 9;
        expected[23] = 10;
        expected[24] = 5;
        expected[25] = 4;
        expected[26] = 0;
        expected[27] = 1;
        expected[28] = 15;
        expected[29] = 8;
        expected[30] = 11;

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    //remove method tests
    @Test
    public void removeFromOneElement() {
        /*
        Wanna see a magic trick? I'm going to make this 1 disappear
              1
            ->


            Poof! It's gone!
        */

        heap.add(1);

        assertEquals(1, heap.size());

        Integer[] expected = new Integer[13];
        expected[1] = null;

        assertEquals((Integer) 1, (Integer) heap.remove());
        assertEquals(0, heap.size());

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test
    public void removeFromTwoElements() {
        /*
                2
               /
              1
            ->
            1
        */
        heap.add(1);
        heap.add(2);

        assertEquals(2, heap.size());

        Integer[] expected = new Integer[13];
        expected[1] = 1;

        assertEquals((Integer) 2, (Integer) heap.remove());
        assertEquals(1, heap.size());

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test
    public void removeFromThreeElements() {
        /*
                2
               / \
              1   0
            ->
                1
               /
              0
        */

        heap.add(2);
        heap.add(1);
        heap.add(0);

        assertEquals(3, heap.size());

        Integer[] expected = new Integer[13];
        expected[1] = 1;
        expected[2] = 0;

        assertEquals((Integer) 2, (Integer) heap.remove());

        assertEquals(2, heap.size());

        //print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test
    public void removeFromFourElements() {
        /* 2,1,0,4

                  4
                 / \
                2   0
               /
              1
            ->
                2
               / \
              1   0
        */

        heap.add(4);
        heap.add(2);
        heap.add(0);
        heap.add(1);

        assertEquals(4, heap.size());

        Integer[] expected = new Integer[13];
        expected[1] = 2;
        expected[2] = 1;
        expected[3] = 0;

        assertEquals((Integer) 4, (Integer) heap.remove());
        assertEquals(3, heap.size());

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test
    public void removeFromFiveElements() {
        /* 2,1,0,4,10

                  10
                 / \
                4   0
               / \
              1  2
            ->
                4
               / \
              2   0
             /
            1
        */

        heap.add(10);
        heap.add(4);
        heap.add(0);
        heap.add(1);
        heap.add(2);

        assertEquals(5, heap.size());

        Integer[] expected = new Integer[13];
        expected[1] = 4;
        expected[2] = 2;
        expected[3] = 0;
        expected[4] = 1;

        assertEquals((Integer) 10, (Integer) heap.remove());
        assertEquals(4, heap.size());

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }

    @Test
    public void removeFromTenElements() {
        /* 2,1,0,4,10,12,15,9,8,5

                   15
                 /   \
                9    12
               / \    /\
              8  5   0 10
             /\  /
            1 4 2
            ->
                   12
                 /   \
                9    10
               / \    /\
              8  5   0  2
             /\
            1 4
        */
        heap.add(15);
        heap.add(9);
        heap.add(12);
        heap.add(8);
        heap.add(5);
        heap.add(0);
        heap.add(10);
        heap.add(1);
        heap.add(4);
        heap.add(2);

        assertEquals(10, heap.size());

        Integer[] expected = new Integer[13];
        expected[1] = 12;
        expected[2] = 9;
        expected[3] = 10;
        expected[4] = 8;
        expected[5] = 5;
        expected[6] = 0;
        expected[7] = 2;
        expected[8] = 1;
        expected[9] = 4;

        assertEquals((Integer) 15, (Integer) heap.remove());
        assertEquals(9, heap.size());

        //"uncomment" below to print actual array
        //System.out.println(Arrays.toString(heap.getBackingArray()));
        assertArrayEquals(expected, heap.getBackingArray());
    }
}