import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;


/**
 * Unit tests for the binary search tree.
 * @author Joanna Zolnik
 * @version 1.0
 */

public class BSTTest {

    private static final int TIMEOUT = 150;
    private BST<Integer> bst;


    @Before
    public void setUp() {
        bst = new BST<>();
    }


    //add() method tests
    @Test
    public void addRoot() {
        //case of setting a single node as the root

        bst.add(0);
        assertEquals((Integer) 0, bst.getRoot().getData());
        assertEquals(1, bst.size());
    }

    @Test
    public void addOneNode() {
        //case of adding right child of the root
        //size should become 2

        bst.add(0);
        bst.add(1);

        /*
        0
         \
          1
         */

        assertEquals((Integer) 0, bst.getRoot().getData());
        assertEquals((Integer) 1, bst.getRoot().getRight().getData());
        assertEquals(2, bst.size());
    }

    @Test
    public void addTwoNodes() {
        //case of adding left child to the root
        //size should become 2

        bst.add(1);
        bst.add(0);

        /*
          1
         /
        0
         */

        assertEquals((Integer) 1, bst.getRoot().getData());
        assertEquals((Integer) 0, bst.getRoot().getLeft().getData());
        assertEquals(2, bst.size());
    }

    @Test
    public void addSameData() {
        //try adding a node with the same data
        //there should be no change in the structure and in the size

        bst.add(1);
        bst.add(1);

        /*
            1
         */

        assertEquals((Integer) 1, bst.getRoot().getData());
        assertNull(bst.getRoot().getRight());
        assertNull(bst.getRoot().getLeft());

        assertEquals(1, bst.size());
    }


    @Test
    public void addThreeNodes() {
        //case of adding left child to the root
        //size should become 3

        bst.add(1);
        bst.add(0);
        bst.add(2);

        /*
                  1
                 / \
                0   2
         */

        assertEquals((Integer) 1, bst.getRoot().getData());
        assertEquals((Integer) 0, bst.getRoot().getLeft().getData());
        assertEquals((Integer) 2, bst.getRoot().getRight().getData());
        assertEquals(3, bst.size());
    }


    @Test
    public void addThreeNodesRight() {
        //size should be 3

        bst.add(1);
        bst.add(2);
        bst.add(3);

        /*
              1
               \
                2
                 \
                  3
         */

        assertEquals((Integer) 1, bst.getRoot().getData());
        assertEquals((Integer) 2, bst.getRoot().getRight().getData());
        assertEquals((Integer) 3, bst.getRoot().getRight().getRight().getData());
        assertEquals(3, bst.size());
    }

    @Test
    public void addThreeNodesLeft() {
        bst.add(3);
        bst.add(2);
        bst.add(1);

        /*
                   3
                  /
                 2
                /
               1
         */

        assertEquals((Integer) 3, bst.getRoot().getData());
        assertEquals((Integer) 2, bst.getRoot().getLeft().getData());
        assertEquals((Integer) 1, bst.getRoot().getLeft().getLeft().getData());
        assertEquals(3, bst.size());
    }


    @Test
    public void addFourNodes() {
        bst.add(3);
        bst.add(2);
        bst.add(1);
        bst.add(5);
        bst.add(4);
        bst.add(7);

        /*
               3
              / \
             2   5
            /    /\
           1    4  7

         */

        assertEquals((Integer) 3, bst.getRoot().getData());
        assertEquals((Integer) 2, bst.getRoot().getLeft().getData());
        assertEquals((Integer) 1, bst.getRoot().getLeft().getLeft().getData());
        assertEquals((Integer) 5, bst.getRoot().getRight().getData());
        assertEquals((Integer) 7, bst.getRoot().getRight().getRight().getData());
        assertEquals((Integer) 4, bst.getRoot().getRight().getLeft().getData());
        assertEquals(6, bst.size());
    }

