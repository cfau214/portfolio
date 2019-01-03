package edu.ccsu.cs417.bank;

/**
 *
 * Represents a PayingParty's bank Account.
 * The name specifies whether the account is a Checking or Savings Account
 */
public class BankAccount extends Account
{
	
	/**
	 * Default Constructor
	 *
	 * Creates a new BankAccount with the specified name and an initial balance of 0
	 * @param name the name of the new account
	 */
	public BankAccount(String name) {
		this.balance = 0;
		this.name = name;
	}

	/**
	 * Creates a new BankAccount with the specified name and initial balance
	 * @param name the name of the new account
	 * @param initialBalance the initial balance of the new account
	 */
	public BankAccount(String name, double initialBalance) {
		this.balance = initialBalance;
		this.name = name;
	}

	/**
	 * Attempts to deduct funds from this account to pay a charge. If the account doesn't have enough money to cover the
	 * charge, move to the next account in the chain to cover the difference.
	 *
	 * @param amount the amount charged to the account
	 * @throws InsufficientFundsException if there are no accounts left and the charge cannot be covered with the funds from all accounts
	 */
	@Override
	public void deduct(double amount) throws InsufficientFundsException
	{
		if (amount <= balance) { // subtract the amount from the balance
			balance -= amount;
		} else if (successor != null) {
			successor.deduct(amount - balance); // check if successor has enough to cover difference
			balance = 0; // deduct the entire balance of the account
			turnLedOn(); // turn the led on if there is one as account is maxed out
		} else { // throw an exception as Accounts cannot cover expense
			throw new InsufficientFundsException("Sum of Party's Accounts cannot pay balance");
		}
	}

	/**
	 * Add Money to the Paying Party's account
	 * @param amount the amount added to the party's balance
	 */
	public void makeDeposit(double amount) {
		balance += amount;
	}

	/**
	 * Returns a hashcode value of the BankAccount
	 *
	 * @return a hashcode value of the BankAccount
	 */
	@Override
	public int hashCode() {
		return super.hashCode() + Double.hashCode(balance) + name.hashCode();
	}

	/**
	 * Determines if this BankAccount object is equal to another object
	 *
	 * @param obj the other object
	 * @return true if the account names and balance are equal, false if not equal or if obj isn't a BankAccount instance
	 */
	@Override
	public boolean equals(Object obj)
	{
		if (obj == null) { // false if obj is a null reference
			return false;
		}
		if (this == obj) { // true if obj references this BankAccount
			return true;
		}
		if (obj instanceof BankAccount) { // return true if obj has the same name and balance false if the two BankAccounts aren't equal
			BankAccount other = (BankAccount) obj;
			return this.name.equals(other.name) && this.balance == other.balance;
		}
		else { // false if obj isn't a BankAccount instance
			return false;
		}
	}

	/**
	 * Returns a string representation of the BankAccount
	 *
	 * @return The account's name and balance
	 */
	@Override
	public String toString() {
		return "Name: " + name + " Balance: " + balance;
	}
}