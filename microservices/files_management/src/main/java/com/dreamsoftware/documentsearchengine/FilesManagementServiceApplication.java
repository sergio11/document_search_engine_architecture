package com.dreamsoftware.documentsearchengine;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class FilesManagementServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(FilesManagementServiceApplication.class, args);
    }

}