    @Test
    public void addTenNodes() {

        bst.add(10);
        bst.add(8);
        bst.add(20);
        bst.add(5);
        bst.add(9);
        bst.add(12);
        bst.add(23);
        bst.add(1);
        bst.add(11);
        bst.add(25);

        /*
                  10
                /   \
               8     20
              / \    / \
             5  9  12  23
            /      /     \
           1      11     25

         */


        assertEquals((Integer) 10, bst.getRoot().getData());
        //left subtree
        assertEquals((Integer) 8, bst.getRoot().getLeft().getData());
        assertEquals((Integer) 5, bst.getRoot().getLeft().getLeft().getData());
        assertEquals((Integer) 1, bst.getRoot().getLeft().getLeft().getLeft().getData());
        assertEquals((Integer) 9, bst.getRoot().getLeft().getRight().getData());

        //right subtree
        assertEquals((Integer) 20, bst.getRoot().getRight().getData());
        assertEquals((Integer) 12, bst.getRoot().getRight().getLeft().getData());
        assertEquals((Integer) 11, bst.getRoot().getRight().getLeft().getLeft().getData());
        assertEquals((Integer) 23, bst.getRoot().getRight().getRight().getData());
        assertEquals((Integer) 25, bst.getRoot().getRight().getRight().getRight().getData());

        assertEquals(10, bst.size());
    }

    @Test
    public void addDataAlreadyInBST() {
        //add data into the bst that is already in the bst

        bst.add(10);
        bst.add(8);
        bst.add(20);
        bst.add(5);
        bst.add(9);
        bst.add(12);
        bst.add(23);
        bst.add(1);
        bst.add(11);
        bst.add(25);

        bst.add(12);
        bst.add(5);
        bst.add(20);

        /*
                  10
                /   \
               8     20
              / \    / \
             5  9  12  23
            /      /     \
           1      11     25
         */

        assertEquals((Integer) 10, bst.getRoot().getData());
        //left subtree
        assertEquals((Integer) 8, bst.getRoot().getLeft().getData());
        assertEquals((Integer) 5, bst.getRoot().getLeft().getLeft().getData());
        assertEquals((Integer) 1, bst.getRoot().getLeft().getLeft().getLeft().getData());
        assertEquals((Integer) 9, bst.getRoot().getLeft().getRight().getData());

        //right subtree
        assertEquals((Integer) 20, bst.getRoot().getRight().getData());
        assertEquals((Integer) 12, bst.getRoot().getRight().getLeft().getData());
        assertEquals((Integer) 11, bst.getRoot().getRight().getLeft().getLeft().getData());
        assertEquals((Integer) 23, bst.getRoot().getRight().getRight().getData());
        assertEquals((Integer) 25, bst.getRoot().getRight().getRight().getRight().getData());

        assertEquals(10, bst.size());
    }


    //get() method tests
    @Test
    public void getRoot() {
        //get the data from the root

        bst.add(5);

        /*
        5
         */

        assertEquals((Integer) 5, bst.getRoot().getData());
        assertEquals((Integer) 5, bst.get(5));
    }


    @Test
    public void getRightChildNode() {
        bst.add(5);
        bst.add(7);

        /*
        5
         \
          7
         */

        assertEquals((Integer) 5, bst.getRoot().getData());
        assertEquals((Integer) 5, bst.get(5));

        assertEquals((Integer) 7, bst.getRoot().getRight().getData());
        assertEquals((Integer) 7, bst.get(7));
    }


    @Test
    public void getLeftChildNode() {
        bst.add(5);
        bst.add(4);
        bst.add(6);

        /*
         5
        / \
       4   6
         */

        assertEquals((Integer) 5, bst.getRoot().getData());
        assertEquals((Integer) 5, bst.get(5));

        assertEquals((Integer) 4, bst.getRoot().getLeft().getData());
        assertEquals((Integer) 4, bst.get(4));
    }

