package edu.ccsu.cs417.visitor;

import edu.ccsu.cs417.adapter.Camera;
import edu.ccsu.cs417.observer.ButtonSubject;
import edu.ccsu.cs417.observer.MotionSensorSubject;
import edu.ccsu.cs417.raspberry.Buzzer;
import edu.ccsu.cs417.raspberry.Led;

/**
 * Provides an interface that allows a Visitor to visit various sensor classes
 *
 * @author Nicholas Daddona
 */
public interface SensorVisitor
{
    /**
     * Visits a ButtonSubject to gather some information from it
     *
     * @param buttonSubject the button the visitor is visiting
     */
    void visitButtonSubject(ButtonSubject buttonSubject);

    /**
     * Visits a Buzzer to gather some information from it
     *
     * @param buzzer the buzzer the visitor is visiting
     */
    void visitBuzzer(Buzzer buzzer);

    /**
     * Visits an Led to gather some information from it
     *
     * @param led the led the visitor is visiting
     */
    void visitLed(Led led);

    /**
     * Visits a Camera to gather some information from it
     *
     * @param camera the camera the visitor is visiting
     */
    void visitCamera(Camera camera);

    /**
     * Visits a MotionSensorSubject to gather some information from it
     *
     * @param motionSensorSubject the motion sensor subject the visitor is visiting
     */
    void visitMotionSensorSubject(MotionSensorSubject motionSensorSubject);

    /**
     * Used when the visitor is finished to print the results gathered while visiting
     */
    void printResult();
}
