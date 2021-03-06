package com.dreamsoftware.documentsearchengine.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.oauth2.server.resource.OAuth2ResourceServerConfigurer;

/**
 *
 * @author ssanchez
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private static final String[] AUTH_WHITELIST_SWAGGER_V2 = {
        // -- swagger ui
        "/v2/api-docs",
        "/swagger-resources/**",
        "/configuration/ui",
        "/configuration/security",
        "/swagger-ui.html",
        "/webjars/**"
    };

    private static final String[] AUTH_WHITELIST_SWAGGER_V3 = {
        // -- swagger ui
        "/v2/api-docs",
        "/v2/api-docs/**",
        "/v3/api-docs",
        "/v3/api-docs/**",
        "/swagger-resources/**",
        "/swagger-ui/**",};

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests(authorize
                -> authorize.antMatchers("/actuator/**")
                        .permitAll()
                        .antMatchers(AUTH_WHITELIST_SWAGGER_V2).permitAll()
                        .antMatchers(AUTH_WHITELIST_SWAGGER_V3).permitAll()
                        .anyRequest()
                        .authenticated()
        )
                .oauth2ResourceServer(OAuth2ResourceServerConfigurer::jwt);
    }

}
