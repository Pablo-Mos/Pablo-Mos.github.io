/**
 * Your implementation of a CircularSinglyLinkedList without a tail pointer.
 *
 * @Pablo_Moschcovich
 * @version 1.0
 * @pherrera30
 * @903615795
 *
 * Collaborators: LIST ALL COLLABORATORS YOU WORKED WITH HERE
 * Pablo Moschcovich
 * Resources: LIST ALL NON-COURSE RESOURCES YOU CONSULTED HERE
 */
public class CircularSinglyLinkedList<T> {

    // Do not add new instance variables or modify existing ones.
    private LinkedNode<T> head;
    private int size;

    // Do not add a constructor.

    /**
     * Adds the data to the specified index.
     *
     * Must be O(1) for indices 0 and size and O(n) for all other cases.
     *
     * @param index the index at which to add the new data
     * @param data  the data to add at the specified index
     * @throws java.lang.IndexOutOfBoundsException if index < 0 or index > size
     * @throws java.lang.IllegalArgumentException  if data is null
     */
    public void addAtIndex(int index, T data) {
        int c = 0;
        if (index < 0 || index > size) {
            throw new IndexOutOfBoundsException("Index is out of bounds");
        } else if (data == null) {
            throw new IllegalArgumentException("Data is null");
        } else {
            if (index == 0) {
                addToFront(data);
            } else if (index == size) {
                addToBack(data);
            } else {
                LinkedNode<T> currentNode = head;
                while (c < index - 1) {
                    currentNode = currentNode.getNext();
                    c++;
                }
                LinkedNode<T> newNode = new LinkedNode<T>(data, currentNode.getNext());
                currentNode.setNext(newNode);
                size++;
            }
        }
    }

