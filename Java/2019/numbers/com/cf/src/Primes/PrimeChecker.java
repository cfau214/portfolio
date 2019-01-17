
/**
 * PrimeChecker is a Singleton that has the appropriate methods to check if an integer is a prime number.
 * <p>
 * By definition a prime number is an integer greater than 1 that cannot be formed by multiplying
 * two smaller integers greater than 1.
 *
 * @author Chris Fauteux
 * @since 2019
 */
public enum PrimeChecker {
    INSTANCE;

    /**
     * Checks if a number is prime.
     *
     * @param n number to check.
     * @return true if prime; false if not.
     */
    public boolean checkPrime(int n) {

        boolean hasFactor = false;    // Flag used while calculating if n is prime.

        /* If n is even, check all numbers >= 2.
           Else only check odd numbers >= 3.
         */
        if (isEven(n)) {

            for (int i = 2; i < Math.ceil(n / 2); i++) {

                // If factor found, n is not a prime number.
                if (isFactor(n, i)) {
                    hasFactor = true;
                    break;
                }
            }
        } else {

            for (int i = 3; i < Math.ceil(n / 2); i += 2) {

                // If factor found, n is not a prime number.
                if (isFactor(n, i)) {
                    hasFactor = true;
                    break;
                }
            }
        }

        return (!hasFactor);    // If factor was found, return false because n is not prime.
    }

    /**
     * Checks if a number is even.
     *
     * @param n number to check.
     * @return true if even; false if not.
     */
    private boolean isEven(int n) {
        return (n % 2 == 0);
    }

    /**
     * Checks if a number has a factor.
     *
     * @param num  original number
     * @param num2 factor to check
     * @return true if num2 is a factor of num.
     */
    private boolean isFactor(int num, int num2) {
        return (num % num2 == 0);
    }
}
