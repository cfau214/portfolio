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
        System.out.println(pc.isPrime(22));
        System.out.println(pc.isPrime(2));
        System.out.println(pc.isPrime(13));
        System.out.println("\n");

        /* FactorChecker*/
        FactorChecker fc = FactorChecker.INSTANCE;
        System.out.println(fc.getFactors(7));
        System.out.println(fc.getFactors(40));
        System.out.println(fc.getFactors(55));
        System.out.println(fc.getFactors(3));
    }
}
