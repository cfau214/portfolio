package home.cf.sorting.InsertionSorter;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class InsertionSorterTest {

    @Test
    void sort_ShouldEqualExpectedAfterSorting() {

        InsertionSorter is = new InsertionSorter();

        int[] original = {1,9,5,3,11,2};
        int[] expected = {1,2,3,5,9,11};

        int[] result = is.sort(original);

        assertArrayEquals(expected, result);
    }
}