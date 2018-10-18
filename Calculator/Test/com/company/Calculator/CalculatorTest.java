package com.company.Calculator;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class CalculatorTest {

    private static Calculator myCalc;

    @BeforeAll
    public static void setUp() throws Exception {
        myCalc = new Calculator();
    }

    @Test
    void add() {

        int op1 = 3;
        int op2 = 2;

        int expectedVal = 5;

        assertTrue(expectedVal == myCalc.add(op1, op2));
    }
}