package home.cf.strings.RegEx;

import org.junit.jupiter.api.Test;

import java.util.Arrays;

import static org.junit.jupiter.api.Assertions.*;

class RegExTest {

    @Test
    void split_ShouldCreateArrayOfWordsAndRemovePunctuation() {

        String toSplit = "This is a    ! test + sentence!!.";
        String[] expected = {"This", "is", "a", "test", "sentence"};

        // Split string using RegEx class method.
        RegEx re = new RegEx(toSplit);
        String[] result = re.split();

        assertArrayEquals(expected, result);
    }

    @Test
    void split_OverloadedStringParam_ShouldCreateArrayOfWordsAndRemovePunctuation() {

        String toSplit = "This is a    ! test + sentence!!.";
        String[] expected = {"This", "is", "a", "test", "sentence"};

        // Split string using RegEx class method.
        RegEx re = new RegEx();
        String[] result = re.split(toSplit);

        assertArrayEquals(expected, result);
    }
}