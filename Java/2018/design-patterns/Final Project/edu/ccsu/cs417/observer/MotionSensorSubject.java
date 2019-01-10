package edu.ccsu.cs417.observer;

import edu.ccsu.cs417.raspberry.MotionSensor;
import edu.ccsu.cs417.visitor.SensorVisitor;

/**
 * Part of the Observer pattern, allows a motionsensor to notify observers when it detects motion
 */
public class MotionSensorSubject extends Subject
{
    /**
     * The subject of the observers
     */
    private MotionSensor sensor;

    /**
     * Creates a new MotionSensorSubject with the associated motion sensor
     *
     * @param sensor the motion sensor that will be observed
     */
    public MotionSensorSubject(MotionSensor sensor)
    {
        super();
        this.sensor = sensor;
    }

    /**
     * Detects if the Motion PiSensor was triggered. If it was, notifies the PiSensor's Observers
     */
    @Override
    public void checkState()
    {
        if (sensor.motionDetected()) {
            updateObservers(); // notify the observers if motion is detected
        }
    }

    /**
     * Returns the number of detections by the motion sensor
     *
     * @return the number of detections by the motion sensor since the last check
     */
    public int getNumberDetected()
    {
        return sensor.getNumberDetected();
    }

    /**
     * Returns a hash code value for this MotionSensorSubject for use in hash tables
     *
     * @return a hash code value
     */
    @Override
    public int hashCode()
    {
        return sensor.hashCode() + super.hashCode();
    }

    /**
     * Tests if this MotionSensorSubject is equal to another object
     *
     * @param obj the object this object is being compared to
     * @return true if the objects are equal, false otherwise
     */
    public boolean equals(Object obj)
    {
        if (obj == null) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (obj instanceof MotionSensorSubject) { // test if the objects are the same type
            MotionSensorSubject other = (MotionSensorSubject) obj;
            return this.sensor.equals(other.sensor) && super.equals(other); // test sensor and observers
        }
        return false;
    }

    /**
     * Returns a String representation of this MotionSensorSubject
     *
     * @return a string containing information on this MotionSensorSubject
     */
    public String toString()
    {
        return sensor.toString() + '\n' + super.toString();
    }

    /**
     * Accepts a SensorVisitor that will perform some operation on this object
     *
     * @param visitor the SensorVisitor visiting this object
     */
    @Override
    public void accept(SensorVisitor visitor)
    {
        visitor.visitMotionSensorSubject(this);
    }
}
