package edu.ccsu.cs417.raspberry.grove.led;

/**
 * LED State - Solid On.
 * <p>
 * When the state is on, the Led light will remain on until the next state change.
 * <p>
 * States cycle between Solid and blinking
 *
 * @author Chris Fauteux
 * @author Nicholas Daddona
 */
public class Solid implements LedState
{

    /**
     * Turns the Led on by calling the led instance's write method with MAX_BRIGHTNESS
     *
     * @param led the Led object this state is a part of
     */
    @Override
    public void turnOn(GroveLed led)
    {
        led.write(1);
        System.out.println("The Led is now on");
    }

    /**
     * Turns the Led off by calling the led's instance's write method with zero
     * passed through.
     *
     * @param led the Led object this state is a part of
     */
    @Override
    public void turnOff(GroveLed led)
    {
        led.write(0);
        System.out.println("The Led is now off");
    }

    /**
     * Cycles the Led to its next state
     */
    @Override
    public void nextState(GroveLed led)
    {
        led.setState(new Blinking());
    }

    /**
     * Returns a String representation of an On object.
     *
     * @return String
     */
    @Override
    public String toString()
    {
        return "Led State: Solid";
    }

    /**
     * Tests if this On object is equal to another object.
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
        if (obj instanceof Solid) {
            return true; // This will need to be changed if LedStates need to hold data when interacting with the sensors
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
        return 31 * super.hashCode();
    }
}
