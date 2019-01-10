package edu.ccsu.cs417.raspberry.grove;

import com.dexterind.grovepi.sensors.base.DigitalSensor;
import edu.ccsu.cs417.composite.Composite;
import edu.ccsu.cs417.raspberry.Button;
import edu.ccsu.cs417.visitor.SensorVisitor;

/**
 * Provides functionality to control the grovepi button. Provides functionality to check for a button press by reading a
 * value on the port the button is plugged into.
 *
 * @author Nicholas Daddona
 */
public class GroveButton extends GroveSensor implements Button
{
    /**
     * the number of times the button has been pressed
     */
    private static int numPressed;

    /**
     * Creates a new GroveButton for a button in the specified port
     *
     * @param port   the port the button is plugged into
     * @param sensor the DigitalSensor object used to access the sensor
     */
    public GroveButton(int port, DigitalSensor sensor)
    {
        super(port, sensor);
    }

    /**
     * Checks if the button is currently being pressed
     *
     * @return true if the button is being pressed, false otherwise
     */
    @Override
    public boolean isPressed()
    {
        boolean status = read() != 0;
        if (status) {
            numPressed++;
        }
        return status;
    }

    /**
     * Returns and resets the count of how many times the button has been pressed
     *
     * @return the number of times the button was pressed since the last check
     */
    @Override
    public int getNumPressed()
    {
        int temp = numPressed;
        numPressed = 0;
        return temp;
    }

    /**
     * Determines if this object is equal to another object
     *
     * @param obj the object this object is being compared to
     * @return true if the objects are equal, false otherwise
     */
    public boolean equals(Object obj)
    {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (obj instanceof GroveButton) {
            GroveButton other = (GroveButton) obj;
            return this.port == other.port && this.numPressed == other.numPressed;
        }
        return false;
    }

    /**
     * Returns a hashcode value for this object
     *
     * @return a hash value for this object
     */
    public int hashCode()
    {
        int hash = 37;
        hash *= 17 + port;
        hash *= 11 + numPressed;
        return hash;
    }

    /**
     * Returns a String representation of this Object
     *
     * @return a string containing information on this object
     */
    public String toString()
    {
        return "Button plugged into port D" + port;
    }
}
