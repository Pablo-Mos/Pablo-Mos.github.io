import java.util.Collection;
import java.util.List;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

/**
 * Your implementation of a BST.
 *
 * @author Pablo Moschcovich
 * @version 1.0
 * @userid pherrera30
 * @GTID 903615795
 *
 * Collaborators: LIST ALL COLLABORATORS YOU WORKED WITH HERE
 *
 * Resources: LIST ALL NON-COURSE RESOURCES YOU CONSULTED HERE
 */
public class BST<T extends Comparable<? super T>> {

    /*
     * Do not add new instance variables or modify existing ones.
     */
    private BSTNode<T> root;
    private int size;

    /**
     * Constructs a new BST.
     *
     * This constructor should initialize an empty BST.
     *
     * Since instance variables are initialized to their default values, there
     * is no need to do anything for this constructor.
     */
    public BST() {
        // DO NOT IMPLEMENT THIS CONSTRUCTOR!
    }

    /**
     * Constructs a new BST.
     *
     * This constructor should initialize the BST with the data in the
     * Collection. The data should be added in the same order it is in the
     * Collection.
     *
     * Hint: Not all Collections are indexable like Lists, so a regular for loop
     * will not work here. However, all Collections are Iterable, so what type
     * of loop would work?
     *
     * @param data the data to add
     * @throws java.lang.IllegalArgumentException if data or any element in data
     *                                            is null
     */
    public BST(Collection<T> data) {
        if (data == null) {
            throw new IllegalArgumentException("Error. The data is null");
        }
        for (T t: data) {
            add(t);
        }

    }

