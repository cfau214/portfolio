package edu.ccsu.cs417;

/**
 * Used to simulate an LED sensor for the Grovepi Raspberry Pi kit
 * 
 */
public class Led {
	
	private boolean isOn; // status of the led
	private String name; // name of the led, corresponds to port name on the Grovepi board

	/**
	 * Creates a new Led object
	 * @param name the name of the port the led is plugged into
	 */
	public Led(String name) {
		this.isOn = false;
		this.name = name;
	}

	/**
	 * Turns the Led on
	 */
	public void turnOn() {
		isOn = true;
	}

	/**
	 * Turns the Led off
	 */
	public void turnOff() {
		isOn = false;
	}

	/**
	 * Determines if the Led is turned on
	 *
	 * @return true if the Led is on, false if its off
	 */
	public boolean isOn() {
		return isOn;
	}

	/**
	 * Determines if this Led object is equal to another object
	 *
	 * @param obj the other object
	 * @return true if the objects are equal, false otherwise
	 */
	@Override
	public boolean equals(Object obj) {
		if (obj == null) { // false if obj is a null reference
			return false;
		}
		if (this == obj) { // true if obj references this Led
			return true;
		}
		if (obj instanceof Led) { // return true if obj has the same name, false if the two Leds aren't equal
			Led other = (Led) obj;
			return this.name.equals(other.name) && this.isOn == other.isOn;
		}
		else { // false if obj isn't a Led instance
			return false;
		}
	}

	/**
	 * Returns a hash code for this Led
	 *
	 * @return a hash code for this led
	 */
	@Override
	public int hashCode() {
		return Boolean.hashCode(isOn) + name.hashCode();
	}

	/**
	 * Returns a String Representation of this Led
	 *
	 * @return The Led's name and status
	 */
	public String toString() {
		String status;
		if (isOn) {
			status = "on";
		}
		else {
			status = "off";
		}
		return "Name: " + name + " Status" + status;
	}
}