    @Test
    public void getGrandchildLeftNode() {
        bst.add(5);
        bst.add(4);
        bst.add(6);
        bst.add(3);

        /*
           5
          / \
         4   6
        /
       3
         */

        assertEquals((Integer) 5, bst.getRoot().getData());
        assertEquals((Integer) 5, bst.get(5));

        assertEquals((Integer) 4, bst.getRoot().getLeft().getData());
        assertEquals((Integer) 4, bst.get(4));

        assertEquals((Integer) 3, bst.getRoot().getLeft().getLeft().getData());
        assertEquals((Integer) 3, bst.get(3));
    }



    @Test
    public void getAll() {
        //get all of the data elements

        bst.add(10);
        bst.add(8);
        bst.add(20);
        bst.add(5);
        bst.add(9);
        bst.add(12);
        bst.add(23);
        bst.add(1);
        bst.add(11);
        bst.add(25);

        /*
                  10
                /   \
               8     20
              / \    / \
             5  9  12  23
            /      /     \
           1      11     25

         */


        assertEquals((Integer) 10, bst.getRoot().getData());
        assertEquals((Integer) 10, bst.get(10));

        //left subtree
        assertEquals((Integer) 8, bst.getRoot().getLeft().getData());
        assertEquals((Integer) 8, bst.get(8));

        assertEquals((Integer) 5, bst.getRoot().getLeft().getLeft().getData());
        assertEquals((Integer) 5, bst.get(5));

        assertEquals((Integer) 1, bst.getRoot().getLeft().getLeft().getLeft().getData());
        assertEquals((Integer) 1, bst.get(1));

        assertEquals((Integer) 9, bst.getRoot().getLeft().getRight().getData());
        assertEquals((Integer) 9, bst.get(9));

        //right subtree
        assertEquals((Integer) 20, bst.getRoot().getRight().getData());
        assertEquals((Integer) 20, bst.get(20));

        assertEquals((Integer) 12, bst.getRoot().getRight().getLeft().getData());
        assertEquals((Integer) 12, bst.get(12));

        assertEquals((Integer) 11, bst.getRoot().getRight().getLeft().getLeft().getData());
        assertEquals((Integer) 11, bst.get(11));

        assertEquals((Integer) 23, bst.getRoot().getRight().getRight().getData());
        assertEquals((Integer) 23, bst.get(23));

        assertEquals((Integer) 25, bst.getRoot().getRight().getRight().getRight().getData());
        assertEquals((Integer) 25, bst.get(25));

        assertEquals(10, bst.size());
    }


    //height() method tests
    @Test
    public void heightOneNode() {
        //height of a singular root node

        bst.add(0);
        /*
        0
         */
        assertEquals(0, bst.height());

    }



    @Test
    public void heightTree() {
        //creates a large tree and tests the height

        bst.add(10);
        bst.add(8);
        bst.add(20);
        bst.add(5);
        bst.add(9);
        bst.add(12);
        bst.add(23);
        bst.add(1);
        bst.add(11);
        bst.add(25);
        bst.add(0);
        bst.add(30);
        bst.add(24);

        /*
                    10
                  /    \
                 8     20
                / \    / \
               5  9  12  23
              /      /     \
             1      11     25
            /              /\
           0             24 30

         */

        assertEquals(4, bst.height());
    }


    @Test
    public void anotherHeightTest() {
        bst.add(20);
        bst.add(15);
        bst.add(10);
        bst.add(5);
        bst.add(4);
        bst.add(3);
        bst.add(2);
        bst.add(1);
        bst.add(25);
        bst.add(30);
        bst.add(31);
        bst.add(37);
        bst.add(40);
        bst.add(41);
        bst.add(24);
        bst.add(23);

        /*
                            20
                          /    \
                        15      25
                       /       / \
                     10      24   30
                    /       /      \
                   5       23      31
                  /                 \
                 4                  37
                /                    \
               3                     40
              /                       \
             2                        41
            /
           1

         */

        assertEquals(7, bst.height());
    }


