package com.library;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.library.service.BookService;

public class MainApp {

    public static void main(String[] args) {

        // Load Spring Container
        try (ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml")) {

            // Get Bean
            BookService service =
                    (BookService) context.getBean("bookService");

            // Call Method
            service.showService();
        }
    }
}