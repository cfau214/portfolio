package edu.ccsu.cs417.raspberry;

import edu.ccsu.cs417.composite.Component;
import edu.ccsu.cs417.observer.Observer;
import edu.ccsu.cs417.raspberry.grove.led.LedState;

/**
 * Part of the Abstract Factory Pattern
 * An interface for the Led
 */
public interface Led extends PiSensor, Component, Observer
{
    /**
     * Returns the Led's current state
     *
     * @return the current state of the Led
     */
    LedState getState();

    /**
     * Changes the Led's state to the next state as defined by it's current state
     */
    void nextState();

    /**
     * Determines if the Led is turned on
     *
     * @return true if the led is turned on, false otherwise
     */
    boolean isOn();

    /**
     * Turns the Led on, the way the Led illuminates depends on its state
     */
    void turnOn();

    /**
     * Turns the Led off, Led maintains it's LedState even when off
     */
    void turnOff();

    /**
     * Returns and resets the number of times the Led has been turned on
     *
     * @return the number of times the Led has been turned on
     */
    int getTimesTurnedOn();
}
