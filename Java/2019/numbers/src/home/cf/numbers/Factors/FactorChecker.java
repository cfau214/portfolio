package home.cf.numbers.Factors;

import java.util.ArrayList;
import java.util.List;


/**
 * FactorChecker is a Singleton that has the appropriate methods to check if an integer has factors.
 * <p>
 * This class will maintain a list of factors for the most recent number passed into the getFactors() function.
 *
 * @author Chris Fauteux
 * @since 2019
 */
public enum FactorChecker {
    INSTANCE;   // Singleton Instance

    private int lastNum = -1;           // Last number checked. Initialized to -1 so null check not required.
    private List<Integer> factors;      // List of all factors for last number checked.

    /**
     * Calls methods that will populate the list with factors of n, and then return that list formatted as a string.
     *
     * @param n number to factor.
     * @return string representation of the list.
     */
    public String getFactors(int n) {

        /* Check if last number factored = n.
           If equal, the factors are already in list, if not equal calculate factors. */
        if (n != lastNum) {
            calcFactors(n);
        }

        return listFactors();
    }

    /**
     * Finds all factors of n and adds them to the FactorChecker factors list.
     *
     * @param n number to factor.
     */
    private void calcFactors(int n) {

        /* Check that n is a valid integer before finding factors.  */
        if (isValid(n)) {

            factors = new ArrayList<>();  // List to store factors of n.
            lastNum = n;                  // Update last number factored to current number.
            final int LIMIT = n / 2;      // Upper limit to check when looking for factors.

            //Find each factor of n.
            for (int i = 1; i <= LIMIT; i++) {
                if (n % i == 0)
                    factors.add(i);
            }

            factors.add(n);     // List will show initial number as the last factor.
        }
    }

    /**
     * Returns a string representation of the list of factors.
     *
     * @return string representation of the list of factors.
     */
    private String listFactors() {
        String str = "Factors of " + lastNum + ": \n" + "----------------------\n";

        for (Integer factor : factors) {
            str += factor + "\n";
        }

        return str;
    }

    /**
     * Checks if a number is valid for factoring.
     *
     * @param num number to check.
     * @return true if valid.
     */
    private boolean isValid(Integer num) {

        // Check that num is an integer and num > 1.
        if (num == null) {
            throw new IllegalArgumentException("Number not valid. Cannot find factors.");
        }

        return num > 1;
    }
}
