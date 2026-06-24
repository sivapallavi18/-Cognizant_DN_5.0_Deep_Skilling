package com.example.mockitodemo;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class ServiceTest
{
    @Test
    public void testServiceWithMockRepository() {
        // Arrange
        Repository mockRepository = mock(Repository.class);
        when(mockRepository.getData()).thenReturn("Mock Data");

        Service service = new Service(mockRepository);

        // Act
        String result = service.processData();

        // Assert
        assertEquals("Processed Mock Data", result);
    }
}
