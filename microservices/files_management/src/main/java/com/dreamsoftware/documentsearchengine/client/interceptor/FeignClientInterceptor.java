package com.dreamsoftware.documentsearchengine.client.interceptor;

import feign.RequestInterceptor;
import feign.RequestTemplate;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;
import org.springframework.stereotype.Component;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;

/**
 * Feign Client Interceptor
 *
 * @author ssanchez
 */
@Component
@Slf4j
public class FeignClientInterceptor implements RequestInterceptor {

    private static final String AUTHORIZATION_HEADER = "Authorization";
    private static final String TOKEN_TYPE = "Bearer";

    @Override
    public void apply(RequestTemplate requestTemplate) {
        log.debug("FeignClientInterceptor -> apply CALLED");
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication instanceof JwtAuthenticationToken) {
            log.debug("authentication != null -> " + authentication.getClass().getName());
            final JwtAuthenticationToken jwtAuthToken = (JwtAuthenticationToken) authentication;
            log.debug("Authentication token value -> " + jwtAuthToken.getToken().getTokenValue());
            requestTemplate.header(AUTHORIZATION_HEADER, String.format("%s %s", TOKEN_TYPE, jwtAuthToken.getToken().getTokenValue()));
        }
    }

}
