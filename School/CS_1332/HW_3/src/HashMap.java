import java.util.List;
import java.util.Set;
import java.util.HashSet;
import java.util.ArrayList;
/**
 * Your implementation of a HashMap.
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
public class HashMap<K, V> {

    /*
     * The initial capacity of the HashMap when created with the
     * default constructor.
     *
     * DO NOT MODIFY THIS VARIABLE!
     */
    public static final int INITIAL_CAPACITY = 13;

    /*
     * The max load factor of the HashMap.
     *
     * DO NOT MODIFY THIS VARIABLE!
     */
    public static final double MAX_LOAD_FACTOR = 0.67;

    /*
     * Do not add new instance variables or modify existing ones.
     */
    private MapEntry<K, V>[] table;
    private int size;

    /**
     * Constructs a new HashMap.
     *
     * The backing array should have an initial capacity of INITIAL_CAPACITY.
     *
     * Use constructor chaining.
     */
    public HashMap() {
        table = (MapEntry<K, V>[]) new MapEntry[INITIAL_CAPACITY];
        size = 0;
    }

    /**
     * Constructs a new HashMap.
     *
     * The backing array should have an initial capacity of initialCapacity.
     *
     * You may assume initialCapacity will always be positive.
     *
     * @param initialCapacity the initial capacity of the backing array
     */
    public HashMap(int initialCapacity) {
        table = (MapEntry<K, V>[]) new MapEntry[INITIAL_CAPACITY];
        size = 0;
    }

    /**
     * Adds the given key-value pair to the map. If an entry in the map
     * already has this key, replace the entry's value with the new one
     * passed in.
     *
     * In the case of a collision, use external chaining as your resolution
     * strategy. Add new entries to the front of an existing chain, but don't
     * forget to check the entire chain for duplicate keys first.
     *
     * If you find a duplicate key, then replace the entry's value with the new
     * one passed in. When replacing the old value, replace it at that position
     * in the chain, not by creating a new entry and adding it to the front.
     *
     * Before actually adding any data to the HashMap, you should check to
     * see if the array would violate the max load factor if the data was
     * added. Resize if the load factor (LF) is greater than max LF (it is okay
     * if the load factor is equal to max LF). For example, let's say the
     * array is of length 5 and the current size is 3 (LF = 0.6). For this
     * example, assume that no elements are removed in between steps. If
     * another entry is attempted to be added, before doing anything else,
     * you should check whether (3 + 1) / 5 = 0.8 is larger than the max LF.
     * It is, so you would trigger a resize before you even attempt to add
     * the data or figure out if it's a duplicate. Be careful to consider the
     * differences between integer and double division when calculating load
     * factor.
     *
     * When regrowing, resize the length of the backing table to
     * (2 * old length) + 1. You must use the resizeBackingTable method to do so.
     *
     * Return null if the key was not already in the map. If it was in the map,
     * return the old value associated with it.
     *
     * @param key   the key to add
     * @param value the value to add
     * @return null if the key was not already in the map. If it was in the
     * map, return the old value associated with it
     * @throws java.lang.IllegalArgumentException if key or value is null
     */
    public V put(K key, V value) {
        if (key == null || value == null) {
            throw new IllegalArgumentException("Error. The key is null");
        }
        V tempVal;
        if (((double) (size + 1) / (double) (table.length)) > MAX_LOAD_FACTOR) {
            resizeBackingTable(table.length * 2 + 1);
        }
        int hashNum = Math.abs(key.hashCode() % table.length);
        if (table[hashNum] == null) {
            table[hashNum] = new MapEntry<K, V>(key, value);
            size++;
            return null;
        } else {
            MapEntry<K, V> check = table[hashNum];
            while (check.getNext() != null) {
                if (check.getKey().equals(key)) {
                    tempVal = check.getValue();
                    check.setValue(value);
                    return tempVal;
                }
                if (check.getNext() != null) {
                    check = check.getNext();
                }
            }
            if (check.getKey().equals(key)) {
                tempVal = check.getValue();
                check.setValue(value);
                return tempVal;
            }
            MapEntry<K, V> temp = new MapEntry(key, value, table[hashNum]);
            table[hashNum] = temp;
            size++;
            return null;
        }
    }

    /**
     * Removes the entry with a matching key from the map.
     *
     * @param key the key to remove
     * @return the value associated with the key
     * @throws java.lang.IllegalArgumentException if key is null
     * @throws java.util.NoSuchElementException   if the key is not in the map
     */
    public V remove(K key) {
        MapEntry<K, V> temp;
        int c = 0;
        if (key == null) {
            throw new IllegalArgumentException("Error. The key is null");
        }
        int hashNum = Math.abs(key.hashCode() % table.length);
        if (table[hashNum] == null) {
            throw new java.util.NoSuchElementException("Error. The key does not exist");
        } else {
            MapEntry<K, V> check = table[hashNum];
            while (check.getNext() != null) {
                if (check.getKey().equals(key)) {
                    if (c == 0) {
                        if (check.getNext() == null) {
                            table[hashNum] = null;
                        } else {
                            table[hashNum] = check.getNext();
                        }
                    } else {
                        temp = table[hashNum];
                        for (int i = 0; i < c - 1; i++) {
                            temp = temp.getNext();
                        }
                        if (check.getNext() == null) {
                            temp.setNext(null);
                        } else {
                            temp.setNext(check.getNext());
                        }
                    }
                    size--;
                    return check.getValue();
                }
                if (check.getNext() != null) {
                    check = check.getNext();
                }
                c++;
            }
            if (check.getKey().equals(key)) {
                if (c == 0) {
                    if (check.getNext() == null) {
                        table[hashNum] = null;
                    } else {
                        table[hashNum] = check.getNext();
                    }
                } else {
                    temp = table[hashNum];
                    for (int i = 0; i < c - 1; i++) {
                        temp = temp.getNext();
                    }
                    if (check.getNext() == null) {
                        temp.setNext(null);
                    } else {
                        temp.setNext(check.getNext());
                    }
                }
                size--;
                return check.getValue();
            }
            throw new java.util.NoSuchElementException("Error. The key does not exist");
        }
    }

    /**
     * Gets the value associated with the given key.
     *
     * @param key the key to search for in the map
     * @return the value associated with the given key
     * @throws java.lang.IllegalArgumentException if key is null
     * @throws java.util.NoSuchElementException   if the key is not in the map
     */
    public V get(K key) {
        if (key == null) {
            throw new IllegalArgumentException("Error. The key is null");
        }
        int hashNum = Math.abs(key.hashCode() % table.length);
        if (table[hashNum] == null) {
            throw new java.util.NoSuchElementException("Error. The key does not exist");
        } else {
            MapEntry<K, V> check = table[hashNum];
            while (check.getNext() != null) {
                if (check.getKey().equals(key)) {
                    return check.getValue();
                }
                if (check.getNext() != null) {
                    check = check.getNext();
                }
            }
            if (check.getKey().equals(key)) {
                return check.getValue();
            }
            throw new java.util.NoSuchElementException("Error. The key does not exist");
        }
    }

    /**
     * Returns whether or not the key is in the map.
     *
     * @param key the key to search for in the map
     * @return true if the key is contained within the map, false
     * otherwise
     * @throws java.lang.IllegalArgumentException if key is null
     */
    public boolean containsKey(K key) {
        if (key == null) {
            throw new IllegalArgumentException("Error. The key is null");
        }
        int hashNum = Math.abs(key.hashCode() % table.length);
        if (table[hashNum] == null) {
            return false;
        } else {
            MapEntry<K, V> check = table[hashNum];
            while (check.getNext() != null) {
                if (check.getKey().equals(key)) {
                    return true;
                }
                if (check.getNext() != null) {
                    check = check.getNext();
                }
            }
            if (check.getKey().equals(key)) {
                return true;
            }
            return false;
        }
    }

    /**
     * Returns a Set view of the keys contained in this map.
     *
     * Use java.util.HashSet.
     *
     * @return the set of keys in this map
     */
    public Set<K> keySet() {
        HashSet<K> keys = new HashSet<>(size);
        for (MapEntry<K, V> i: table) {
            if (i != null) {
                keys.add(i.getKey());
                while (i.getNext() != null) {
                    i = i.getNext();
                    keys.add(i.getKey());
                }
            }
        }
        return keys;
    }

    /**
     * Returns a List view of the values contained in this map.
     *
     * Use java.util.ArrayList or java.util.LinkedList.
     *
     * You should iterate over the table in order of increasing index and add
     * entries to the List in the order in which they are traversed.
     *
     * @return list of values in this map
     */
    public List<V> values() {
        List<V> values = new ArrayList<V>(size);
        for (MapEntry<K, V> i: table) {
            if (i != null) {
                values.add(i.getValue());
                while (i.getNext() != null) {
                    i = i.getNext();
                    values.add(i.getValue());
                }
            }
        }
        return values;
    }

    /**
     * Resize the backing table to length.
     *
     * Disregard the load factor for this method. So, if the passed in length is
     * smaller than the current capacity, and this new length causes the table's
     * load factor to exceed MAX_LOAD_FACTOR, you should still resize the table
     * to the specified length and leave it at that capacity.
     *
     * You should iterate over the old table in order of increasing index and
     * add entries to the new table in the order in which they are traversed.
     *
     * Since resizing the backing table is working with the non-duplicate
     * data already in the table, you shouldn't explicitly check for
     * duplicates.
     *
     * Hint: You cannot just simply copy the entries over to the new array.
     *
     * @param length new length of the backing table
     * @throws java.lang.IllegalArgumentException if length is less than the
     *                                            number of items in the hash
     *                                            map
     */
    public void resizeBackingTable(int length) {
        int tempSize = size;
        if (length <= 0 || length < size) {
            throw new IllegalArgumentException("Error. The length is less than the number of items in the hash map");
        }
        MapEntry<K, V> i;
        size = 0;
        MapEntry<K, V>[] tempTable = table;
        table = (MapEntry<K, V>[]) new MapEntry[length];
        for (MapEntry<K, V> pair: tempTable) {
            size = 0;
            if (pair != null) {
                put(pair.getKey(), pair.getValue());
                i = pair;
                while (i.getNext() != null) {
                    put(i.getKey(), i.getValue());
                    i = i.getNext();
                }
                put(i.getKey(), i.getValue());
            }
        }
        size = tempSize;
    }

    /**
     * Clears the map.
     *
     * Resets the table to a new array of the initial capacity and resets the
     * size.
     */
    public void clear() {
        table = (MapEntry<K, V>[]) new MapEntry[INITIAL_CAPACITY];
        size = 0;
    }

    /**
     * Returns the table of the map.
     *
     * For grading purposes only. You shouldn't need to use this method since
     * you have direct access to the variable.
     *
     * @return the table of the map
     */
    public MapEntry<K, V>[] getTable() {
        // DO NOT MODIFY THIS METHOD!
        return table;
    }

    /**
     * Returns the size of the map.
     *
     * For grading purposes only. You shouldn't need to use this method since
     * you have direct access to the variable.
     *
     * @return the size of the map
     */
    public int size() {
        // DO NOT MODIFY THIS METHOD!
        return size;
    }
}
