package edu.ccsu.cs417.raspberry;

/**
 * Provides a default interface for sensors
 */
public interface PiSensor {

    /**
     * Returns the port that this buzzer is plugged into
     *
     * @return the port the buzzer is plugged into
     */
    int getPort();
}
