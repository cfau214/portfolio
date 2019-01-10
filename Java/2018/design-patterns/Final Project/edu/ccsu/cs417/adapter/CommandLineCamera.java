package edu.ccsu.cs417.adapter;

import edu.ccsu.cs417.composite.Composite;
import edu.ccsu.cs417.visitor.SensorVisitor;

import java.util.Objects;

/**
 * Part of the Adapter Pattern
 * <p>
 * Adapts the interface adaptee to the target interface
 *
 * @author Nicholas Pipino
 */
public class CommandLineCamera implements Camera
{

    /**
     * The number of pictures the camera has taken (for this adapter type)
     */
    private static int picturesTaken;

    /**
     * Arguments to be passed to raspistill
     */
    private String arguments;

    /**
     * Object containing raspistill logic
     */
    private CameraFunction cameraFunction;

    /**
     * Default Constructor
     * <p>
     * Creates a new Camera object for interfacing with the Camera Module
     * Sets default arguments to allow for vertical flip and horizontal flip and turn off preview mode
     *
     * @param cameraFunction object containing the logic to access raspistill
     */
    public CommandLineCamera(CameraFunction cameraFunction)
    {
        this.cameraFunction = cameraFunction;
        this.arguments = "-vf -hf -n";
    }

    /**
     * Alternate Constructor
     * <p>
     * Creates a new Camera object for interfacing with the Camera Module with the specified arguments
     *
     * @param cameraFunction object containing the logic to access raspistill
     * @param arguments      command line arguments for the camera
     */
    public CommandLineCamera(CameraFunction cameraFunction, String arguments)
    {
        this(cameraFunction);
        this.arguments = arguments;
    }

    /**
     * calls commandCode() on a cameraFunction to take a picture
     */
    public void takePic()
    {
        if (cameraFunction != null) {
            cameraFunction.commandCode(arguments);
        }
        picturesTaken++;
    }

    /**
     * Performs an operation on a Component or all Components if this object is a composite
     */
    @Override
    public void operation()
    {
        takePic();
    }

    /**
     * Returns and resets the number of pictures taken
     *
     * @return the number of pictures taken
     */
    @Override
    public int getPicturesTaken()
    {
        int temp = picturesTaken;
        picturesTaken = 0;
        return temp;
    }

    /**
     * Notifies this Observer in a change in the state of the Subject its watching
     */
    @Override
    public void update()
    {
        takePic();
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
        visitor.visitCamera(this); // have the visitor visit this Camera
    }

    /**
     * Tests if this CommandLineCamera is equal to another object
     *
     * @param o the object this object is being compared to
     * @return true if the objects are equal, false otherwise
     */
    @Override
    public boolean equals(Object o)
    {
        if (this == o) {
            return true;
        }
        if (!(o instanceof CommandLineCamera)) {
            return false;
        }
        CommandLineCamera that = (CommandLineCamera) o;
        return Objects.equals(cameraFunction, that.cameraFunction) && Objects.equals(this.arguments, that.arguments);
    }

    /**
     * Returns a hash code value for this CommandLineCamera for use in hash tables
     *
     * @return a hash code value
     */
    @Override
    public int hashCode()
    {
        int hash = 11;
        hash += 37 * arguments.hashCode();
        if (cameraFunction != null) {
            hash += 37 * cameraFunction.hashCode();
        }
        return hash;
    }

    /**
     * Returns a String representation of this Object
     *
     * @return a string containing information on this object
     */
    public String toString()
    {
        return "CommandLine camera setup with options: " + arguments;
    }
}
