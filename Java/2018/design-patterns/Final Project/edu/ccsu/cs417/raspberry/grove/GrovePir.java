package edu.ccsu.cs417.raspberry.grove;

import com.dexterind.grovepi.sensors.base.DigitalSensor;
import edu.ccsu.cs417.composite.Composite;
import edu.ccsu.cs417.raspberry.MotionSensor;
import edu.ccsu.cs417.visitor.SensorVisitor;

/**
 * Provides access to the grove PIR Motion PiSensor
 * <p>
 * Extends GroveSensor to have access to the Sensor Object used to control the PIR, the port said sensor is plugged into,
 * and safe read operation that can be used even if the sensor is disabled
 */
public class GrovePir extends GroveSensor implements MotionSensor
{
    /**
     * Number of times motion was detected since last check
     */
    private static int numberDetected;

    // TODO: add sensor implementation, adjust hashcode, tostring and equals for fully implemented object

    /**
     * Default Constructor
     * Creates a new MotionSensor object for the pir sensor plugged into the digital port corresponding to the passed integer
     *
     * @param port   the port the motion sensor is plugged into
     * @param sensor the DigitalSensor object used to access the sensor
     */
    public GrovePir(int port, DigitalSensor sensor)
    {
        super(port, sensor);
    }

    /**
     * Detects for Motion, returns true if motion was detected
     *
     * @return true if motion was detected, false otherwise
     */
    @Override
    public boolean motionDetected()
    {
        boolean status = read() != 0;
        if (status) {
            numberDetected++;
        }
        return status;
    }

    /**
     * Returns and resets the number of times motion was detected
     *
     * @return the times motion was detected since the last check
     */
    @Override
    public int getNumberDetected()
    {
        int temp = numberDetected;
        numberDetected = 0;
        return temp;
    }

    /**
     * Returns a hash code value for this Motion PiSensor for use in hash tables
     *
     * @return a hash code value
     */
    @Override
    public int hashCode()
    {
        return Integer.hashCode(port) + Integer.hashCode(numberDetected);
    }

    /**
     * Tests if this MotionSensor is equal to another object
     *
     * @param obj the object this object is being compared to
     * @return true if this object equals obj, false otherwise
     */
    @Override
    public boolean equals(Object obj)
    {
        if (obj == null) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (obj instanceof GrovePir) {
            GrovePir other = (GrovePir) obj;
            return this.port == other.port;
        }
        return false;
    }

    /**
     * Returns A String representation of this MotionSensor
     *
     * @return a string representation of this MotionSensor
     */
    @Override
    public String toString()
    {
        return "Motion PiSensor in Port D" + port;
    }
}
