package org.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class ApiServiceTest
{
    @Test
    public void testServiceWithMockRestClient() {
        // Arrange
        RestClient mockRestClient = mock(RestClient.class);
        when(mockRestClient.getResponse()).thenReturn("Mock Response");

        ApiService apiService = new ApiService(mockRestClient);

        // Act
        String result = apiService.fetchData();

        // Assert
        assertEquals("Fetched Mock Response", result);
    }
}
