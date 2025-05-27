import java.util.*;

public class JavaExercises {

    // 1. Hello World Program
    public static void helloWorld() {
        System.out.println("Hello, World!");
    }

    // 2. Simple Calculator
    public static void simpleCalculator() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter first number: ");
        double num1 = scanner.nextDouble();
        System.out.print("Enter second number: ");
        double num2 = scanner.nextDouble();
        System.out.print("Choose operation (+, -, *, /): ");
        char op = scanner.next().charAt(0);

        switch (op) {
            case '+': System.out.println("Result: " + (num1 + num2)); break;
            case '-': System.out.println("Result: " + (num1 - num2)); break;
            case '*': System.out.println("Result: " + (num1 * num2)); break;
            case '/': System.out.println("Result: " + (num1 / num2)); break;
            default: System.out.println("Invalid operation.");
        }
    }

    // 3. Even or Odd Checker
    public static void evenOrOdd() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int num = scanner.nextInt();
        if (num % 2 == 0) {
            System.out.println("The number is even.");
        } else {
            System.out.println("The number is odd.");
        }
    }

    // 4. Leap Year Checker
    public static void leapYearChecker() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a year: ");
        int year = scanner.nextInt();
        if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
            System.out.println("It is a leap year.");
        } else {
            System.out.println("It is not a leap year.");
        }
    }

    // 5. Multiplication Table
    public static void multiplicationTable() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int num = scanner.nextInt();
        for (int i = 1; i <= 10; i++) {
            System.out.println(num + " * " + i + " = " + (num * i));
        }
    }

    // 6. Data Type Demonstration
    public static void dataTypeDemo() {
        int intVar = 10;
        float floatVar = 5.5f;
        double doubleVar = 10.99;
        char charVar = 'A';
        boolean boolVar = true;

        System.out.println("int: " + intVar);
        System.out.println("float: " + floatVar);
        System.out.println("double: " + doubleVar);
        System.out.println("char: " + charVar);
        System.out.println("boolean: " + boolVar);
    }

    // 7. Type Casting Example
    public static void typeCasting() {
        double myDouble = 9.99;
        int myInt = (int) myDouble;  // cast double to int
        System.out.println("Double value: " + myDouble);
        System.out.println("Casted to int: " + myInt);

        int anotherInt = 5;
        double anotherDouble = (double) anotherInt;  // cast int to double
        System.out.println("Int value: " + anotherInt);
        System.out.println("Casted to double: " + anotherDouble);
    }

    // Main Method to run the exercises
    public static void main(String[] args) {
        // Call exercises here
        helloWorld();
        simpleCalculator();
        evenOrOdd();
        leapYearChecker();
        multiplicationTable();
        dataTypeDemo();
        typeCasting();
    }
}
