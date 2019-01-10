package edu.ccsu.cs417.raspberry;

/**
 * Part of the Abstract Factory Pattern
 * An interface for the Motion PiSensor
 */
public interface MotionSensor extends PiSensor
{

    /**
     * Detects for Motion, returns true if motion was detected
     *
     * @return true if motion was detected, false otherwise
     */
    boolean motionDetected();


    /**
     * Returns and resets the number of times motion was detected
     *
     * @return the times motion was detected since the last check
     */
    int getNumberDetected();
}
