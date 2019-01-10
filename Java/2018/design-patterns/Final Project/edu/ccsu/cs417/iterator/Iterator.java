package edu.ccsu.cs417.iterator;

/**
 * Iterator is an interface used to implement the Iterator design pattern.
 *
 * @author Chris Fauteux
 */
public interface Iterator<E> extends java.util.Iterator<E> {

    /**
     * Go to previous item in list.
     */
    void prev();
}