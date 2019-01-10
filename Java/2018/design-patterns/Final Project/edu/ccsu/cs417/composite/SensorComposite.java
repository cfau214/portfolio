package edu.ccsu.cs417.composite;

import edu.ccsu.cs417.iterator.LinkedList;

/**
 * Part of the Composite Design pattern
 *
 * An Implementation of a Composite designed to hold multiple sensors for reading
 */
public class SensorComposite extends AbstractComposite
{
    /**
     * Creates an empty composite
     */
    public SensorComposite()
    {
        componentList = new LinkedList<>();
    }
}