    /**
     * Adds the data to the front of the list.
     *
     * Must be O(1).
     *
     * @param data the data to add to the front of the list
     * @throws java.lang.IllegalArgumentException if data is null
     */
    public void addToFront(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Data is null");
        } else if (head == null) {
            LinkedNode<T> newNode = new LinkedNode<T>(data);
            head = newNode;
            head.setNext(head);
            size++;
        } else {
            LinkedNode<T> currentNode = head;
            T temp = currentNode.getData();
            LinkedNode<T> newNode = new LinkedNode<T>(temp, currentNode.getNext());
            currentNode.setNext(newNode);
            currentNode.setData(data);
            size++;
        }
    }

    /**
     * Adds the data to the back of the list.
     *
     * Must be O(1).
     *
     * @param data the data to add to the back of the list
     * @throws java.lang.IllegalArgumentException if data is null
     */
    public void addToBack(T data) {
        T temp = null;
        if (data == null) {
            throw new IllegalArgumentException("Data is null");
        } else if (head == null) {
            LinkedNode<T> newNode = new LinkedNode<T>(data, null);
            head = newNode;
            head.setNext(head);
            size++;
        } else {
            LinkedNode<T> currentNode = head;
            temp = currentNode.getData();
            LinkedNode<T> newNode = new LinkedNode<T>(temp, currentNode.getNext());
            currentNode.setNext(newNode);
            currentNode.setData(data);
            head = currentNode.getNext();
            size++;
        }
    }

    /**
     * Removes and returns the data at the specified index.
     *
     * Must be O(1) for index 0 and O(n) for all other cases.
     *
     * @param index the index of the data to remove
     * @return the data formerly located at the specified index
     * @throws java.lang.IndexOutOfBoundsException if index < 0 or index >= size
     */
    public T removeAtIndex(int index) {
        if (index >= this.size) {
            throw new IndexOutOfBoundsException("Cannot remove data at invalid index."
                    + "Index greater than or equal to size.");
        } else if (index < 0) {
            throw new IndexOutOfBoundsException("Cannot remove data at invalid index. Index less than zero.");
        } else if (index == 0) {
            T temp = head.getData();
            head.setData(head.getNext().getData());
            head.setNext(head.getNext().getNext());
            size--;
            return temp;
        } else {
            LinkedNode<T> curr = head;
            for (int i = 0; i < size; i++) {
                if (i + 1 == index) {
                    T temp = curr.getNext().getData();
                    curr.setNext(curr.getNext().getNext());
                    size--;
                    return temp;
                } else {
                    curr = curr.getNext();
                }
            }
        }
        return null;
    }

    /**
     * Removes and returns the first data of the list.
     *
     * Must be O(1).
     *
     * @return the data formerly located at the front of the list
     * @throws java.util.NoSuchElementException if the list is empty
     */
    public T removeFromFront() {
        if (this.isEmpty()) {
            throw new java.util.NoSuchElementException("CircularSinglyLinkedList is empty. "
                    + "No element can be removed.");
        } else {
            T temp = head.getData();
            head.setData(head.getNext().getData());
            head.setNext(head.getNext().getNext());
            size--;
            return temp;
        }
    }

    /**
     * Removes and returns the last data of the list.
     *
     * Must be O(n).
     *
     * @return the data formerly located at the back of the list
     * @throws java.util.NoSuchElementException if the list is empty
     */
    public T removeFromBack() {
        if (isEmpty()) {
            throw new java.util.NoSuchElementException("CircularSinglyLinkedList is empty."
                   + "No element can be removed.");
        }
        return removeAtIndex(size - 1);
    }

    /**
     * Returns the data at the specified index.
     *
     * Should be O(1) for index 0 and O(n) for all other cases.
     *
     * @param index the index of the data to get
     * @return the data stored at the index in the list
     * @throws java.lang.IndexOutOfBoundsException if index < 0 or index >= size
     */
    public T get(int index) {
        if (index >= this.size) {
            throw new IndexOutOfBoundsException("Cannot access data at invalid index."
                    + "Index greater than or equal to size.");
        } else if (index < 0) {
            throw new IndexOutOfBoundsException("Cannot access data at invalid index."
                    + "Index less than zero.");
        } else if (index == 0) {
            return head.getData();
        } else {
            LinkedNode<T> curr = head;
            for (int i = 0; i < index; i++) {
                curr = curr.getNext();
            }
            return curr.getData();
        }
    }

    /**
     * Returns whether or not the list is empty.
     *
     * Must be O(1).
     *
     * @return true if empty, false otherwise
     */
    public boolean isEmpty() {
        return size == 0;
    }

    /**
     * Clears the list.
     *
     * Clears all data and resets the size.
     *
     * Must be O(1).
     */
    public void clear() {
        head = null;
        size = 0;
    }

    /**
     * Removes and returns the last copy of the given data from the list.
     *
     * Do not return the same data that was passed in. Return the data that
     * was stored in the list.
     *
     * Must be O(n).
     *
     * @param data the data to be removed from the list
     * @return the data that was removed
     * @throws java.lang.IllegalArgumentException if data is null
     * @throws java.util.NoSuchElementException   if data is not found
     */
    public T removeLastOccurrence(T data) {
        if (data == null) {
            throw new java.lang.IllegalArgumentException("Invalid argument."
                    + "Cannot remove null data");
        } else {
            LinkedNode<T> curr = head;
            LinkedNode<T> end = null;
            if (head.getData().equals(data)) {
                end = head;
            }
            for (int i = 0; i < size; i++) {
                if (curr.getNext().getData().equals(data)) {
                    end = curr;
                }
                curr = curr.getNext();
            }
            if (end == null) {
                throw new java.util.NoSuchElementException("Invalid argument."
                        + "Element not found");
            } else {
                if (end.getNext() == head) {
                    head = head.getNext();
                }
                T temp = end.getNext().getData();
                end.setNext(end.getNext().getNext());
                size--;
                return temp;
            }
        }
    }

    /**
     * Returns an array representation of the linked list.
     *
     * Must be O(n) for all cases.
     *
     * @return the array of length size holding all of the data (not the
     * nodes) in the list in the same order
     */
    public T[] toArray() {
        T[] temp = (T[]) new Object[size];
        LinkedNode<T> currentNode = head;
        temp[0] = currentNode.getData();
        for (int i = 1; i < size; i++) {
            currentNode = currentNode.getNext();
            temp[i] = currentNode.getData();
        }
        return temp;
    }

    /**
     * Returns the head node of the list.
     *
     * For grading purposes only. You shouldn't need to use this method since
     * you have direct access to the variable.
     *
     * @return the node at the head of the list
     */
    public LinkedNode<T> getHead() {
        // DO NOT MODIFY!
        return head;
    }

    /**
     * Returns the size of the list.
     *
     * For grading purposes only. You shouldn't need to use this method since
     * you have direct access to the variable.
     *
     * @return the size of the list
     */
    public int size() {
        // DO NOT MODIFY!
        return size;
    }
}