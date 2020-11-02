package com.dreamsoftware.documentsearchengine.config;

import java.security.KeyStore;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.time.Duration;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.elasticsearch.client.RestHighLevelClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.client.ClientConfiguration;
import org.springframework.data.elasticsearch.client.RestClients;
import org.springframework.data.elasticsearch.config.AbstractElasticsearchConfiguration;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;

/**
 *
 * @author ssanchez
 */
@Configuration
@EnableElasticsearchRepositories
public class ElasticSearchClientConfig extends AbstractElasticsearchConfiguration {

    private static final Logger logger = LoggerFactory.getLogger(ElasticSearchClientConfig.class);

    @Value("${elasticsearch.host}")
    private String host;

    @Value("${elasticsearch.cert.file}")
    private String certFile;

    @Value("${elasticsearch.cert.password}")
    private String certPassword;

    @Value("${elasticsearch.user.name}")
    private String userName;

    @Value("${elasticsearch.user.pass}")
    private String userPassword;

    /**
     * Provide the elasticsearch REST client
     *
     * @return
     */
    @Override
    public RestHighLevelClient elasticsearchClient() {
        final ClientConfiguration clientConfiguration = ClientConfiguration.builder()
                .connectedTo(host) // set the address of the Elasticsearch cluster
                .usingSsl(createSSLContext(), (String s, SSLSession sslSession) -> true) // use the SSLContext with the client cert
                .withConnectTimeout(Duration.ofSeconds(5))
                .withSocketTimeout(Duration.ofSeconds(3))
                .withBasicAuth(userName, userPassword) // use the headers for authentication
                .build();
        return RestClients.create(clientConfiguration).rest();
    }

    private SSLContext createSSLContext() {
        try {

            // Init PKCS12 Key Store
            KeyStore ks = KeyStore.getInstance("PKCS12");
            ks.load(getClass().getClassLoader().getResourceAsStream(certFile),
                    certPassword.toCharArray());

            logger.debug("KeyStore has " + ks.size() + " entries");

            KeyManagerFactory keyManagerFactory = KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
            keyManagerFactory.init(ks, certPassword.toCharArray());

            TrustManager tm = new X509TrustManager() {
                @Override
                public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                }

                @Override
                public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                }

                @Override
                public X509Certificate[] getAcceptedIssuers() {
                    return null;
                }
            };

            SSLContext sslContext = SSLContext.getInstance("TLS");
            sslContext.init(keyManagerFactory.getKeyManagers(), new TrustManager[]{tm}, null);

            return sslContext;

        } catch (Exception e) {
            logger.debug("cannot create SSLContext -> " + e.getMessage());
        }
        return null;
    }

}
