package edu.ccsu.cs417.composite;

import edu.ccsu.cs417.iterator.Iterator;

/**
 * Part of the Composite Design Pattern
 * <p>
 * Provides extended functionality for a class to become a Composite of other Components
 *
 * @author Nicholas Daddona
 */
public interface Composite extends Component
{
    /**
     * Adds a Component to the Composite
     *
     * @param component the component being added
     */
    void addComponent(Component component);

    /**
     * Removes the selected Component from the Composite, if its a part of this Composite
     *
     * @param component the component marked for removal
     */
    void removeComponent(Component component);

    /**
     * Returns an Iterator for this Composite
     *
     * @return a new Iterator for this Composite
     */
    Iterator<Component> iterator();
}
