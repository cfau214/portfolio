package edu.ccsu.cs417.raspberry.grove.led;

/**
 * LED State - Blinking.
 * <p>
 * When the state is blinking, the Led light will pulsate, or 'breathe.'
 * <p>
 * States cycle between Blinking and Solid
 *
 * @author Chris Fauteux
 * @author Nicholas Daddona
 */

public class Blinking implements LedState
{

    /**
     * Turns the Led on and enters a blinking cycle by calling the write method that is
     * inherited from AnalogSensor on the Led instance. The write method is called twice in
     * each cycle of the blinking for loop alternating on and off.
     *
     * @param led the Led object this state is a part of
     */
    @Override
    public void turnOn(GroveLed led)
    {
        System.out.println("The Led is now Blinking");
        for (float num = 0; num <= 100; num += 10) {
            try {
                led.write(1);
                Thread.sleep(100);
                led.write(0);
                Thread.sleep(100);
            } catch (InterruptedException e) {
                System.err.println("Blinking Interrupted");
            }
        }
        led.setStatus(false); // blinking has stopped so led is marked as off
    }

    /**
     * Turns the Led off by calling the led instance's write method with zero as a
     * parameter.
     *
     * @param led the Led object this state is a part of
     */
    @Override
    public void turnOff(GroveLed led)
    {
        led.write(0);
        System.out.println("The Led is now off.");
    }

    /**
     * Cycles the Led to its next state by calling the led instance's setState method with
     * a new solid instance passed in.
     *
     * @param led the Led object this state is a part of
     */
    @Override
    public void nextState(GroveLed led)
    {
        led.setState(new Solid());
    }

    /**
     * Returns a String representation of a Blinking object.
     *
     * @return String
     */
    @Override
    public String toString()
    {
        return "Led State: Blinking";
    }

    /**
     * Tests if this Blinking object is equal to another object.
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
        if (obj instanceof Blinking) {
            return true; // this will need to be changed if Blinking needs to hold data
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
