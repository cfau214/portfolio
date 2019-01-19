package home.cf.numbers.Fibonacci;

import java.util.List;
import java.util.ArrayList;

/**
 * FactorChecker is a Singleton that has the appropriate methods to check if an integer has factors.
 * <p>
 * This class will maintain a list of factors for the most recent number passed into the getFactors() function.
 *
 * @author Chris Fauteux
 * @since 2019
 *
 * Fn = Fn-1 + Fn-2
 */
public class FibCalculator {

    private List<Integer> fibList;      // Most recent list calculated.

    /**
     * Overloaded Constructor. Makes list with passed parameter.
     *
     * @param listSize number of fibonacci numbers to generate.
     */
    public FibCalculator(int listSize) {
        makeList(listSize);
    }

    /**
     * Generate a list of fibonacci numbers using the fibonacci sequence: Fn = Fn-1 + Fn-2.
     *
     * @param listSize number of fibonacci numbers to generate.
     */
    public void makeList(int listSize) {

        if (listSize == 0) {
            throw new IllegalArgumentException();
        }

        fibList = new ArrayList<>();

        for (int i = 1; i <= listSize; i++) {

            if (i == 1 || i == 2)
                fibList.add(1);
            else {
                fibList.add(fibList.get(i-2) + fibList.get(i-3));
            }
        }
    }

    /**
     * Returns list of fibonacci numbers that was most recently generated.
     * @return list of fibonacci numbers.
     */
    public List<Integer> getList() {
        return fibList;
    }

    /**
     * Prints list of fibonacci numbers to console.
     */
    public void printList() {
        String out = "List of first " + fibList.size() + " numbers in Fibonacci sequence: \n";

        for (Integer current : fibList) {
            out += current + ", ";
        }

        out = out.replaceAll(", $", "");    // Remove trailing comma before printing to console.
        System.out.println(out);
    }
}
