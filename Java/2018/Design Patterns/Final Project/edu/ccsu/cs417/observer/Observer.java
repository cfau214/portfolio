package edu.ccsu.cs417.observer;

/**
 * @author Nicholas Daddona
 *
 * Part of the Observer Pattern, Provides an interface through which a class can monitor the state of another object.
 *
 * When a Subject the Observer is watching has its state changed, said subject will call Update
 */
public interface Observer
{
    /**
     * Notifies this Observer in a change in the state of the Subject its watching
     */
    public void update();
}
