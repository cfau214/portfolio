package home.cf.strings.ReverseString;

/**
 * ReverseString is a class that takes a string and returns a reversed copy of the string.
 * This class can also check if the reversed string is a palindrome of the original.
 */
public class ReverseString {

    private String original;
    private String reversed;

    /**
     * Default Constructor. No string is reversed until reverse() is called when using this constructor.
     */
    public ReverseString() {

    }

    /**
     * Overloaded Constructor. Reverses string that is passed.
     *
     * @param original string to be reversed.
     */
    public ReverseString(String original) {
        reverse(original);
    }

    /**
     * Reverses a string.
     *
     * @param original string to be reversed.
     * @return reversed string.
     */
    public String reverse(String original) {

        this.original = original;
        this.reversed = "";

        for (int i = original.length()-1; i >= 0; i--)
        {
            reversed += original.charAt(i);
        }

        return reversed;
    }

    /**
     * Returns most recently reversed string.
     *
     * @return recently reversed string.
     */
    public String getReversed() {
        return reversed;
    }

    /**
     * Check if the most recently reversed string is a palindrome of the original.
     * A palindrome is a string that, when reversed, is equal to the original.
     *
     * @return true if palindrome, false if not a palindrome.
     */
    public boolean isPalindrome() {
        if (original.equals(reversed))
            return true;

        return false;
    }
}
