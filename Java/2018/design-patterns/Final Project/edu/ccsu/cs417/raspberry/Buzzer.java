package edu.ccsu.cs417.raspberry;

import edu.ccsu.cs417.composite.Component;
import edu.ccsu.cs417.observer.Observer;

/**
 * Part of the Abstract Factory Pattern
 * An interface for the Buzzer
 *
 */
public interface Buzzer extends PiSensor, Component, Observer
{

    /**
     * Returns the time in seconds the buzzer is set to buzz
     *
     * @return the number of seconds the buzzer will buzz
     */
    int getBuzzTime();


    /**
     * Sets the the time the buzzer will buzz
     *
     * @param buzzTime the time in seconds the buzzer will buzz
     */
    void setBuzzTime(int buzzTime);


    /**
     * Makes the Buzzer buzz for its set time
     */
    void buzz();


    /**
     * Returns and resets the count of how many times the buzzer has buzzed
     *
     * @return the number of times the buzzer has buzzed since the last check
     */
    int getNumBuzzes();

}
