import java.util.*;

interface myNum {
    boolean compute(int n);
}

public class Messy {
    public static void main(String[] args) {

        myNum isEven = (n) -> (n%2) == 0;
        System.out.println(isEven.compute(7));
    }
}