package edu.ccsu.cs417.bank;

/**
 * An exception used to signify that an Account has insufficient resources to cover a charge. Also used to signify that
 * all accounts in a chain cannot collectively cover a charge.
 */
public class InsufficientFundsException extends java.lang.Exception {

	/**
	 * Default Constructor
	 *
	 * Create a new InsufficientFundsExceptionw with no message
	 */
	public InsufficientFundsException() {
		super();
	}

	/**
	 * Create a new InsufficientFunds Exception with the passed message
	 * @param message the message the exception will carry
	 */
	public InsufficientFundsException(String message) {
		super(message);
	}
}