/**
 * Vendor.java
 * Class that represents a vendor.
 * 
 * @author Chris Fauteux
 * @since 10-06-2018
 * 
 */
public class Vendor implements PayingParty{

	/** 
	 * Default Constructor
	 * 
	 */
	public Vendor() { }
	
	/**
     * Pay will normally deduct money from the Vendor.
     * 
     * @param amount The amount that is paid
     */
	public void pay(double amount) {
		System.out.println("Vendor made payment.");
	}
}