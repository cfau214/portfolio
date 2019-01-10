package edu.ccsu.cs417.raspberry;

import edu.ccsu.cs417.adapter.Camera;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Part of an implementation of the AbstractFactory design pattern. Provides functionality to create a factory for a
 * specific family of sensors and functionality to disable said sensors when they're not available
 *
 * @author Nicholas Daddona
 */
public abstract class SensorFactory
{
    /**
     * Singleton instance of the SensorFactory
     */
    protected static SensorFactory instance;

    /**
     * Class containing settings used by the factory when creating instances
     */
    protected RaspiSettings raspiSettings;

    /**
     * Private Constructor for Singleton Instance
     */
    protected SensorFactory()
    {
        raspiSettings = new RaspiSettings();
    }

    /**
     * Returns the singleton instance of the SensorFactory, if initialized
     *
     * @return the SensorFactory instance if initialized, false otherwise
     */
    public static SensorFactory getInstance()
    {
        return instance;
    }

    /**
     * Creates and returns a Button object for a Button plugged into the raspberry pi
     *
     * @return a new Button object
     */
    public abstract Button buildButton();

    /**
     * Creates and returns a Buzzer object for a Buzzer plugged into the raspberry pi
     *
     * @return a new Buzzer object
     */
    public abstract Buzzer buildBuzzer();

    /**
     * Creates a Buzzer Decorator and sets it to decorate the passed Buzzer object
     *
     * @param decoratedBuzzer the buzzer to be decorated
     * @return a new Buzzer Decorator decorating the set Buzzer
     */
    public abstract Buzzer buildBuzzerDecorator(Buzzer decoratedBuzzer);

    /**
     * Creates and returns a Camera object for a Camera plugged into the raspberry pi
     *
     * @return a new Camera object
     */
    public abstract Camera buildCamera();

    /**
     * Creates and returns an Led object for an Led plugged plugged into the raspberry pi
     *
     * @return a new Led object
     */
    public abstract Led buildLed();

    /**
     * Creates and returns a MotionSensor object for a MotionSensor plugged plugged into the raspberry pi
     *
     * @return a new MotionSensor object
     */
    public abstract MotionSensor buildMotionSensor();

    /**
     * Contains functionality for accessing configuration settings used to determine the ports for the sensors and if the
     * sensors are enabled
     */
    protected class RaspiSettings
    {
        /**
         * HashMap containing all the sensor enable flags
         */
        public Map<String, Boolean> sensorEnabled;

        /**
         * HashMap containing all the ports the sensors are plugged into
         */
        public Map<String, Integer> sensorPorts;

        /**
         * Default Constructor
         * <p>
         * Loads settings for the factory from properties files
         */
        protected RaspiSettings()
        {
            sensorEnabled = new HashMap<>();
            sensorPorts = new HashMap<>();
            readEnableFile();
            readPorts();
        }

        /**
         * Loads enable flags for enabling the sensors the SensorFactory creates
         */
        protected void readEnableFile()
        {
            String propertiesName = "./config/enable.properties";
            try {
                Properties properties = new Properties();
                properties.load(new FileInputStream(propertiesName));
                for (String key : properties.stringPropertyNames()) { // obtain the enable flags for the sensors
                    sensorEnabled.put(key, Boolean.parseBoolean(properties.getProperty(key)));
                }
            } catch (IOException e) {
                System.err.println("Cannot Read properties file: " + propertiesName);
                System.exit(1); // factory cannot create sensor objects if enable flags aren't known
            }
        }

        /**
         * Loads ports for the sensors the SensorFactory creates
         */
        protected void readPorts()
        {
            String propertiesName = "./config/port.properties";
            Properties properties = new Properties();
            FileInputStream in;
            try {
                in = new FileInputStream(propertiesName);
                properties.load(in);
                for (String key : properties.stringPropertyNames()) { // obtain the ports for the sensors
                    sensorPorts.put(key, Integer.parseInt(properties.getProperty(key)));
                }
                in.close();
            } catch (IOException e) {
                System.err.println("Cannot Read properties file: " + propertiesName);
                System.exit(1); // factory cannot create sensor objects if ports aren't known
            }
        }
    }
}
