package edu.ccsu.cs417;

import edu.ccsu.cs417.adapter.Camera;
import edu.ccsu.cs417.composite.Composite;
import edu.ccsu.cs417.composite.SensorComposite;
import edu.ccsu.cs417.observer.ButtonSubject;
import edu.ccsu.cs417.observer.MotionSensorSubject;
import edu.ccsu.cs417.raspberry.*;
import edu.ccsu.cs417.raspberry.grove.GroveInteractionVisitor;
import edu.ccsu.cs417.raspberry.grove.GroveSensorFactory;
import edu.ccsu.cs417.visitor.SensorVisitor;

/**
 * Main Program for CS417 Final Project.
 *
 * @author Nicholas Daddona
 * @author Christoper Fauteux
 * @author Mayowa Oloyede
 * @author Nicholas Pipino
 *
 * @since Fall 2018
 */
public class Main
{
    /**
     * Program Entry Point.
     */
    public static void main(String[] args)
    {
        GroveSensorFactory.getInstance(); // initialize Factory singleton

        // Build Sensors for the Composite
        MotionSensor pir = SensorFactory.getInstance().buildMotionSensor();
        Button button = SensorFactory.getInstance().buildButton();
        Buzzer buzzer = SensorFactory.getInstance().buildBuzzer();
        buzzer.setBuzzTime(2);
        Buzzer decorator = SensorFactory.getInstance().buildBuzzerDecorator(buzzer);
        decorator.setBuzzTime(1);
        Led solidLed = SensorFactory.getInstance().buildLed();
        Led blinkingLed = SensorFactory.getInstance().buildLed();
        blinkingLed.nextState(); // change to blinking state
        Camera camera = SensorFactory.getInstance().buildCamera();

        ButtonSubject buttonSubject = new ButtonSubject(button);
        buttonSubject.attachObserver(decorator);
        buttonSubject.attachObserver(solidLed);

        MotionSensorSubject motionSensorSubject = new MotionSensorSubject(pir);
        motionSensorSubject.attachObserver(blinkingLed);
        motionSensorSubject.attachObserver(camera);

        // populate a composite with all the sensors
        Composite sensorComposite = new SensorComposite();
        sensorComposite.addComponent(buzzer);
        sensorComposite.addComponent(camera);
        sensorComposite.addComponent(solidLed);

        Composite subjectComposite = new SensorComposite();
        subjectComposite.addComponent(motionSensorSubject);
        subjectComposite.addComponent(buttonSubject);

        for (int i = 0; i < 20; i++) {
            subjectComposite.operation();
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                System.err.println("Wait between composite operation calls interrupted");
            }
        }
        Composite fullComposite = new SensorComposite();
        fullComposite.addComponent(sensorComposite);
        fullComposite.addComponent(subjectComposite);
        SensorVisitor groveVisitor = new GroveInteractionVisitor();

        fullComposite.accept(groveVisitor);
        groveVisitor.printResult();
    }
}
