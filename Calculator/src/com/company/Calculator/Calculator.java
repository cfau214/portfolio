package com.company.Calculator;

/**
 * This class creates a calculator object that has all of the non-scientific functions of a calculator.
 *
 */

public class Calculator {

    /**
     * Default Constructor.
     */
    public Calculator() {}

    /**
     * Adds two integers n,m and returns the result.
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
     * @param n int - First number.
     * @param m int - Second number.
     * @return int - Result of n * m.
     */
    public int multiply(int n, int m)
    {
        return n*m;
    }

    /**
     * Multiplies two decimal numbers n,m and returns the result.
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
     * @param n int - First number.
     * @param m int - Second number.
     * @return int - Result of n + n + n + ... 'm' number of times.
     */
    public int multiplyRecursive(int n, int m)
    {
        if (m == 0)
            return 0;
        else {
            return n + multRecur(n, m-1);
        }
    }

    /**
     * Divides two doubles n,m and returns the result.
     * @param n int - Numerator.
     * @param d int - Denominator.
     * @return int - Result of n / d.
     */
    public double div (int n, int d)
    {
        return (double) n/d;
    }
}
