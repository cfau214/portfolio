/**
 * Main program for Homework Assignment 2.
 * 
 * @author Chris Fauteux
 * @author Nicholas Daddona
 * @author Nicholas Pipino
 * @author Mayowa oloyede
 * 
 * @since October 2018
 */
import edu.ccsu.cs417.bank.*;

public class Main {

    public static void main(String[] args) {

        BankAccount Checking = new BankAccount("checking");
        BankAccount Savings = new BankAccount("savings");
  
        // Create customer and add bank accounts.
        Customer customer = new Customer();
        customer.addAccount(Checking);
        customer.addAccount(Savings);
        
        
        Checking.makeDeposit(200.00);
        Savings.makeDeposit(50.00);      
        
        
        
        // Add credit accounts.
        CreditAccount credit = new CreditAccount("creditAccountOne");
        customer.addAccount(credit);
        credit = new CreditAccount("creditAccountTwo");
        customer.addAccount(credit);
        credit = new CreditAccount("creditAccountThree");
        customer.addAccount(credit);

        // TODO
        // Verify that program is working appropriately for the following pay calls.
        customer.pay(150);
        customer.pay(220);
        customer.pay(5000);
        
        // TODO
        // Go over entire project documentation and do a few test runs to make sure code is finalized.
        // Go through homework assignment pdf and make sure all classes are implemented properly.
        // Make final changes to Javadoc.
        // Make final implementations and finish the 'Main' section of the program now that classes are mostly complete.
        // Check for bugs and hotfix.
    }
}