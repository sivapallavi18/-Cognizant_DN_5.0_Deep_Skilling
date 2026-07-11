import java.util.Arrays;
import java.util.Comparator;
public class SearchTest {
    // Linear Search
    public static Product linearSearch(Product[] products, int targetId) {
        for (Product product : products) {
            if (product.productId == targetId) {
                return product;
            }
        }
        return null;
    }
    // Binary Search
    public static Product binarySearch(Product[] products, int targetId) {
        int left = 0;
        int right = products.length - 1;
        while (left <= right) {
            int mid = (left + right) / 2;
            if (products[mid].productId == targetId) {
                return products[mid];
            } else if (products[mid].productId < targetId) {

                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return null;
    }
    public static void main(String[] args) {
        Product[] products = {
            new Product(103, "Laptop", "Electronics"),
            new Product(101, "Shoes", "Fashion"),
            new Product(105, "Mobile", "Electronics"),
            new Product(102, "Watch", "Accessories"),
            new Product(104, "Bag", "Travel")
        };
        // Linear Search
        System.out.println("Linear Search Result:");
        Product result1 = linearSearch(products, 102);
        if (result1 != null) {
            result1.displayProduct();
        } else {
            System.out.println("Product Not Found");
        }
        // Sort Array for Binary Search
        Arrays.sort(products, Comparator.comparingInt(p -> p.productId));
        // Binary Search
        System.out.println("Binary Search Result:");
        Product result2 = binarySearch(products, 102);
        if (result2 != null) {
            result2.displayProduct();
        } else {
            System.out.println("Product Not Found");
        }
    }
}