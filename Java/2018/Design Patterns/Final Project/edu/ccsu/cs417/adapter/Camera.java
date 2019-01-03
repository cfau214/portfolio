package edu.ccsu.cs417.adapter;

import edu.ccsu.cs417.composite.Component;
import edu.ccsu.cs417.observer.Observer;

/**
 * Part of the Adapter Pattern
 * <p>
 * Is the domain specific target that is used by the Client
 *
 * @author Nicholas Pipino
 */
public interface Camera extends Observer, Component
{

    /**
     * Takes a picture using the raspberry pi camera
     */
    void takePic();

    /**
     * Returns and resets the number of pictures taken
     *
     * @return the number of pictures taken
     */
    int getPicturesTaken();
}
