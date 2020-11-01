package com.dreamsoftware.documentsearchengine;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@OpenAPIDefinition(info
        = @Info(
                title = "Files Metadata API",
                version = "1.0",
                description = "Document Search Engine - Files Metadata API v1.0"
        )
)
public class FilesMetadataServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(FilesMetadataServiceApplication.class, args);
    }

}
