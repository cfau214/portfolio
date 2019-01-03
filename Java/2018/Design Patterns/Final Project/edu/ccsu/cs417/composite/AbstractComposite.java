package edu.ccsu.cs417.composite;

import edu.ccsu.cs417.iterator.Iterator;
import edu.ccsu.cs417.iterator.List;
import edu.ccsu.cs417.visitor.SensorVisitor;

/**
 * Part of the Composite Design Pattern
 * <p>
 * Provides the default implementation of a Composite
 *
 * @author Nicholas Daddona
 */
public abstract class AbstractComposite implements Composite
{
    /**
     * The List of Components this composite has
     */
    protected List<Component> componentList;

    /**
     * Adds a Component to the Composite
     *
     * @param component the component being added
     */
    @Override
    public void addComponent(Component component)
    {
        componentList.add(component);
    }

    /**
     * Returns a Composite reference if this Component is a Composite
     *
     * @return a Composite reference if this object is a Composite, null otherwise
     */
    @Override
    public Composite getComposite()
    {
        return this;
    }

    /**
     * Returns an Iterator for this Composite
     *
     * @return a new Iterator for this Composite
     */
    @Override
    public Iterator<Component> iterator()
    {
        return componentList.iterator();
    }

    /**
     * Removes the selected Component from the Composite, if its a part of this Composite
     *
     * @param component the component marked for removal
     */
    @Override
    public void removeComponent(Component component)
    {
        componentList.remove(component);
    }

    /**
     * Performs an operation on a Component or all Components if this object is a composite
     */
    @Override
    public void operation()
    {
        Iterator<Component> iterator = iterator(); // obtain an iterator
        while (iterator.hasNext()) { // take a reading on every Component of this Composite
            iterator.next().operation();
        }
    }

    /**
     * Accepts a SensorVistor by having all of this composite's components also accept the visitor
     *
     * @param visitor the SensorVisitor visiting this object
     */
    @Override
    public void accept(SensorVisitor visitor)
    {
        Iterator<Component> iterator = iterator(); // obtain an iterator
        while (iterator.hasNext()) {
            iterator.next().accept(visitor); // send the visitor to all Components of this Composite
        }
    }

    /**
     * Determines if this object is equal to another
     *
     * @param obj the other object
     * @return true if both objects are equal, false otherwise
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
        if (obj instanceof AbstractComposite) {
            return this.componentList.equals(((AbstractComposite) obj).componentList);
        }
        else {
            return false;
        }
    }

    /**
     * Returns a hashcode value for this object
     *
     * @return an integer hash value for this object
     */
    @Override
    public int hashCode()
    {
        return 37 + 11 * componentList.hashCode();
    }

    /**
     * Returns a String representation of this object
     *
     * @return a string representation of this object
     */
    @Override
    public String toString()
    {
        return componentList.toString();
    }
}
