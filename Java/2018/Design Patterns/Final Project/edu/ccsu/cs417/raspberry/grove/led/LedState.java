package edu.ccsu.cs417.raspberry.grove.led;

/**
 * LedState is an interface used to implement the State design pattern.
 * <p>
 * This interface's current implementation will receive a major rework of all methods
 * as we add functionality to our Led class.
 *
 * @author Chris Fauteux
 * @author Nicholas Daddona
 */
public interface LedState
{
    /**
     * Turns the Led on
     *
     * @param led the Led object this state is a part of
     */
    void turnOn(GroveLed led);

    /**
     * Turns the Led off
     *
     * @param led the Led object this state is a part of
     */
    void turnOff(GroveLed led);

    /**
     * Cycles the Led to its next state
     *
     * @param led the Led object this state is a part of
     */
    void nextState(GroveLed led);
}
