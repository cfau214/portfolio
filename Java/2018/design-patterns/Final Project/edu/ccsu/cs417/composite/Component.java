package edu.ccsu.cs417.composite;

import edu.ccsu.cs417.visitor.VisitableSensor;

/**
 * Part of the Composite Design Pattern
 * <p>
 * Provides functionality for an object to become part of a Composite
 *
 * @author Nicholas Daddona
 */
public interface Component extends VisitableSensor
{
    /**
     * Performs an operation on a Component or all Components if this object is a composite
     */
    void operation();

    /**
     * Returns a Composite reference if this Component is a Composite
     *
     * @return a Composite reference if this object is a Composite, null otherwise
     */
    Composite getComposite();
}
