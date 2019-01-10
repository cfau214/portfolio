package edu.ccsu.cs417.iterator;

/**
 * The LinkedList Class was designed to show the use of three design patterns:
 * Static nested class, private inner class and a custom Iterator.
 * <p>
 * LinkedList can add and remove Objects from an unsorted list and will also provide
 * Iterator functionality to allow bi-directional traversal.
 *
 * @author Chris Fauteux
 * @author Nicholas Daddona
 */

public class LinkedList<E> implements List<E>
{

    /**
     * Sentinel head node in the list
     */
    protected final Node<E> header;

    /**
     * Sentinel tail node in the list
     */
    protected final Node<E> trailer;

    /**
     * The number of elements in the list
     */
    protected int size;

    /**
     * Creates an empty linked list
     */
    public LinkedList()
    {
        header = new Node<>(null);
        trailer = new Node<>(null);
        header.next = trailer;
        trailer.prev = header;
        size = 0;
    }

    /**
     * Adds an element to the end of the list
     *
     * @param element the element to be added to the list
     */
    @Override
    public void add(E element)
    {
        // Check for null parameter.
        if (element == null) { // this could be changed to an invalid parameter exception
            throw new NullPointerException("Invalid parameter.");
        }
        link(trailer.prev, trailer, element); // link to the end of the list
    }

    /**
     * Adds an element to the specified position in the list
     *
     * @param index   the index of the new element
     * @param element the element to be added to the list
     */
    @Override
    public void add(int index, E element)
    {
        if (size - 1 < index) {
            add(element); // if out of bounds, add to the end of the list
        }
        else {
            Node<E> current = header.next;
            for (int i = 0; i < index; i++) {
                current = current.next;
            }
            link(current.prev, current, element);
        }
    }

    /**
     * Determines if the list is empty
     *
     * @return true if the list is empty, false otherwise
     */
    @Override
    public boolean isEmpty()
    {
        return size == 0;
    }

    /**
     * Removes the specified element from the list, if it's there
     *
     * @return the removed element
     */
    @Override
    public E remove(E element)
    {
        Node<E> current = header.next;
        while (current != trailer && !current.data.equals(element)) {
            current = current.next;
        }
        if (current == trailer) {
            return null;
        }
        else {
            return deLink(current);
        }
    }

    /**
     * Removes the element at the specified position in the list
     *
     * @param index the index of the element marked for removal
     * @return the data of the removed element
     */
    @Override
    public E remove(int index)
    {
        if (index < 0) {
            throw new IndexOutOfBoundsException("Index must be greater than 0");
        }
        if (size - 1 < index) {
            return null; // can throw an exception here instead
        }
        Node<E> current = header.next;
        for (int i = 0; i < index; i++) {
            current = current.next;
        }
        return deLink(current);
    }

    /**
     * Returns the number of elements in the list
     *
     * @return the number of elements in the list
     */
    @Override
    public int size()
    {
        return size;
    }

    /**
     * Returns concrete Iterator that will be used in our list.
     *
     * @return a new Iterator for the list
     */
    @Override
    public Iterator<E> iterator()
    {
        return new LinkedListIterator();
    }

    /**
     * Creates and links a new node between two existing nodes
     *
     * @param before     the node before the insertion point
     * @param after      the node after the insertion point
     * @param newElement the new element for the list
     */
    private void link(Node<E> before, Node<E> after, E newElement)
    {
        Node<E> node = new Node<>(newElement);
        node.next = after;
        node.prev = before;
        before.next = node;
        after.prev = node;
        size++;
    }

    /**
     * Delinks a node from the list and returns its data
     *
     * @param node the node to be removed from the list
     * @return the data of the removed node
     */
    private E deLink(Node<E> node)
    {
        Node<E> successor = node.next;
        Node<E> predecessor = node.prev;
        predecessor.next = successor;
        successor.prev = predecessor;
        node.next = null; // may be redundant
        node.prev = null;
        size--;
        return node.data;
    }

    /**
     * Determines if this object is equal to another object
     *
     * @param obj the object this object is being compared to
     * @return true if the objects are equal, false otherwise
     */
    public boolean equals(Object obj)
    {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (obj instanceof LinkedList) {
            LinkedList<?> other = (LinkedList) obj;
            boolean status = this.size() == other.size();
            Iterator<E> thisiter = iterator();
            Iterator<?> otheriter = other.iterator();
            while (status && thisiter.hasNext() && otheriter.hasNext()) {
                status = thisiter.next().equals(otheriter.next());
            }
            return status;
        }
        return false;
    }

