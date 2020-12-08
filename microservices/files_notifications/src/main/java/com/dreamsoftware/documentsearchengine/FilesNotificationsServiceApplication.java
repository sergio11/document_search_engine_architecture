package com.dreamsoftware.documentsearchengine;

import com.dreamsoftware.documentsearchengine.config.AppStreamsConfig;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.stream.annotation.EnableBinding;

@SpringBootApplication
@OpenAPIDefinition(info
        = @Info(
                title = "Files Notifications API",
                version = "1.0",
                description = "Document Search Engine - Files Notifications API v1.0"
        )
)
@EnableBinding(AppStreamsConfig.class)
public class FilesNotificationsServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(FilesNotificationsServiceApplication.class, args);
    }

}
