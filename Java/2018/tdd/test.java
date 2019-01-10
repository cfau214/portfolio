package tdd;

import org.junit.jupiter.api.Test;

public class test {

    @Test
    public void shouldReturnTrueIfBothParamInt() {
        StringCalculator tester = new StringCalculator();

        int a = 5;
        String b = "C";
        int c = 7;

        // assert statements
        assertTrue(tester.add(a,b));
        assertTrue(test.add(a,c));
    }
}