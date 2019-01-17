package home.cf.Factors;

import com.sun.javaws.exceptions.InvalidArgumentException;

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
    INSTANCE;

    /**
     * Lists all factors of n.
     *
     * @param n number to check factors of
     * @return list of factors.
     */
    public List<Integer> getFactors(int n) {

        List<Integer> factors = new ArrayList<>();  // List to store factors of n.

        /* Check that n is a valid integer before finding factors.  */
        if (isValid(n)) {
            final int LIMIT = n / 2;      // Upper limit to check when looking for factors.

            //Find each factor of n.
            for (int i = 1; i <= LIMIT; i++) {
                if (n % i == 0)
                    factors.add(i);
            }

            factors.add(n);     // List will show initial number as the last factor.
        }

        return factors;
    }

    /**
     * Checks if a number is valid for factoring.
     *
     * @param num number to check.
     * @return true if valid.
     */
    private boolean isValid(Integer num) {

        // Check that num is an integer and num > 1.
        if (!Integer.class.isInstance(num)) {
            throw new IllegalArgumentException("Number not valid. Cannot find factors.");
        }

        return num > 1;
    }
}
