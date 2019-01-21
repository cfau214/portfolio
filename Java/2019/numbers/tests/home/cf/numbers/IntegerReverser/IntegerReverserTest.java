package home.cf.numbers.IntegerReverser;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class IntegerReverserTest {

    @Test
    void reverse_PassedNumberShouldEqualReversedNumber() {

        IntegerReverser pc = new IntegerReverser();

        int original = 12345;
        int expected = 54321;

        int result = pc.reverse(original);

        assertEquals(expected, result);
    }
}