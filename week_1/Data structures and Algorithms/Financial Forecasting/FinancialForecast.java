public class FinancialForecast {

    // Recursive Method to Calculate Future Value
    public static double forecastValue(double currentValue, double growthRate, int years) {

        // Base Condition
        if (years == 0) {

            return currentValue;
        }

        // Recursive Call
        return forecastValue(currentValue, growthRate, years - 1) * (1 + growthRate);
    }

    public static void main(String[] args) {

        double currentValue = 10000;

        double growthRate = 0.10; // 10%

        int years = 5;

        double futureValue = forecastValue(currentValue, growthRate, years);

        System.out.println("Current Value: " + currentValue);

        System.out.println("Growth Rate: " + (growthRate * 100) + "%");

        System.out.println("Years: " + years);

        System.out.println("Predicted Future Value: " + futureValue);
    }
}