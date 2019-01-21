package home.cf.sorting.InsertionSorter;

/**
 * InsertionSorter implements the Insertion Sorting algorithm.
 *
 * @author Chris Fauteux
 * @since 2019
 */
public class InsertionSorter {

    /**
     * Sorts an array of integers using the insertion sorting algorithm.
     *
     * @param array integer array to be sorted.
     * @return sorted array.
     */
    public int[] sort(int[] array) {

        for (int i = 0; i < array.length; i++) {

            int j = i;

            while (j > 0) {
                if (array[j] < array[j - 1]) {
                    int temp = array[j - 1];
                    array[j - 1] = array[j];
                    array[j] = temp;
                }

                j--;
            }
        }

        return array;
    }
}
