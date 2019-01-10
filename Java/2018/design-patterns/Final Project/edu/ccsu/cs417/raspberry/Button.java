package edu.ccsu.cs417.raspberry;

/**
 * Part of the Abstract Factory Pattern
 * An interface for the Button
 */
public interface Button extends PiSensor
{
    /**
     * Checks if the button is currently being pressed
     *
     * @return true if the button is being pressed, false otherwise
     */
    boolean isPressed();


    /**
     * Returns and resets the count of how many times the button has been pressed
     *
     * @return the number of times the button was pressed since the last check
     */
    int getNumPressed();

}
