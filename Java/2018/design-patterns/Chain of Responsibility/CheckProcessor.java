import edu.ccsu.cs417.bank.*;

public class CheckProcessor {

	public CheckProcessor() {

	}

	/**
	 * This method calls the deduct method on the passed account to start
	 * the COR. It is initiated when a paying party calls their pay method.
	 * @param account the account to be deducted
	 * @param charge the amount deducted
	 * @return boolean If insufficientFundsException is caught returns false,
	 * else returns true
	 */
	public boolean processCheck(Account account, double charge) {

		try{
			account.deduct(charge);

		}catch(InsufficientFundsException e){
			System.out.println(e.getMessage());
			return false;
		}

		return true;
	}
}