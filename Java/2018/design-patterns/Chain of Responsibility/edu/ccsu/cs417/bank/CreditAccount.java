package edu.ccsu.cs417.bank;
import edu.ccsu.cs417.*;

/**
 * Represents a PayingParty's Credit Account.
 * Contains the current charges applied to the account and the account's maximum credit limit
 */
public class CreditAccount extends Account
{
	
	private double creditLimit; // the maximum credit limit on the account

	/** 
	 * Default Constructor
	 * 
	 * @param name String - Name attached to the account.
	 */
	public CreditAccount(String name) {
	    this.name = name;
	    
	    if (this.name == "creditAccountTwo")
            this.led = new Led("D6");
	    
	    this.creditLimit = 50;	// Default value for credit accounts. See overloaded constructor for implementation when instantiating.
	}
	
	/**
	 * Overloaded Constructor
	 *
	 * Creates a new CreditAccount with the specified credit limit
	 * @param creditLimit the maximum amount that can be charged to this account
	 */
	public CreditAccount(String name, double creditLimit) {
		this.creditLimit = creditLimit;
		this.name = name;
	    
	    if (this.name == "creditAccountTwo")
            this.led = new Led("D6");
	}

	/**
	 * Attempts to place a charge on this account to pay the amount. If the account doesn't have enough money to cover the
	 * charge, move to the next account in the chain to cover the difference.
	 *
	 * @param amount the amount charged to the account
	 * @throws InsufficientFundsException if there are no accounts left and the charge cannot be covered with the funds from all accounts
	 */
	@Override
	public void deduct(double amount) throws InsufficientFundsException
	{
		if (amount <= (creditLimit - balance)) { // deduct from account if there's enough credit left
			balance += amount;
		} else if (successor != null) {
			successor.deduct(amount - (creditLimit - balance)); // check if successor has enough credit left to cover difference
			balance = creditLimit; // max out the credit account
			turnLedOn(); // turn the led on if there is one as account is maxed out
		} else {
			throw new InsufficientFundsException("Sum of Party's Accounts cannot pay balance"); // throw an exception as Accounts cannot cover expense
		}
	}

	/**
	 * Attempts to place a credit on this account to pay the amount charged. A failure to pay the amount will not result
	 * in trying the next account in the chain.
	 *
	 * @param amount the amount charged to the account
	 * @throws InsufficientFundsException if this account cannot cover the charge
	 */
	public void charge(double amount) throws InsufficientFundsException
	{
		if (amount <= (creditLimit - balance)) {
			balance += amount; // charge the amount to the account
		}
		else { // throw an exception if the account can't pay the charge
			throw new InsufficientFundsException("Credit limit reached: Required Credit: "
					+ amount + " Available credit: " + (creditLimit - balance));
		}
	}
	
	/**
	 * Change the credit limit on the account.
	 * @param amount - Amount to change the credit limit of the account to.
	 */
	public void setCreditLimit(double amount) {
		this.creditLimit = amount;
	}

	/**
	 * Returns a hashcode value of the CreditAccount
	 *
	 * @return a hashcode value of the CreditAccount
	 */
	@Override
	public int hashCode() {
		return super.hashCode() + Double.hashCode(balance) + Double.hashCode(creditLimit);
	}

	/**
	 * Determines if this CreditAccount object is equal to another object
	 *
	 * @param obj the other object
	 * @return true if the account balance and credit limits are equal, false if not equal or if obj isn't a CreditAccount instance
	 */
	@Override
	public boolean equals(Object obj)
	{
		if (obj == null) { // false if obj is a null reference
			return false;
		}
		if (this == obj) { // true if obj references this CreditAccount
			return true;
		}
 		if (obj instanceof CreditAccount) { // return true if both objects have the same balance and credit limit
			CreditAccount other = (CreditAccount) obj; // safe cast
			return this.balance == other.balance && this.creditLimit == other.creditLimit;
		}
		else { // false if obj isn't a CreditAccount instance
			return false;
		}
	}

	/**
	 * Return a String representation of this Credit Account
	 *
	 * @return the CreditAccount's current balance and max credit limit
	 */
	@Override
	public String toString() {
		return "Balance: " + balance + " Credit Limit: " + creditLimit;
	}
}