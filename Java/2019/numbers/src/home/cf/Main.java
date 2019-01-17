package home.cf;

import home.cf.Factors.*;
import home.cf.Primes.*;

/**
 * Main Program to test classes.
 */
public class Main {

    public static void main(String[] args) {

        /* PrimeChecker */
        PrimeChecker pc = PrimeChecker.INSTANCE;
        System.out.println(pc.checkPrime(22));
    }
}
