package com.example.devops;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class HelloWorldApplication {

	public static void main(String[] args) {
		//System.setProperty("server.port", "8000");
		SpringApplication.run(HelloWorldApplication.class, args);
	}

}
