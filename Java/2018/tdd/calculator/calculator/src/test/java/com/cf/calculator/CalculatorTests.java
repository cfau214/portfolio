package com.cf.calculator;

import org.junit.Test;

import static org.junit.Assert.*;

import org.hamcrest.core.IsAnything;
import org.junit.Before;
import org.junit.BeforeClass;

/**
 * Unit test for simple App.
 */
public class CalculatorTests {
    /**
     * Rigorous Test.
     */
    
    Calculator calc = new Calculator();     // initialize calculator used in tests.

    @Test
    public void testApp() {
        assertTrue(true);
    }

    @Test
    public void add_checkThatAddReturnsInteger() {
        int a = 3;
        int b = 7;

        int result = a+b;

        assertEquals(result, calc.add(3,6));
    }
}
