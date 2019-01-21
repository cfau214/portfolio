package home.cf.sorting.BubbleSorter;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class BubbleSorterTest {

    @Test
    void sort_ShouldBeTrueWhenExpectedSortIsEqual() {

        BubbleSorter bs = new BubbleSorter();

        int[] original = {1,4,2,11,3,1,6,3,1};
        int[] expected = {1,1,1,2,3,3,4,6,11};

        int[] result = bs.sort(original);

        assertArrayEquals(expected, result);
    }
}