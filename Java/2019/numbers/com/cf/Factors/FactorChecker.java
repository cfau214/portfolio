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

    public static void main(String[] args) {
        List<Integer> factors = new ArrayList<Integer>();
        int num = 57;
        String output = "Factors of " + num + ": ";

        factors = listFactors(num);

        if (factors.isEmpty()) {
            output = num + " is a prime number. No factors found.";
        }
        else {
            for (int factor : factors) {
                output += factor + ", ";
            }
        }

        System.out.println(output);
    }

    public static List<Integer> listFactors(int n) {

        List<Integer> factors = new ArrayList<>();

        for (int i = 2; i <= Math.ceil(n/2); i++) {
            if (n % i == 0)
                factors.add(i);
        }

        return factors;
    }


    public static boolean isEven(int num) {
        return (num %2 == 0);
    }
}
