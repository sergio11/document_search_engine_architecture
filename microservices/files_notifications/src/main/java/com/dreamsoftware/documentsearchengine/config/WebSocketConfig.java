package com.dreamsoftware.documentsearchengine.config;

import javax.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import com.dreamsoftware.documentsearchengine.config.props.StompBrokerRelayProps;

/**
 *
 * @author ssanchez
 */
@Configuration
@EnableWebSocketMessageBroker
@RequiredArgsConstructor
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    private static final Logger logger = LoggerFactory.getLogger(WebSocketConfig.class);

    /**
     * Broker Relay Properties
     */
    private final StompBrokerRelayProps brokerRelayProps;

    /**
     * Configure Message Broker
     *
     * @param registry
     */
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry
                .enableStompBrokerRelay("/queue", "/topic")
                .setUserDestinationBroadcast(brokerRelayProps.getDestinationBroadcast())
                .setUserRegistryBroadcast(brokerRelayProps.getRegistryBroadcast())
                .setRelayHost(brokerRelayProps.getHost())
                .setRelayPort(brokerRelayProps.getPort())
                .setClientLogin(brokerRelayProps.getClientUsername())
                .setClientPasscode(brokerRelayProps.getClientPasscode())
                .setSystemLogin(brokerRelayProps.getClientUsername())
                .setSystemPasscode(brokerRelayProps.getClientPasscode());
    }

    /**
     * Register Endpoints
     *
     * @param registry
     */
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/notifications").setAllowedOrigins("*");
        registry.addEndpoint("/notifications").setAllowedOrigins("*").withSockJS();
    }

    @PostConstruct
    protected void onInit() {
        logger.debug("Stomp Host -> " + brokerRelayProps.getHost());
        logger.debug("Stomp Port -> " + brokerRelayProps.getPort());
        logger.debug("Stomp Client Username -> " + brokerRelayProps.getClientUsername());
        logger.debug("Stomp Client Passcode -> " + brokerRelayProps.getClientPasscode());
    }
}
