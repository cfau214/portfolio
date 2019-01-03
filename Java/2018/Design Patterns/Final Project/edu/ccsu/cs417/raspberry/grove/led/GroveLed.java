package edu.ccsu.cs417.raspberry.grove.led;

import com.dexterind.grovepi.sensors.base.DigitalSensor;
import edu.ccsu.cs417.composite.Composite;
import edu.ccsu.cs417.raspberry.Led;
import edu.ccsu.cs417.raspberry.grove.GroveSensor;
import edu.ccsu.cs417.visitor.SensorVisitor;

/**
 * Led Class
 * <p>
 * This class uses two Design Patterns: Singleton and State.
 * <p>
 * As a Singleton, our Led will be a static object that can be manipulated by the Subject
 * in the Observer pattern.
 * <p>
 * The Led class is also the Context Class in the State Design Pattern used in this project.
 * It will have multiple valid states:
 * off - The Led will not be illuminated.
 * on - The Led will be persistent and remain on.
 * blinking - The Led will 'breath.'
 *
 * @author Chris Fauteux
 * @author Nicholas Daddona
 */
public class GroveLed extends GroveSensor implements Led
{
    /**
     * The current state of the Led
     */
    private LedState state;

    /**
     * Determines if the Led is on or not
     */
    private boolean isOn;

    /**
     * The number of times the led has been actively turned on
     */
    private static int timesTurnedOn;

    /**
     * Creates a new GroveLed for an Led plugged into the specified port
     *
     * @param port   the port the led is plugged into
     * @param sensor the DigitalSensor object used to access the sensor
     */
    public GroveLed(int port, DigitalSensor sensor)
    {
        super(port, sensor);
        this.state = new Solid();
        this.isOn = false;
    }

    /**
     * Returns the Led's current state
     *
     * @return the current state of the Led
     */
    public LedState getState()
    {
        return state;
    }

    /**
     * Changes the Led's state to the next state as defined by it's current state
     */
    @Override
    public void nextState()
    {
        state.nextState(this);
    }

    /**
     * Changes the current state of the Led.
     *
     * @param state The state the Led will be changed to.
     */
    void setState(LedState state)
    {
        this.state = state;
    }

    /**
     * Determines if the Led is turned on
     *
     * @return true if the led is turned on, false otherwise
     */
    public boolean isOn()
    {
        return isOn;
    }

    /**
     * Used by LedStates to set isOn to off in case of a timed turn on
     */
    void setStatus(boolean status)
    {
        isOn = status;
    }

    /**
     * Turns the Led on, the way the Led illuminates depends on its state
     */
    public void turnOn()
    {
        if (!isOn) {
            isOn = true;
            state.turnOn(this);
            timesTurnedOn++;
        }
    }

    /**
     * Turns the Led off, Led maintains it's LedState even when off
     */
    public void turnOff()
    {
        if (isOn) {
            isOn = false;
            state.turnOff(this);
        }
    }

    /**
     * Returns and resets the number of times the Led has been turned on
     *
     * @return the number of times the Led has been turned on
     */
    @Override
    public int getTimesTurnedOn()
    {
        int temp = timesTurnedOn;
        timesTurnedOn = 0;
        return temp;
    }

    /**
     * Returns a String representation of this Led object. This method will call the State's version
     * of toString to return the status of the current State of the Led.
     *
     * @return String
     */
    @Override
    public String toString()
    {
        String status;
        if (isOn()) {
            status = "on";
        }
        else {
            status = "off";
        }
        return "Led plugged into port D" + port + "\nLed is " +
                status + '\n' + state.toString();
    }

    /**
     * Tests if this Led is equal to another object.
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
        if (obj instanceof GroveLed) {

            GroveLed other = (GroveLed) obj;
            return this.isOn == other.isOn() &&
                    this.state == other.getState() &&
                    this.port == other.getPort();
        }

        return false;
    }

    /**
     * Returns a hash value for use in hash tables.
     *
     * @return int hash value.
     */
    @Override
    public int hashCode()
    {
        return 13 * (state.hashCode() +
                Integer.hashCode(port) +
                Boolean.hashCode(isOn));
    }

    /**
     * Performs an operation on a Component or all Components if this object is a composite
     */
    @Override
    public void operation()
    {
        turnOn();
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
        visitor.visitLed(this);
    }

    /**
     * Notifies this Observer in a change in the state of the Subject its watching
     */
    @Override
    public void update()
    {
        try {
            turnOn();
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            System.out.println("Led Observer Operation interrupted");
        }
        turnOff();
    }
}
