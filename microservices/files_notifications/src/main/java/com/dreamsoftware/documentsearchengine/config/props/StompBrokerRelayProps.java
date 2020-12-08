package com.dreamsoftware.documentsearchengine.config.props;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 *
 * @author ssanchez
 */
@Data
@Component
public class StompBrokerRelayProps {

    /**
     * Broker Relay Destination Broadcast
     */
    @Value("${stomp.destination.broadcast}")
    private String destinationBroadcast;

    /**
     * Broker Relay Registry Broadcast
     */
    @Value("${stomp.registry.broadcast}")
    private String registryBroadcast;

    /**
     * Broker Relay Host
     */
    @Value("${stomp.host}")
    private String host;

    /**
     * Broker Relay Port
     */
    @Value("${stomp.port}")
    private int port;

    /**
     * Broker Relay Client Username
     */
    @Value("${stomp.client.username}")
    private String clientUsername;

    /**
     * Broker Relay Client Passcode
     */
    @Value("${stomp.client.passcode}")
    private String clientPasscode;

}
