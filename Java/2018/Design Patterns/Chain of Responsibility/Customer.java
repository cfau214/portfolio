/**
 * Customer Class implements the PayingParty interface. The Customer class owns
 * the accounts that are used in COR.
 *
 */
import java.util.ArrayList;
import edu.ccsu.cs417.bank.*;
import edu.ccsu.cs417.*;

public class Customer implements PayingParty{

    private ArrayList<Account> accounts;	// List of accounts owned by the customer.
    private Led led;						// Led associated with customer.

    /** 
	 * Default Constructor
	 * 
	 */
    public Customer() {
        this.led = new Led("D3");
        this.accounts = new ArrayList<>();
    }

    /**
     * Pay will deduct money from the Customer's account starting with the initial
     * account 'checking.'
     * @param amount The amount that is paid
     */
    public void pay(double amount) {
        CheckProcessor cp = new CheckProcessor();
        
        cp.processCheck(accounts.get(0), amount);
    }

    /**
     * The addAccount method adds an account to the end of a Customers COR
     * @param newAccount
     */
    public void addAccount(Account newAccount) {

        accounts.add(newAccount);
    }
}