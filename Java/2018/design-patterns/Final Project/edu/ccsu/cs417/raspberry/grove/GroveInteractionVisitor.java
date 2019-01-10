package edu.ccsu.cs417.raspberry.grove;

import edu.ccsu.cs417.adapter.Camera;
import edu.ccsu.cs417.observer.ButtonSubject;
import edu.ccsu.cs417.observer.MotionSensorSubject;
import edu.ccsu.cs417.raspberry.Buzzer;
import edu.ccsu.cs417.raspberry.Led;
import edu.ccsu.cs417.visitor.SensorVisitor;

public class GroveInteractionVisitor implements SensorVisitor
{

    /**
     * Used for building the console message while visiting the sensors
     */
    private StringBuilder messageBuilder;

    /**
     * Default Constructor:
     * <p>
     * Creates a new GroveInteractionVisitor
     */
    public GroveInteractionVisitor()
    {
        messageBuilder = new StringBuilder();
    }

    /**
     * Visits a Button to gather some information from it
     *
     * @param buttonSubject the button the visitor is visiting
     */
    @Override
    public void visitButtonSubject(ButtonSubject buttonSubject)
    {
        messageBuilder.append("Button Pressed ").append(buttonSubject.getNumPressed()).append(" times\n");
    }

    /**
     * Visits a Buzzer to gather some information from it
     *
     * @param buzzer the buzzer the visitor is visiting
     */
    @Override
    public void visitBuzzer(Buzzer buzzer)
    {
        messageBuilder.append("Buzzer buzzed ").append(buzzer.getNumBuzzes()).append(" times\n");
    }

    /**
     * Visits an Led to gather some information from it
     *
     * @param led the led the visitor is visiting
     */
    @Override
    public void visitLed(Led led)
    {
        messageBuilder.append("Led Turned on ").append(led.getTimesTurnedOn()).append(" times\n");
    }

    /**
     * Visits a Camera to gather some information from it
     *
     * @param camera the camera the visitor is visiting
     */
    @Override
    public void visitCamera(Camera camera)
    {
        messageBuilder.append("Camera took ").append(camera.getPicturesTaken()).append(" pictures\n");
    }

    /**
     * Visits a MotionSensor to gather some information from it
     *
     * @param motionSensorSubject the motion sensor the visitor is visiting
     */
    @Override
    public void visitMotionSensorSubject(MotionSensorSubject motionSensorSubject)
    {
        messageBuilder.append("Motion PiSensor detected motion ").append(motionSensorSubject.getNumberDetected()).append(" times\n");
    }

    /**
     * Used when the visitor is finished to print the results gathered while visiting
     */
    @Override
    public void printResult()
    {
        System.out.println(messageBuilder.toString());
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
        if (obj instanceof GroveInteractionVisitor) { // check if the messages both visitors hold are equal
            return this.messageBuilder.toString().equals(((GroveInteractionVisitor) obj).messageBuilder.toString());
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
        return messageBuilder.toString().hashCode();
    }

    /**
     * Returns a string representation of this object
     *
     * @return a string containing information on this object
     */
    @Override
    public String toString()
    {
        return messageBuilder.toString();
    }
}
