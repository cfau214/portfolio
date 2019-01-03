package edu.ccsu.cs417.iterator;

/**
 * List is the AbstractCollection interface used in the Iterator design pattern.
 * <p>
 * Any class that implements this interface will be able to return a type of concrete iterator that is used in
 * conjunction with the Iterator interface.
 *
 * @author Chris Fauteux
 */
public interface List<E>
{

    /**
     * Adds an element to the end of the list
     *
     * @param element the element to be added to the list
     */
    void add(E element);

    /**
     * Adds an element to the specified position in the list
     *
     * @param index   the index of the new element
     * @param element the element to be added to the list
     */
    void add(int index, E element);

    /**
     * Determines if the list is empty
     *
     * @return true if the list is empty, false otherwise
     */
    boolean isEmpty();

    /**
     * Removes the specified element from the list
     *
     * @param element the element marked for removal
     * @return the removed element
     */
    E remove(E element);

    /**
     * Removes the element at the specified position in the list
     *
     * @param index the index of the element marked for removal
     * @return the data of the removed element
     */
    E remove(int index);

    /**
     * Returns the number of elements in the list
     *
     * @return the number of elements in the list
     */
    int size();

    /**
     * Returns a concrete iterator that implements this interface.
     *
     * @return a concrete iterator class.
     */
    Iterator<E> iterator();
}
