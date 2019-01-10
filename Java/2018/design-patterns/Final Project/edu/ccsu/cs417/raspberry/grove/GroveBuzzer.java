package edu.ccsu.cs417.raspberry.grove;

import com.dexterind.grovepi.sensors.base.DigitalSensor;

/**
 * Provides a Concrete Implementation of a Buzzer, defers most of the implementation to the abstract Buzzer class to
 * support the BuzzerDecorator
 *
 * @author Nicholas Daddona
 */
public class GroveBuzzer extends AbstractBuzzer
{

    /**
     * Creates a new Buzzer to control a buzzer plugged into the specified port
     *
     * @param port   the port the buzzer is plugged into
     * @param sensor the DigitalSensor object used to access the sensor
     */
    public GroveBuzzer(int port, DigitalSensor sensor)
    {
        super(port, sensor);
    }
}
