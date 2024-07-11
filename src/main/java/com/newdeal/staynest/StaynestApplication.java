package com.newdeal.staynest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude={SecurityAutoConfiguration.class})
public class StaynestApplication {

    public static void main(String[] args) {
        SpringApplication.run(StaynestApplication.class, args);
    }

}
