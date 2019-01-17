import java.util.ArrayList;
import java.util.List;

/**
 * Main Program to test classes.
 */
public class Main {

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