    /**
     * Adds the data to the tree.
     *
     * This must be done recursively.
     *
     * The data becomes a leaf in the tree.
     *
     * Traverse the tree to find the appropriate location. If the data is
     * already in the tree, then nothing should be done (the duplicate
     * shouldn't get added, and size should not be incremented).
     *
     * Must be O(log n) for best and average cases and O(n) for worst case.
     *
     * @param data the data to add
     * @throws java.lang.IllegalArgumentException if data is null
     */
    public void add(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Error. The data is null");
        }
        root = actualAdd(root, data);
    }

    /**
     * Actual add method
     *
     * @param data mean data
     * @param temp mean node
     * @return node
     */
    private BSTNode<T> actualAdd(BSTNode<T> temp, T data) {
        if (temp == null) {
            size++;
            return new BSTNode<T>(data);
        }

        if (data.compareTo(temp.getData()) == 0) {
            return temp;
        }

        if (data.compareTo(temp.getData()) < 0) {
            temp.setLeft(actualAdd(temp.getLeft(), data));
        } else {
            temp.setRight(actualAdd(temp.getRight(), data));
        }
        return temp;

    }

    /**
     * Removes and returns the data from the tree matching the given parameter.
     *
     * This must be done recursively.
     *
     * There are 3 cases to consider:
     * 1: The node containing the data is a leaf (no children). In this case,
     * simply remove it.
     * 2: The node containing the data has one child. In this case, simply
     * replace it with its child.
     * 3: The node containing the data has 2 children. Use the successor to
     * replace the data. You MUST use recursion to find and remove the
     * successor (you will likely need an additional helper method to
     * handle this case efficiently).
     *
     * Do not return the same data that was passed in. Return the data that
     * was stored in the tree.
     *
     * Hint: Should you use value equality or reference equality?
     *
     * Must be O(log n) for best and average cases and O(n) for worst case.
     *
     * @param data the data to remove
     * @return the data that was removed
     * @throws java.lang.IllegalArgumentException if data is null
     * @throws java.util.NoSuchElementException   if the data is not in the tree
     */
    public T remove(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Error. The data is null");
        }
        root = actualRemove(root, data);
        return data;
    }

    /**
     * Actual remove method
     * @param data mean data
     * @param temp mean node
     * @return node
     */
    private BSTNode<T> actualRemove(BSTNode<T> temp, T data) {
        if (temp == null) {
            throw new java.util.NoSuchElementException("The data is not found");
        } else if (data.compareTo(temp.getData()) < 0) {
            temp.setLeft(actualRemove(temp.getLeft(), data));
        } else if (data.compareTo(temp.getData()) > 0) {
            temp.setRight(actualRemove(temp.getRight(), data));
        } else {
            if (temp.getLeft() == null) {
                size--;
                return temp.getRight();
            } else if (temp.getRight() == null) {
                size--;
                return temp.getLeft();
            } else {
                temp.setData(biggestNode(temp.getRight()));
                temp.setRight(actualRemove(temp.getRight(),
                        temp.getData()));
            }
        }
        return temp;
    }

    /**
     * Get biggest node
     * @param node mean node
     * @return the node
     */
    private T biggestNode(BSTNode<T> node) {
        while (node.getLeft() != null) {
            node.setData(node.getLeft().getData());
            node = node.getLeft();
        }
        return node.getData();
    }

    /**
     * Returns the data from the tree matching the given parameter.
     *
     * This must be done recursively.
     *
     * Do not return the same data that was passed in. Return the data that
     * was stored in the tree.
     *
     * Hint: Should you use value equality or reference equality?
     *
     * Must be O(log n) for best and average cases and O(n) for worst case.
     *
     * @param data the data to search for
     * @return the data in the tree equal to the parameter
     * @throws java.lang.IllegalArgumentException if data is null
     * @throws java.util.NoSuchElementException   if the data is not in the tree
     */
    public T get(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Error. The data is null");
        }
        return actualGet(root, data);
    }

    /**
     * Method to get the node from tree
     * @param data mean data
     * @param temp mean node
     * @return node
     */

    private T actualGet(BSTNode<T> temp, T data) {
        if (temp == null) {
            throw new java.util.NoSuchElementException("The data is not found");
        }
        if (data.compareTo(temp.getData()) == 0) {
            return temp.getData();
        } else if (data.compareTo(temp.getData()) < 0) {
            return actualGet(temp.getLeft(), data);
        } else {
            return actualGet(temp.getRight(), data);
        }

    }
    /**
     * Returns whether or not data matching the given parameter is contained
     * within the tree.
     *
     * This must be done recursively.
     *
     * Hint: Should you use value equality or reference equality?
     *
     * Must be O(log n) for best and average cases and O(n) for worst case.
     *
     * @param data the data to search for
     * @return true if the parameter is contained within the tree, false
     * otherwise
     * @throws java.lang.IllegalArgumentException if data is null
     */
    public boolean contains(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Error. The data is null");
        }
        return actualContains(root, data);
    }

    /**
     * Method to check the tree has certain node
     * @param data of node
     * @param temp node
     * @return true or false if the tree contains the data
     *
     */

    private boolean actualContains(BSTNode<T> temp, T data) {
        if (temp == null) {
            return false;
        }
        if (data.compareTo(temp.getData()) == 0) {
            return true;
        } else if (data.compareTo(temp.getData()) < 0) {
            return actualContains(temp.getLeft(), data);
        } else {
            return actualContains(temp.getRight(), data);
        }
    }

    /**
     * Generate a pre-order traversal of the tree.
     *
     * This must be done recursively.
     *
     * Must be O(n).
     *
     * @return the preorder traversal of the tree
     */
    public List<T> preorder() {
        List<T> list = new ArrayList<T>();
        actualPreorder(root, list);
        return list;
    }

    /**
     * Get the preorder list of tree
     * @param list mean list
     * @param temp mean node
     */

    private void actualPreorder(BSTNode<T> temp, List<T> list) {
        if (temp == null) {
            return;
        }
        list.add(temp.getData());
        actualPreorder(temp.getLeft(), list);
        actualPreorder(temp.getRight(), list);
    }

    /**
     * Generate an in-order traversal of the tree.
     *
     * This must be done recursively.
     *
     * Must be O(n).
     *
     * @return the inorder traversal of the tree
     */
    public List<T> inorder() {
        List<T> list = new ArrayList<T>();
        actualInorder(root, list);
        return list;
    }

    /**
     * Get the inorder list of tree
     * @param list mean list
     * @param temp mean node
     */
    private void actualInorder(BSTNode<T> temp, List<T> list) {
        if (temp == null) {
            return;
        }
        actualInorder(temp.getLeft(), list);
        list.add(temp.getData());
        actualInorder(temp.getRight(), list);
    }


    /**
     * Generate a post-order traversal of the tree.
     *
     * This must be done recursively.
     *
     * Must be O(n).
     *
     * @return the postorder traversal of the tree
     */
    public List<T> postorder() {
        List<T> list = new ArrayList<T>();
        actualPostorder(root, list);
        return list;
    }

    /**
     * Get the postorder list of tree
     * @param list mean list
     * @param temp mean node
     */
    private void actualPostorder(BSTNode<T> temp, List<T> list) {
        if (temp == null) {
            return;
        }
        actualPostorder(temp.getLeft(), list);
        actualPostorder(temp.getRight(), list);
        list.add(temp.getData());
    }

    /**
     * Generate a level-order traversal of the tree.
     *
     * This does not need to be done recursively.
     *
     * Hint: You will need to use a queue of nodes. Think about what initial
     * node you should add to the queue and what loop / loop conditions you
     * should use.
     *
     * Must be O(n).
     *
     * @return the level order traversal of the tree
     */
    public List<T> levelorder() {
        BSTNode<T> temp;
        List<T> list = new ArrayList<T>();
        Queue<BSTNode<T>> q1 = new LinkedList<BSTNode<T>>();
        if (root != null) {
            q1.add(root);
        }
        while (!q1.isEmpty()) {
            temp = q1.remove();
            list.add(temp.getData());
            if (temp.getLeft() != null) {
                q1.add(temp.getLeft());
            }
            if (temp.getRight() != null) {
                q1.add(temp.getRight());
            }
        }
        return list;
    }

    /**
     * Returns the height of the root of the tree.
     *
     * This must be done recursively.
     *
     * A node's height is defined as max(left.height, right.height) + 1. A
     * leaf node has a height of 0 and a null child has a height of -1.
     *
     * Must be O(n).
     *
     * @return the height of the root of the tree, -1 if the tree is empty
     */
    public int height() {
        return actualHeight(root);
    }

    /**
     * Method to return tree hight
     * @param temp mean the node
     * @return height
     *
     */
    private int actualHeight(BSTNode<T> temp) {
        if (temp == null) {
            return -1;
        } else {
            return 1 + Math.max(actualHeight(temp.getLeft()),
                    actualHeight(temp.getRight()));
        }
    }
    /**
     * Clears the tree.
     *
     * Clears all data and resets the size.
     *
     * Must be O(1).
     */
    public void clear() {
        root = null;
        size = 0;
    }

    /**
     * Returns the root of the tree.
     *
     * For grading purposes only. You shouldn't need to use this method since
     * you have direct access to the variable.
     *
     * @return the root of the tree
     */
    public BSTNode<T> getRoot() {
        // DO NOT MODIFY THIS METHOD!
        return root;
    }

    /**
     * Returns the size of the tree.
     *
     * For grading purposes only. You shouldn't need to use this method since
     * you have direct access to the variable.
     *
     * @return the size of the tree
     */
    public int size() {
        // DO NOT MODIFY THIS METHOD!
        return size;
    }
}
