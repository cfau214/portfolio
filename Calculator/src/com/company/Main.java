package com.company;
import com.company.Calculator.*;

public class Main {

    public static void main(String[] args) {

        Calculator myCalc = new Calculator();

        System.out.println("Add: 5 + 7 = " + myCalc.add(5,7));
        System.out.println("Sub: 12 - 5 = " + myCalc.subtract(12,5));
        System.out.println("Mult: 10 * 3 = " + myCalc.multiply(10,3));
        System.out.println("Mult Recursively: 2 * 20 = " + myCalc.multiplyRecursive(2,20));
    }
}
