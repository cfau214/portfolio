package com.cf.Calculator;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class CalculatorTest {

    private static Calculator myCalc;

    @BeforeAll
    static void setUp() {
        myCalc = new Calculator();
    }

    @Test
    void shouldReturnTrueIfExpectedvalEqualsAddInt1Int2() {
        /* Calculator.add(int, int)     */

        int op1 = 3;
        int op2 = 2;

        int expectedVal = 5;

        assertEquals(expectedVal, myCalc.add(op1, op2));
    }

    @Test
    void shouldReturnTrueIfExpectedvalEqualsAddDouble1Double2() {
        /* Calculator.add(double, double)   */

        double op1 = 3.5;
        double op2 = 4.2;

        double expectedVal = 7.7;

        assertEquals(expectedVal, myCalc.add(op1, op2));
    }

    @Test
    void shouldReturnTrueIfN1DivN2() {
        /* Calculator.div(double,double)    */

        double numerator = 4.0;
        double denominator = 2.0;

        double expectedVal = 2.0;

        assertEquals(expectedVal, myCalc.div(numerator, denominator));
    }

    @Test
    void shouldThrowIllegalArgumentExceptionWhenDivideByZero() {
        /* Calculator.div(double,0)     */

        double numerator = 4.0;
        double denominator = 0.0;

        assertThrows(IllegalArgumentException.class, () ->{
            myCalc.div(numerator,denominator);
        });

    }
}