package edu.ccsu.cs417.raspberry.grove;

import com.dexterind.grovepi.sensors.base.DigitalSensor;
import edu.ccsu.cs417.raspberry.Buzzer;

/**
 * Decorates a Buzzer Object by adding an extra buzz with a different duration. The extra buzz will be applied before the
 * buzz of the decorated buzzer.
 *
 * @author Nicholas Daddona
 */
public class ExtraBuzzDecorator extends AbstractBuzzer
{
    /**
     * The Buzzer object that this decorator is decorating
     */
    private Buzzer decoratedBuzzer;

    /**
     * Creates a new Buzzer to control a buzzer plugged into the specified port
     *
     * @param port            the port the buzzer is plugged into
     * @param decoratedBuzzer the Buzzer this decorator will keep track of
     * @param sensor          the DigitalSensor object used to access the sensor
     */
    public ExtraBuzzDecorator(int port, Buzzer decoratedBuzzer, DigitalSensor sensor)
    {
        super(port, sensor);
        this.decoratedBuzzer = decoratedBuzzer;
    }

    /**
     * Actives the buzzer by applying any extra buzzes before the normal buzz
     */
    @Override
    public void buzz()
    {
        super.buzz();
        decoratedBuzzer.buzz();
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
        if (obj instanceof ExtraBuzzDecorator) {
            return super.equals(obj) && this.decoratedBuzzer.equals(((ExtraBuzzDecorator) obj).decoratedBuzzer);
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
        int hash = 11 + super.hashCode();
        hash += 37 * decoratedBuzzer.hashCode();
        return hash;
    }

    /**
     * Returns a string representation of this object
     *
     * @return a string containing information on this object
     */
    public String toString()
    {
        return "ExtraBuzzDecorator providing an extra buzz for " + getBuzzTime()
                + " seconds for: \n" + decoratedBuzzer.toString();
    }
}
