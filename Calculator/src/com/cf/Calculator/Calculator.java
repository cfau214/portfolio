package com.cf.Calculator;

/**
 * This class creates a represents a calculator object that has all of the non-scientific, basic functions of a calculator.
 *
 */

public class Calculator {

    /**
     * Default Constructor.
     */
    public Calculator() {}

    /**
     * Adds two integers n,m and returns the result.
     *
     * @param n int - First number.
     * @param m int - Second number.
     * @return int - Result of n + m.
     */
    public int add(int n, int m)
    {
        return n+m;
    }

    /**
     * Adds two decimal numbers n,m and returns the result.
     *
     * @param n double - First number.
     * @param m double - Second number.
     * @return double - Result of n + m.
     */
    public double add(double n, double m)
    {
        return n+m;
    }

    /**
     * Multiplies two integers n,m and returns the result.
     *
     * @param n int - First number.
     * @param m int - Second number.
     * @return int - Result of n * m.
     */
    public int multiply(int n, int m)
    {
        return n*m;
    }

    /**
     * Subtracts two integers n,m and returns the result.
     *
     * @param n int - First number.
     * @param m int - Second number.
     * @return int - Result of n - m.
     */
    public int subtract(int n, int m) { return n-m; }

    /**
     * Subtracts two decimal numbers n,m and returns the result.
     *
     * @param n double - First number.
     * @param m double - Second number.
     * @return double - Result of n - m.
     */
    @SuppressWarnings("unused")
    public double subtract(double n, double m) { return n-m; }

    /**
     * Multiplies two decimal numbers n,m and returns the result.
     *
     * @param n double - First number.
     * @param m double - Second number.
     * @return double - Result of n * m.
     */
    public double multiply(double n, double m)
    {
        return n*m;
    }

    /**
     * Multiplies two integers n,m RECURSIVELY and returns the result.
     *
     * @param n int - First number.
     * @param m int - Second number.
     * @return int - Result of n + n + n + ... 'm' number of times.
     */
    public int multiplyRecursive(int n, int m)
    {
        if (m == 0)
            return 0;
        else {
            return n + multiplyRecursive(n, m-1);
        }
    }

    /**
     * Divides two doubles n,m and returns the result.
     *
     * @param n double - Numerator.
     * @param d double - Denominator.
     * @return double - Result of n / d.
     */
    public double div(double n, double d) {

        if (d == 0)
            throw new IllegalArgumentException();
        return (double) n/d;
    }
}
