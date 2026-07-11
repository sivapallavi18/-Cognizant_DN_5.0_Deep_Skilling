package org.example;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class CalculatorTest
{
    private Calculator calculator;

    @Before
    public void setUp() {
        // Setup method runs before each test
        calculator = new Calculator();
        System.out.println("Setup completed");
    }

    @After
    public void tearDown() {
        // Teardown method runs after each test
        calculator = null;
        System.out.println("Teardown completed");
    }

    @Test
    public void testAdditionUsingAAA() {
        // Arrange
        int number1 = 10;
        int number2 = 5;

        // Act
        int result = calculator.add(number1, number2);

        // Assert
        assertEquals(15, result);
    }

    @Test
    public void testSubtractionUsingAAA() {
        // Arrange
        int number1 = 10;
        int number2 = 5;

        // Act
        int result = calculator.subtract(number1, number2);

        // Assert
        assertEquals(5, result);
    }

    @Test
    public void testMultiplicationUsingAAA() {
        // Arrange
        int number1 = 10;
        int number2 = 5;

        // Act
        int result = calculator.multiply(number1, number2);

        // Assert
        assertEquals(50, result);
    }

    @Test
    public void testCalculatorObjectIsCreated() {
        // Arrange is done in setUp()

        // Act
        Calculator actualCalculator = calculator;

        // Assert
        assertNotNull(actualCalculator);
    }
}
