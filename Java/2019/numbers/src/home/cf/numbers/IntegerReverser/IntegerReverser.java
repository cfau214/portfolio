package home.cf.numbers.IntegerReverser;

/**
 * IntegerReverser has a single method that will return a reversed copy of an integer.
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

        while (original > 10) {
            reverse += original % 10;
            original /= 10;
        }

        reverse += original;

        return Integer.parseInt(reverse);
    }
}
