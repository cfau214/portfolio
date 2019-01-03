package edu.ccsu.cs417.observer;

import edu.ccsu.cs417.raspberry.Button;
import edu.ccsu.cs417.visitor.SensorVisitor;

/**
 * An implementation of the Observer pattern where the observers will be notified when someone presses the button
 *
 * @author Nicholas Daddona
 */
public class ButtonSubject extends Subject
{

    /**
     * The Button that is being observed
     */
    private Button button;

    /**
     * Default Constructor
     * <p>
     * Creates a new ButtonSubject object with the specified Button
     *
     * @param button the Button subject of the observers
     */
    public ButtonSubject(Button button)
    {
        this.button = button;
    }

    /**
     * Perform a check to see if the Subject's state has changed
     */
    @Override
    public void checkState()
    {
        if (button.isPressed()) {
            updateObservers();
        }
    }

    /**
     * Returns the number of times the button was pressed since last check
     *
     * @return the number of times the button was pressed
     */
    public int getNumPressed()
    {
        return button.getNumPressed();
    }

    /**
     * Returns a hash code value for this Subject for use in hash tables
     *
     * @return a hash code value
     */
    @Override
    public int hashCode()
    {
        return super.hashCode() + button.hashCode();
    }

    /**
     * Tests if this Subject is equal to an object
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
        if (obj instanceof ButtonSubject) {
            return this.button.equals(((ButtonSubject) obj).button) && super.equals(obj);
        }
        return false;
    }

    /**
     * Returns a String representation of this Subject including its observers
     *
     * @return a String represenation of this Subject
     */
    @Override
    public String toString()
    {
        return "Button Subject\n" + button.toString() + "\n" + super.toString();
    }

    /**
     * Accepts a SensorVisitor that will perform some operation on this object
     *
     * @param visitor the SensorVisitor visiting this object
     */
    @Override
    public void accept(SensorVisitor visitor)
    {
        visitor.visitButtonSubject(this);
    }
}
