package com.dreamsoftware.documentsearchengine;

import com.dreamsoftware.documentsearchengine.config.AppStreamsConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.cloud.stream.annotation.EnableBinding;

@SpringBootApplication
@EnableFeignClients
@EnableBinding(AppStreamsConfig.class)
public class FilesManagementServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(FilesManagementServiceApplication.class, args);
    }

}
