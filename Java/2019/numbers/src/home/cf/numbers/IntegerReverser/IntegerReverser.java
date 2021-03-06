package home.cf.numbers.IntegerReverser;

/**
 * IntegerReverser has a single method that will return a reversed copy of an integer.
 *
 * @author Chris Fauteux
 * @since 2019
 */
public class IntegerReverser {

    /**
     * Reverses passed integer and returns the result.
     *
     * @param original number to be reversed.
     * @return reversed number.
     */
    public int reverse(int original) {

        String reverse = "";

        /* Add last digit to reverse string and divide original number by 10 for each iteration.
           This will drop the last integer after adding it to the final result.
         */
        while (original > 10) {
            reverse += original % 10;
            original /= 10;
        }

        reverse += original;

        return Integer.parseInt(reverse);
    }
}
