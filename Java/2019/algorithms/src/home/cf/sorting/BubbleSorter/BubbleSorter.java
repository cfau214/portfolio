package home.cf.sorting.BubbleSorter;

/**
 * BubbleSorter implements the Bubble Sorting algorithm.
 */
public class BubbleSorter {

    /**
     * Sorts an integer array using the optimized bubble sorting algorithm.
     *
     * @param array integer array to be sorted.
     * @return sorted array.
     */
    public int[] sort(int[] array) {

        int loop = array.length;    // Used for looping.

        for (int i = 0; i < loop - 1; i++) {
            boolean swapped = false;

            for (int j = 0; j < loop - 1; j++) {
                // Swap elements if prev > next
                if (array[j] > array[j + 1]) {
                    int temp = array[j + 1];
                    array[j + 1] = array[j];
                    array[j] = temp;

                    swapped = true;
                }
            }

            if (!swapped)   // False when array is sorted after iteration.
                break;
        }

        return array;
    }
}
