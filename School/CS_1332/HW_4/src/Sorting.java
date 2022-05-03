import java.util.Comparator;
import java.util.Random;
import java.util.ArrayList;
import java.util.List;

/**
 * Your implementation of various sorting algorithms.
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

public class Sorting {

    /**
     * Implement insertion sort.
     *
     * It should be:
     * in-place
     * stable
     * adaptive
     *
     * Have a worst case running time of:
     * O(n^2)
     *
     * And a best case running time of:
     * O(n)
     *
     * @param <T>        data type to sort
     * @param arr        the array that must be sorted after the method runs
     * @param comparator the Comparator used to compare the data in arr
     * @throws java.lang.IllegalArgumentException if the array or comparator is
     *                                            null
     */
    public static <T> void insertionSort(T[] arr, Comparator<T> comparator) {
        if (arr == null) {
            throw new IllegalArgumentException("Error. The array is null");
        }
        if (comparator == null) {
            throw new IllegalArgumentException("Error. The comparator is null");
        }
        T temp;
        for (int i = 1; i < arr.length; i++) {
            for (int j = i; j > 0; j--) {
                if (comparator.compare(arr[j], arr[j - 1]) < 0) {
                    temp = arr[j];
                    arr[j] = arr[j - 1];
                    arr[j - 1] = temp;
                } else {
                    j = -1;
                }
            }
        }
    }

    /**
     * Implement cocktail sort.
     *
     * It should be:
     * in-place
     * stable
     * adaptive
     *
     * Have a worst case running time of:
     * O(n^2)
     *
     * And a best case running time of:
     * O(n)
     *
     * NOTE: See pdf for last swapped optimization for cocktail sort. You
     * MUST implement cocktail sort with this optimization
     *
     * @param <T>        data type to sort
     * @param arr        the array that must be sorted after the method runs
     * @param comparator the Comparator used to compare the data in arr
     * @throws java.lang.IllegalArgumentException if the array or comparator is
     *                                            null
     */
    public static <T> void cocktailSort(T[] arr, Comparator<T> comparator) {
        if (arr == null) {
            throw new IllegalArgumentException("Error. The array is null");
        }
        if (comparator == null) {
            throw new IllegalArgumentException("Error. The comparator is null");
        }
        boolean swapsMade = true;
        int i = 1;
        int j = arr.length - 1;
        while (i < j && swapsMade) {
            swapsMade = false;
            for (int k = i; k < j; k++) {
                if (comparator.compare(arr[k], arr[k + 1]) > 0) {
                    T temp = arr[k];
                    arr[k] = arr[k + 1];
                    arr[k + 1] = temp;
                    swapsMade = true;
                }
            }
            j--;
            if (swapsMade) {
                swapsMade = false;
                for (int k = j; k > i; k--) {
                    if (comparator.compare(arr[k - 1], arr[k]) > 0) {
                        T temp = arr[k];
                        arr[k] = arr[k - 1];
                        arr[k - 1] = temp;
                        swapsMade = true;
                    }
                }
            }
            i++;
        }
    }

    /**
     * Implement merge sort.
     *
     * It should be:
     * out-of-place
     * stable
     * not adaptive
     *
     * Have a worst case running time of:
     * O(n log n)
     *
     * And a best case running time of:
     * O(n log n)
     *
     * You can create more arrays to run merge sort, but at the end, everything
     * should be merged back into the original T[] which was passed in.
     *
     * When splitting the array, if there is an odd number of elements, put the
     * extra data on the right side.
     *
     * Hint: If two data are equal when merging, think about which subarray
     * you should pull from first
     *
     * @param <T>        data type to sort
     * @param arr        the array to be sorted
     * @param comparator the Comparator used to compare the data in arr
     * @throws java.lang.IllegalArgumentException if the array or comparator is
     *                                            null
     */
    public static <T> void mergeSort(T[] arr, Comparator<T> comparator) {
        if (arr == null) {
            throw new IllegalArgumentException("Error. The array is null");
        }
        if (comparator == null) {
            throw new IllegalArgumentException("Error. The comparator is null");
        }
        if (arr.length > 1) {
            int midIdx = (int) (arr.length / 2);
            int leftSize = (int) (arr.length / 2);
            int rightSize = arr.length - leftSize;
            T[] leftArr = (T[]) new Object[leftSize];
            T[] rightArr = (T[]) new Object[rightSize];
            for (int i = 0; i < leftSize; i++) {
                leftArr[i] = arr[i];
            }
            for (int i = leftSize; i < arr.length; i++) {
                rightArr[i - leftSize] = arr[i];
            }
            mergeSort(leftArr, comparator);
            mergeSort(rightArr, comparator);
            int leftIdx = 0;
            int rightIdx = 0;
            int currIdx = 0;
            while (leftIdx < midIdx
                    && rightIdx < arr.length - midIdx) {
                if (comparator.compare(leftArr[leftIdx],
                        rightArr[rightIdx]) <= 0) {
                    arr[currIdx] = leftArr[leftIdx];
                    leftIdx++;
                } else {
                    arr[currIdx] = rightArr[rightIdx];
                    rightIdx++;
                }
                currIdx++;
            }
            while (leftIdx < midIdx) {
                arr[currIdx] = leftArr[leftIdx];
                leftIdx++;
                currIdx++;
            }
            while (rightIdx < arr.length - midIdx) {
                arr[currIdx] = rightArr[rightIdx];
                rightIdx++;
                currIdx++;
            }
        }
    }

    /**
     * Implement LSD (least significant digit) radix sort.
     *
     * Make sure you code the algorithm as you have been taught it in class.
     * There are several versions of this algorithm and you may not get full
     * credit if you do not implement the one we have taught you!
     *
     * Remember you CANNOT convert the ints to strings at any point in your
     * code! Doing so may result in a 0 for the implementation.
     *
     * It should be:
     * out-of-place
     * stable
     * not adaptive
     *
     * Have a worst case running time of:
     * O(kn)
     *
     * And a best case running time of:
     * O(kn)
     *
     * You are allowed to make an initial O(n) passthrough of the array to
     * determine the number of iterations you need.
     *
     * At no point should you find yourself needing a way to exponentiate a
     * number; any such method would be non-O(1). Think about how how you can
     * get each power of BASE naturally and efficiently as the algorithm
     * progresses through each digit.
     *
     * Refer to the PDF for more information on LSD Radix Sort.
     *
     * You may use ArrayList or LinkedList if you wish, but it may only be
     * used inside radix sort and any radix sort helpers. Do NOT use these
     * classes with other sorts. However, be sure the List implementation you
     * choose allows for stability while being as efficient as possible.
     *
     * Do NOT use anything from the Math class except Math.abs().
     *
     * @param arr the array to be sorted
     * @throws java.lang.IllegalArgumentException if the array is null
     */
    public static void lsdRadixSort(int[] arr) {
        if (arr == null) {
            throw new IllegalArgumentException("Error. The array is null");
        }
        int maxNum = arr[0];
        int maxLength = 1;
        for (int i = 0; i < arr.length; i++) {
            if (Math.abs(arr[i]) > maxNum) {
                maxNum = Math.abs(arr[i]);
            }
        }
        while ((maxNum) >= 10) {
            maxLength++;
            maxNum = maxNum / 10;
        }
        List<Integer>[] buckets = new ArrayList[19];
        for (int i = 0; i < 19; i++) {
            buckets[i] = new ArrayList<Integer>();
        }
        int divNum = 1;
        for (int i = 0; i < maxLength; i++) {
            for (Integer num: arr) {
                buckets[((num / divNum) % 10) + 9].add(num);
            }
            int index = 0;
            for (int k = 0; k < buckets.length; k++) {
                for (Integer xx: buckets[k]) {
                    arr[index++] = xx;
                }
                buckets[k].clear();
            }
            divNum = divNum * 10;
        }
    }

    /**
     * Implement quick sort.
     *
     * Use the provided random object to select your pivots. For example if you
     * need a pivot between a (inclusive) and b (exclusive) where b > a, use
     * the following code:
     *
     * int pivotIndex = rand.nextInt(b - a) + a;
     *
     * If your recursion uses an inclusive b instead of an exclusive one,
     * the formula changes by adding 1 to the nextInt() call:
     *
     * int pivotIndex = rand.nextInt(b - a + 1) + a;
     *
     * It should be:
     * in-place
     * unstable
     * not adaptive
     *
     * Have a worst case running time of:
     * O(n^2)
     *
     * And a best case running time of:
     * O(n log n)
     *
     * Make sure you code the algorithm as you have been taught it in class.
     * There are several versions of this algorithm and you may not receive
     * credit if you do not use the one we have taught you!
     *
     * @param <T>        data type to sort
     * @param arr        the array that must be sorted after the method runs
     * @param comparator the Comparator used to compare the data in arr
     * @param rand       the Random object used to select pivots
     * @throws java.lang.IllegalArgumentException if the array or comparator or
     *                                            rand is null
     */
    public static <T> void quickSort(T[] arr, Comparator<T> comparator,
                                     Random rand) {
        if (arr == null) {
            throw new IllegalArgumentException("Error. The array is null");
        }
        if (comparator == null) {
            throw new IllegalArgumentException("Error. The comparator is null");
        }
        if (rand == null) {
            throw new IllegalArgumentException("Error. The rand is null");
        }
        qsHelper(arr, 0, arr.length - 1, comparator, rand);

    }
    /**
     * Implements quickSort.
     * Actual quick sort method.
     * @param <T> data type to sort
     * @param arr array sorted after method runs
     * @param right right number
     * @param left left number
     * @param comparator Comparator used to compare the data in array
     * @param rand Random object used to select pivots
     */
    private static <T> void qsHelper(T[] arr, int left, int right,
                                         Comparator<T> comparator, Random rand) {
        if (left >= right) {
            return;
        }
        int leftIdx = left + 1;
        int rightIdx = right;
        int pivotIdx = rand.nextInt(right - left) + left;
        T pivot = arr[pivotIdx];
        arr[pivotIdx] = arr[left];
        arr[left] = pivot;
        while (leftIdx < rightIdx) {
            while (leftIdx <= rightIdx
                    && comparator.compare(arr[leftIdx], pivot) <= 0) {
                leftIdx++;
            }
            while (leftIdx <= rightIdx
                    && comparator.compare(arr[rightIdx], pivot) >= 0) {
                rightIdx--;
            }
            if (leftIdx <= rightIdx) {
                T temp = arr[leftIdx];
                arr[leftIdx] = arr[rightIdx];
                arr[rightIdx] = temp;
                leftIdx++;
                rightIdx--;
            }
        }
        T temp = arr[rightIdx];
        arr[rightIdx] = arr[left];
        arr[left] = temp;
        if (left < rightIdx) {
            qsHelper(arr, left, rightIdx - 1, comparator, rand);
        }
        if (right > leftIdx) {
            qsHelper(arr, rightIdx + 1, right, comparator, rand);
        }
    }
}