    //remove() method tests
    //CASE 1: REMOVING EXTERNAL NODES
    @Test
    public void removeRoot() {
        bst.add(0);

        /*
        0
         */

        int removedData = bst.remove(0);

        assertEquals(0, removedData);
        assertNull(bst.getRoot());
    }


    @Test
    public void removeRightChildNode() {
        bst.add(0);
        bst.add(1);

        /*
        0
         \
          1
         */


        assertEquals((Integer) 1, bst.getRoot().getRight().getData());
        int removedData = bst.remove(1);

        assertEquals(1, removedData);
        assertNull(bst.getRoot().getRight());
        assertEquals(1, bst.size());
    }



    @Test
    public void removeLeftChildNode() {
        bst.add(1);
        bst.add(0);

        /*
            1
           /
          0
         */

        assertEquals((Integer) 0, bst.getRoot().getLeft().getData());
        int removedData = bst.remove(0);

        assertEquals(0, removedData);
        assertNull(bst.getRoot().getLeft());
        assertEquals(1, bst.size());
    }


    @Test
    public void removeLeftGrandchildNode() {
        bst.add(2);
        bst.add(1);
        bst.add(0);

        /*
              2
             /
            1
           /
          0
         */

        assertEquals((Integer) 0, bst.getRoot().getLeft().getLeft().getData());
        int removedData = bst.remove(0);

        assertEquals(0, removedData);
        assertNull(bst.getRoot().getLeft().getLeft());
        assertEquals(2, bst.size());
    }


    @Test
    public void removeRightGrandchildNode() {
        bst.add(2);
        bst.add(3);
        bst.add(4);

        /*
              2
               \
                3
                 \
                  4
         */

        assertEquals((Integer) 4, bst.getRoot().getRight().getRight().getData());
        int removedData = bst.remove(4);

        assertEquals(4, removedData);
        assertNull(bst.getRoot().getRight().getRight());
        assertEquals(2, bst.size());
    }



    @Test
    public void removeParentNode() {
        bst.add(2);
        bst.add(1);
        bst.add(3);
        bst.add(4);
        bst.add(5);

        /*
              2
             / \
            1   3
                 \
                  4
                   \
                    5
         */

        assertEquals((Integer) 3, bst.getRoot().getRight().getData());
        Integer returnedData = bst.remove(3);

        //size adjusts
        assertEquals(4, bst.size());

        //node removed
        assertEquals((Integer) 2, bst.getRoot().getData());
        assertEquals((Integer) 4, bst.getRoot().getRight().getData());
        assertEquals((Integer) 5, bst.getRoot().getRight().getRight().getData());

        assertEquals((Integer) 3, returnedData);
    }






    @Test
    public void removeZigRight() {
        bst.add(2);
        bst.add(4);
        bst.add(6);
        bst.add(5);

        /*
              2
               \
                4
                 \
                  6
                 /
                5
         */

        assertEquals((Integer) 5, bst.getRoot().getRight().getRight().getLeft().getData());
        int removedData = bst.remove(5);

        assertEquals(5, removedData);
        assertNull(bst.getRoot().getRight().getRight().getLeft());
        assertEquals(3, bst.size());
    }


    @Test
    public void removeZigZagRight() {
        bst.add(2);
        bst.add(4);
        bst.add(8);
        bst.add(5);
        bst.add(6);

        /*
              2
               \
                4
                 \
                  8
                 /
                5
                 \
                  6
         */

        assertEquals((Integer) 6, bst.getRoot().getRight().getRight().getLeft().getRight().getData());
        int removedData = bst.remove(6);

        assertEquals(6, removedData);
        assertNull(bst.getRoot().getRight().getRight().getLeft().getRight());
        assertEquals(4, bst.size());
    }


