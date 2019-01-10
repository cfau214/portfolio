package edu.ccsu.cs417.adapter;

/**
 * Part of the Adapter Pattern
 * <p>
 * Is the adaptee and defines the existing interface
 * that needs adapting
 *
 * @author Nicholas Pipino
 */
public interface CameraFunction
{
    /**
     * Implementation provides camera functionality by using a terminal command
     *
     * @param arguments the arguments to be passed to raspistill
     */
    void commandCode(String arguments);
}
