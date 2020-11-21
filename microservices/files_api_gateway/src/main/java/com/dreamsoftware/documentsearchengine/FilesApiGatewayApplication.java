package com.dreamsoftware.documentsearchengine;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class FilesApiGatewayApplication {

    private static final Logger LOGGER = LoggerFactory.getLogger(FilesApiGatewayApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(FilesApiGatewayApplication.class, args);
    }

    /*@GetMapping(value = "/token")
    public Mono<String> getHome(@RegisteredOAuth2AuthorizedClient OAuth2AuthorizedClient authorizedClient) {
        return Mono.just(authorizedClient.getAccessToken().getTokenValue());
    }

    @GetMapping("/")
    public Mono<String> index(WebSession session) {
        return Mono.just(session.getId());
    }*/
}