    //CASE 2: Removing a node with one child.
    @Test
    public void removeParentOfOneNode() {
        bst.add(5);
        bst.add(4);
        bst.add(8);
        bst.add(6);
        bst.add(1);
        bst.add(0);

        /*
              5
             / \
            4   8
           / \
          1   6
         /
        0

         */

        assertEquals((Integer) 1, bst.getRoot().getLeft().getLeft().getData());
        int removedData = bst.remove(1);

        assertEquals(1, removedData);
        assertEquals((Integer) 0, bst.getRoot().getLeft().getLeft().getData());
        assertEquals(5, bst.size());
    }


    //SubCase 1 (Right-Right)
    @Test
    public void subCaseOne() {
        bst.add(5);
        bst.add(8);
        bst.add(9);
        bst.add(10);

        /*
          5
           \
            8
             \
              9
               \
               10
         */

        assertEquals((Integer) 9, bst.getRoot().getRight().getRight().getData());
        int removedData = bst.remove(9);

        assertEquals(9, removedData);
        assertEquals(3, bst.size());
        assertEquals((Integer) 10, bst.getRoot().getRight().getRight().getData());
    }

    //SubCase 2 (Right-Left)
    @Test
    public void subCaseTwo() {
        bst.add(5);
        bst.add(7);
        bst.add(9);
        bst.add(8);

        /*
          5
           \
            7
             \
              9
             /
            8
         */

        assertEquals((Integer) 9, bst.getRoot().getRight().getRight().getData());
        int removedData = bst.remove(9);

        assertEquals(9, removedData);
        assertEquals(3, bst.size());
        assertEquals((Integer) 8, bst.getRoot().getRight().getRight().getData());
    }



    //SubCase 3 (Left-Left)
    @Test
    public void subCaseThree() {
        bst.add(5);
        bst.add(4);
        bst.add(3);
        bst.add(2);

        /*
                5
               /
              4
             /
            3
           /
          2
         */

        assertEquals((Integer) 3, bst.getRoot().getLeft().getLeft().getData());
        int removedData = bst.remove(3);

        assertEquals(3, removedData);
        assertEquals(3, bst.size());
        assertEquals((Integer) 2, bst.getRoot().getLeft().getLeft().getData());
    }


    //SubCase 4 (Left-Right)
    @Test
    public void subCaseFour() {
        bst.add(6);
        bst.add(5);
        bst.add(3);
        bst.add(4);

        /*
                6
               /
              5
             /
            3
             \
              4
         */

        assertEquals((Integer) 3, bst.getRoot().getLeft().getLeft().getData());
        int removedData = bst.remove(3);

        assertEquals(3, removedData);
        assertEquals(3, bst.size());
        assertEquals((Integer) 4, bst.getRoot().getLeft().getLeft().getData());
    }


    /*
    //CASE 4: Removing a node that has two children using successor
    @Test
    public void removeParentOfTwoNodes() {
        bst.add(7);
        bst.add(8);
        bst.add(4);
        bst.add(6);
        bst.add(1);
        bst.add(0);
        bst.add(6);
        bst.add(5);

        /*
              7                      7
             / \                    / \
            4   8       -->        5   8
           / \                    / \
          1   6                  1   6
         /   /                  /
        0   5                  0

         */
    /*
        assertEquals((Integer) 4, bst.getRoot().getLeft().getData());
        assertEquals(7, bst.size());
        int removedData = bst.remove(4);
        assertEquals(4, removedData);

        assertEquals((Integer) 7, bst.getRoot().getData());
        assertEquals((Integer) 8, bst.getRoot().getRight().getData());
        assertEquals((Integer) 5, bst.getRoot().getLeft().getData());
        assertEquals((Integer) 6, bst.getRoot().getLeft().getRight().getData());
        assertNull(bst.getRoot().getLeft().getRight().getLeft());
        assertEquals((Integer) 1, bst.getRoot().getLeft().getLeft().getData());
        assertEquals((Integer) 0, bst.getRoot().getLeft().getLeft().getLeft().getData());
        assertEquals(6, bst.size());
    }*/

}