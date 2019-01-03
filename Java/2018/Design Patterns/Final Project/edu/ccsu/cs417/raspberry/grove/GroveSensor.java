package edu.ccsu.cs417.raspberry.grove;

import com.dexterind.grovepi.sensors.base.DigitalSensor;

import java.io.IOException;

/**
 * Abstract Grove PiSensor class provides common implementation
 * for the concrete grove pi classes.
 */
public abstract class GroveSensor
{

    /**
     * the port the sensor is plugged into
     */
    protected int port;

    /**
     * the grove pi sensor class for sensor functionality
     */
    protected DigitalSensor sensor;

    /**
     * Creates a new GroveSensor for a sensor plugged into the specified port
     *
     * @param port   the port the sensor is plugged into
     * @param sensor the DigitalSensor object used to access the sensor
     */
    protected GroveSensor(int port, DigitalSensor sensor)
    {
        this.port = port;
        this.sensor = sensor;
    }

    /**
     * Get the port the sensor is plugged into
     *
     * @return port
     */
    public int getPort()
    {
        return port;
    }

    /**
     * Writes a value to the sensor object this Object holds, if any
     *
     * @param value the value that will be written to the sensor
     */
    public void write(int value)
    {
        if (sensor != null) {
            try {
                sensor.write(value);
            } catch (IOException e) {
                System.err.println("Error writing to sensor in port " + port);
            }
        }
    }

    /**
     * Reads a value from the sensor object this object holds, if any
     *
     * @return a value read from the sensor, 0 if this object holds no sensor
     */
    public int read()
    {
        int retVal = 0;
        if (sensor != null) {
            try {
                retVal = (int) sensor.readBytes()[0];
            } catch (IOException e) {
                System.err.println("Error reading from sensor in port " + port);
            }
        }
        return retVal;
    }

    /**
     * Determines if this object is equal to another object
     *
     * @param obj the object this object is being compared to
     * @return true if the objects are equal, false otherwise
     */
    @Override
    public boolean equals(Object obj)
    {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (obj instanceof GroveSensor) {
            GroveSensor other = (GroveSensor) obj;
            return this.port == other.port && this.sensor.equals(other.sensor);
        }
        return false;
    }

    /**
     * Returns a hash code value for this Motion PiSensor for use in hash tables
     *
     * @return a hash code value
     */
    @Override
    public int hashCode()
    {
        int hash = 37;
        hash *= 17 + port;
        return hash;
    }

    /**
     * Returns a String representation of this Object
     *
     * @return a string containing information on this object
     */
    @Override
    public String toString()
    {
        return "GroveSensor{" +
                "port=" + port +
                ", sensor=" + sensor +
                '}';
    }
}