    /**
     * Returns a hash code for this object
     *
     * @return a hash value for this object
     */
    public int hashCode()
    {
        int hash = 17;
        Iterator<E> iter = iterator();
        while (iter.hasNext()) {
            hash *= 37 + iter.next().hashCode();
        }
        return hash;
    }

    /**
     * Returns a String representation of this Object
     *
     * @return a string containing information on this object
     */
    public String toString()
    {
        StringBuilder str = new StringBuilder();
        str.append("Linked List Contents with size ").append(size).append("\n");
        Iterator<E> iter = iterator();
        while (iter.hasNext()) {
            str.append(iter.next().toString()).append("\n");
        }
        return str.toString();
    }

    /**
     * Node is a nested static class used in LinkedList.
     * Each node can view other nodes in the list bidirectionally.
     */
    static protected class Node<E>
    {
        E data;        // Data stored by each node.
        Node<E> next, prev;    // List is bidirectional.

        /**
         * Default Constructor.
         *
         * @param data the data of type E the node will hold
         */
        protected Node(E data)
        {
            this.data = data;
        }

        /**
         * Determines if this object is equal to another object
         *
         * @param obj the object this object is being compared to
         * @return true if the objects are equal, false otherwise
         */
        @Override
        public boolean equals(Object obj)
        {
            if (obj == null) {
                return false;
            }
            if (obj == this) {
                return true;
            }
            if (obj instanceof Node) { // compare data of nodes and references to other nodes
                Node<?> other = (Node) obj;
                boolean status;
                if (this.data != null) { // check for null data for sentinel nodes and nodes with no data
                    status = this.data.equals(other.data);
                }
                else {
                    status = other.data == null;
                }
                return status && this.next == other.next && this.prev == other.prev;
            }
            return false;
        }

        /**
         * Returns a hash code for this object
         *
         * @return a hash value for this object
         */
        @Override
        public int hashCode()
        {
            int hash = 11;
            if (next.data != null) {
                hash *= 37 + next.data.hashCode();
            }
            if (prev.data != null) {
                hash *= 37 + prev.data.hashCode();
            }
            if (data != null) {
                hash *= 37 + data.hashCode();
            }
            return hash;
        }

        /**
         * Returns a String representation of this Object
         *
         * @return a string containing information on this object
         */
        public String toString()
        {
            String str = "";
            if (prev != null) {
                str += "Previous Data " + prev.data.toString() + " ";
            }
            if (next != null) {
                str += "Next Data " + next.data.toString() + " ";
            }
            if (data != null) {
                str += "Current Data " + data.toString();
            }
            return str;
        }
    }

    /**
     * LinkedListIterator has the implementation for our Concrete Iterator.
     */
    private class LinkedListIterator implements Iterator<E>
    {

        Node<E> curNode = header;    // Current position in list.

        /**
         * Moves Iterator to next Object in list.
         */
        @Override
        public E next()
        {
            if (this.hasNext()) {
                curNode = curNode.next;
            }
            return curNode.data;
        }

        /**
         * Moves Iterator to previous Object in list.
         */
        @Override
        public void prev()
        {
            if (curNode != header) { // List cannot move before the head.
                curNode = curNode.prev;
            }
        }

        /**
         * Checks if there are more items in the list.
         *
         * @return true if list is not empty, false if list is empty.
         */
        @Override
        public boolean hasNext()
        {
            return curNode.next != trailer;
        }

        /**
         * Removes an item from the list.
         */
        @Override
        public void remove()
        {
            // Check that list is not empty.
            if (!isEmpty() && curNode != header) {
                // Check if there is only one item in list.
                if (size() == 1) {
                    deLink(header.next);
                    curNode = trailer;
                }
                else {
                    deLink(curNode.prev);
                }
            }
        }

        /**
         * Determines if this object is equal to another object
         *
         * @param obj the object this object is being compared to
         * @return true if the objects are equal, false otherwise
         */
        @Override
        public boolean equals(Object obj)
        {
            if (obj == null) {
                return false;
            }
            if (obj == this) {
                return true;
            }
            if (obj instanceof LinkedList.LinkedListIterator) {
                LinkedList<?>.LinkedListIterator other = (LinkedList<?>.LinkedListIterator) obj;
                return this.curNode.equals(other.curNode);
            }
            return false;
        }

        /**
         * Returns a hash code for this object
         *
         * @return a hash value for this object
         */
        @Override
        public int hashCode()
        {
            int hash = 37;
            if (curNode.data != null) {
                hash *= 11 + curNode.data.hashCode();
            }
            return hash;
        }

        /**
         * Returns a String representation of this Object
         *
         * @return a string containing information on this object
         */
        public String toString()
        {
            return "Current Item Info: " + curNode.data.toString();
        }
    }
}
