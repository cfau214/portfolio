/**
 * 
 * PayingParty.java
 * Interface class used when an object needs to make a payment to another class.
 * 
 * @author Chris Fauteux
 * 
 */
public interface PayingParty {
	
	/**
     * Pay will deduct a currency type of double from another object.
     * 
     * @param amount - The amount that is paid.
     */
	public void pay(double amount);
}