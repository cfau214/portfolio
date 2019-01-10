package edu.ccsu.cs417.adapter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Part of the Adapter Pattern
 * <p>
 * Implements the adaptee interface to provide concrete
 * camera functionality
 *
 * @author Nicholas Pipino
 */

public class RpiStill implements CameraFunction
{
    /**
     * Takes a picture using the RaspiStill camera library. Saves the
     * picture as a jpeg with a timestamped file name
     *
     * @param arguments the arguments to be passed to raspistill
     */
    public void commandCode(String arguments)
    {
        String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.jpg'").format(new Date());
        Process process;

        try {
            // a directory in the /home/pi path must be named camera
            //TODO check if a directory named camera exists if not make one
            process = Runtime.getRuntime().exec("raspistill " + arguments + " -o " + "/home/pi/camera/" + fileName);
            process.waitFor();
            System.out.println("exit: " + process.exitValue());
            process.destroy();
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }

    /**
     * toString implementation to override Object's
     *
     * @return String a textual representation of the RpiStill object
     */
    @Override
    public String toString()
    {
        return "RpiStill";
    }
}
