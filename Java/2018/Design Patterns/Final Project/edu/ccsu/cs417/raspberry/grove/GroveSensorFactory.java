package edu.ccsu.cs417.raspberry.grove;

import com.dexterind.grovepi.sensors.base.DigitalSensor;
import edu.ccsu.cs417.adapter.Camera;
import edu.ccsu.cs417.adapter.CameraFunction;
import edu.ccsu.cs417.adapter.CommandLineCamera;
import edu.ccsu.cs417.adapter.RpiStill;
import edu.ccsu.cs417.raspberry.*;
import edu.ccsu.cs417.raspberry.grove.led.GroveLed;

/**
 * An Implementation of SensorFactory used to build Grove Sensors for use with the grovepi board. This factory also builds
 * CommandLineCamera adapters. This factory disables sensors if they're marked as disabled in enable.properties.
 * Sensors are configured for the port specified in port.properties
 *
 * @author Nicholas Daddona
 */
public class GroveSensorFactory extends SensorFactory
{

    /**
     * Private Constructor for singleton
     */
    private GroveSensorFactory()
    {
        super();
    }

    /**
     * Returns the instance of a GroveSensorFactory as a SensorFactory
     *
     * @return a GroveSensorFactory
     */
    public static SensorFactory getInstance()
    {
        if (instance == null) {
            instance = new GroveSensorFactory();
        }
        return instance;
    }

    /**
     * Creates and returns a Button object for a Button plugged into the raspberry pi
     *
     * @return a new Button object
     */
    @Override
    public Button buildButton()
    {
        boolean enabled = raspiSettings.sensorEnabled.get("BUTTON_ENABLED");
        int port = raspiSettings.sensorPorts.get("BUTTON_PORT");
        return new GroveButton(port, buildSensor(port, enabled));
    }

    /**
     * Creates and returns a Buzzer object for a Buzzer plugged into the raspberry pi
     *
     * @return a new Buzzer object
     */
    @Override
    public Buzzer buildBuzzer()
    {
        boolean enabled = raspiSettings.sensorEnabled.get("BUZZER_ENABLED");
        int port = raspiSettings.sensorPorts.get("BUZZER_PORT");
        return new GroveBuzzer(port, buildSensor(port, enabled));
    }

    /**
     * Creates a Buzzer Decorator and sets it to decorate the passed Buzzer object
     *
     * @param decoratedBuzzer the buzzer to be decorated
     * @return a new Buzzer Decorator decorating the set Buzzer
     */
    @Override
    public Buzzer buildBuzzerDecorator(Buzzer decoratedBuzzer)
    {
        boolean enabled = raspiSettings.sensorEnabled.get("BUZZER_ENABLED");
        int port = raspiSettings.sensorPorts.get("BUZZER_PORT");
        return new ExtraBuzzDecorator(port, decoratedBuzzer, buildSensor(port, enabled));
    }

    /**
     * Creates and returns a Camera object for a Camera plugged into the raspberry pi
     *
     * @return a new Camera object
     */
    @Override
    public Camera buildCamera()
    {
        boolean enabled = raspiSettings.sensorEnabled.get("CAMERA_ENABLED");
        CameraFunction camera = null;
        if (enabled) {
            camera = new RpiStill();
        }
        return new CommandLineCamera(camera);
    }

    /**
     * Creates and returns an Led object for an Led plugged plugged into the raspberry pi
     *
     * @return a new Led object
     */
    @Override
    public Led buildLed()
    {
        boolean enabled = raspiSettings.sensorEnabled.get("LED_ENABLED");
        int port = raspiSettings.sensorPorts.get("LED_PORT");
        return new GroveLed(port, buildSensor(port, enabled));
    }

    /**
     * Creates and returns a MotionSensor object for a MotionSensor plugged plugged into the raspberry pi
     *
     * @return a new MotionSensor object
     */
    @Override
    public MotionSensor buildMotionSensor()
    {
        boolean enabled = raspiSettings.sensorEnabled.get("MOTION_SENSOR_ENABLED");
        int port = raspiSettings.sensorPorts.get("MOTION_SENSOR_PORT");
        return new GrovePir(port, buildSensor(port, enabled));
    }

    /**
     * Attempts to build a Digital Sensor for the given port if the sensor is enabled
     *
     * @param port    the port the sensor is plugged into
     * @param enabled flag that enables the sensor
     * @return a new DigitalSensor if the sensor was enabled, false otherwise
     */
    private DigitalSensor buildSensor(int port, boolean enabled)
    {
        DigitalSensor sensor = null;
        try {
            if (enabled) {
                sensor = new DigitalSensor(port);
            }
        } catch (Exception e) {
            System.err.println("Error Creating Sensor for port " + port);
        }
        return sensor;
    }
}
