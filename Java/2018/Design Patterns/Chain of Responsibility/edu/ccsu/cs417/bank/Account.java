package edu.ccsu.cs417.bank;

import edu.ccsu.cs417.Led;

/**
 * An implementation of the Chain of Responsibility design pattern.
 * Each Account has access to its successor in the chain and the led associated with it
 */
public abstract class Account
{

	protected Account successor; 	// the successor to this account in the chain
	protected Led led; 			 	// the edu.ccsu.cs417.bank.Led associated with this account
	protected String name;		 	// name associated for an account
	protected double balance;	 	// balance for the account

	/**
	 * Default constructor
	 *
	 * Creates a new account with no successor and no led
	 */
	public Account() {
		this.successor = null;
		this.led = null;
	}

	/**
	 * Adds a new led that will be associated with this account
	 *
	 * @param newLed The edu.ccsu.cs417.bank.Led that will be added to this account
	 */
	public void addLed(Led newLed) {
		this.led = newLed;
	}

	/**
	 * Removes and returns the edu.ccsu.cs417.bank.Led associated with this account
	 *
	 * @return the edu.ccsu.cs417.bank.Led that was associated with this account
	 */
	public Led removeLed() {
		Led temp = led;
		led = null;
		return temp;
	}

	/**
	 * Turns on the Led associated with this account, if it has one
	 */
	public void turnLedOn() {
		if (led != null) { // check if the account has an led
			led.turnOn();
		}
	}

	/**
	 * Turns off the Led associated with this account, if it has one
	 */
	public void turnLedOff() {
		if (led != null) { // check if the account has an led
			led.turnOff();
		}
	}

	/**
	 * Determines if this Account's led is on, if it has one
	 *
	 * @return true if the Led is on, false if off or there is no Led
	 */
	public boolean getLedStatus() {
		boolean temp = false;
		if (led != null) { // check if the account has an led
			temp = led.isOn();
		}
		return temp;
	}

	/**
	 * Attempts to use an account to pay a charge. Charge is handled differently depending on the account type
	 * If the account doesn't have enough money to cover the charge, move to the next account in the chain to try to
	 * cover the difference.
	 *
	 * @param amount the amount charged to the account
	 * @throws InsufficientFundsException if there are no accounts left and the charge cannot be covered with the funds from all accounts
	 */
	public abstract void deduct(double amount) throws InsufficientFundsException;

    /**
     * Adds a new Account to the Chain of Responsibility that this Account is a part of.
     *
     * @param newAccount the new account that will be added to the chain of accounts
     */
	public void addAccount(Account newAccount) {
	    Account temp = this;
	    while (temp.successor != null) { // walk through the chain until reaching the end
	        temp = temp.successor;
        }
        temp.successor = newAccount; // add the account to the end
    }

	/**
	 * Returns a hashcode value of the Account
	 *
	 * @return a hash code value for this account
	 */
	@Override
	public int hashCode() {
		int temp = super.hashCode();
		if (led != null) { // check if the account has an led
			temp += led.hashCode();
		}
		return temp;
	}
}