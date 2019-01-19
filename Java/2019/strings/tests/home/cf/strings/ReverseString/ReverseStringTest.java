package home.cf.strings.ReverseString;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ReverseStringTest {

    @Test
    void reverse_ShouldBeTrueWhenReversedEqualsExpectedAnswer() {

        ReverseString rs = new ReverseString();

        String original = "mystring";
        String answer = "gnirtsym";

        assertEquals(answer, rs.reverse(original));
        assertEquals("", rs.reverse(""));
    }

    @Test
    void getReversed_ShouldThrowNullPointerExceptionWhenNoStringPassedToRSClass() {

        ReverseString rs = new ReverseString();

        assertThrows(NullPointerException.class, rs::getReversed);
    }

    @Test
    void isPalindrome_ShouldBeTrueIfPalindrome() {
        ReverseString rs = new ReverseString("racecar");

        assertEquals("racecar", rs.getReversed());
        assertTrue(rs.isPalindrome());
    }
}