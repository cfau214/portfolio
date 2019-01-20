package home.cf.strings.RegEx;

/**
 * RegEx is a class that will accept a sentence and return a String array of the words in that sentence.
 * Used for testing regex expressions.
 *
 * @author Chris Fauteux
 */
public class RegEx {

    String sentence;        // Sentence to be converted to array.
    String[] words;         // Array of words in sentence.

    /**
     * Default Constructor
     */
    public RegEx() {

    }

    /**
     * Overloaded Constructor
     *
     * @param sentence string to be converted to array.
     */
    public RegEx(String sentence) {
        this.sentence = sentence;
    }

    /**
     * Returns an array of words after splitting the sentence with a regular expression.
     * No parameter method will use RegEx sentence passed in default constructor.
     *
     * @return
     */
    public String[] split() {
        words = sentence.split("\\W+");

        return words;
    }

    /**
     * Returns an array of words after splitting the sentence with a regular expression.
     *
     * @param sentence string to be converted to array.
     * @return
     */
    public String[] split(String sentence) {
        this.sentence = sentence;
        words = sentence.split("\\W+");

        return words;
    }
}
