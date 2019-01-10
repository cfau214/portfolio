package edu.ccsu.cs417.raspberry.grove;

import com.dexterind.grovepi.sensors.base.DigitalSensor;
import edu.ccsu.cs417.composite.Composite;
import edu.ccsu.cs417.raspberry.Buzzer;
import edu.ccsu.cs417.visitor.SensorVisitor;

/**
 * Provides functionality to control the grovepi buzzer. This includes causing the buzzer to buzz for a set time period.
 * The Buzzer is also able to become part of a Composite and supports being decorated.
 *
 * @author Nicholas Daddona
 */
public abstract class AbstractBuzzer extends GroveSensor implements Buzzer
{
    /**
     * The number of times the buzzer has buzzed
     */
    private static int numBuzzes;

    /**
     * The time in seconds the buzzer will buzz
     */
    private int buzzTime;

    /**
     * Creates a new Buzzer to control a buzzer plugged into the specified port
     *
     * @param port   the port the buzzer is plugged into
     * @param sensor the DigitalSensor object used to access the sensor
     */
    public AbstractBuzzer(int port, DigitalSensor sensor)
    {
        super(port, sensor);
    }

    /**
     * Returns the time in seconds the buzzer is set to buzz
     *
     * @return the number of seconds the buzzer will buzz
     */
    @Override
    public int getBuzzTime()
    {
        return buzzTime;
    }

    /**
     * Sets the the time the buzzer will buzz
     *
     * @param buzzTime the time in seconds the buzzer will buzz
     */
    @Override
    public void setBuzzTime(int buzzTime)
    {
        this.buzzTime = buzzTime;
    }

    /**
     * Makes the Buzzer buzz for its set time
     */
    @Override
    public void buzz()
    {
        try {
            super.write(1);
            Thread.sleep(1000 * buzzTime);
            super.write(0);
        } catch (InterruptedException e) {
            System.err.println("Buzzer Interrupted");
        }
        System.out.println("The Buzzer is buzzing");
        numBuzzes++; // increment buzz count
    }

    /**
     * Returns and resets the count of how many times the buzzer has buzzed
     *
     * @return the number of times the buzzer has buzzed since the last check
     */
    @Override
    public int getNumBuzzes()
    {
        int temp = numBuzzes;
        numBuzzes = 0;
        return temp;
    }

    /**
     * Notifies this Observer in a change in the state of the Subject its watching
     */
    @Override
    public void update()
    {
        buzz();
    }

    /**
     * Performs an operation on a Component or all Components if this object is a composite
     */
    @Override
    public void operation()
    {
        buzz();
    }

    /**
     * Returns a Composite reference if this Component is a Composite
     *
     * @return a Composite reference if this object is a Composite, null otherwise
     */
    @Override
    public Composite getComposite()
    {
        return null;
    }

    /**
     * Accepts a SensorVisitor that will perform some operation on this object
     *
     * @param visitor the SensorVisitor visiting this object
     */
    @Override
    public void accept(SensorVisitor visitor)
    {
        visitor.visitBuzzer(this);
    }

    /**
     * Determines if this object is equal to another
     *
     * @param obj the other object this object is compared to
     * @return true if the objects are the same, false otherwise
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
        if (obj instanceof AbstractBuzzer) {
            AbstractBuzzer other = (AbstractBuzzer) obj;
            return this.port == other.port && this.buzzTime == other.buzzTime;
        }
        return false;
    }

    /**
     * Returns a hash code value of this object
     *
     * @return a hash code value of this object
     */
    @Override
    public int hashCode()
    {
        int hash = 11;
        hash *= 37 + port;
        hash *= 37 + buzzTime;
        return hash;
    }

    /**
     * Returns a string representation of this object
     *
     * @return a string containing information on this object
     */
    @Override
    public String toString()
    {
        return "Buzzer plugged into port D" + port + " set to buzz for " + buzzTime + " seconds";
    }
}
