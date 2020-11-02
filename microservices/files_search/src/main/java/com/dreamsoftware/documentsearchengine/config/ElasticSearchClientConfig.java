package com.dreamsoftware.documentsearchengine.config;

import java.io.IOException;
import java.io.InputStream;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.time.Duration;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.KeyManager;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;
import org.apache.http.conn.ssl.TrustSelfSignedStrategy;
import org.apache.http.ssl.SSLContextBuilder;
import org.elasticsearch.client.RestHighLevelClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.client.ClientConfiguration;
import org.springframework.data.elasticsearch.client.RestClients;
import org.springframework.data.elasticsearch.config.AbstractElasticsearchConfiguration;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;
import org.springframework.util.ResourceUtils;

/**
 *
 * @author ssanchez
 */
@Configuration
@EnableElasticsearchRepositories
public class ElasticSearchClientConfig extends AbstractElasticsearchConfiguration {

    private static final Logger logger = LoggerFactory.getLogger(ElasticSearchClientConfig.class);

    private static final String CERT_FILE = "elastic-certificates.p12";
    private static final String CERT_PASSWORD = "ssanchez00";
    private static final String USER_NAME = "elastic";
    private static final String USER_PASS = "ssanchez00";

    /**
     * Provide the elasticsearch REST client
     *
     * @return
     */
    @Override
    public RestHighLevelClient elasticsearchClient() {
        final ClientConfiguration clientConfiguration = ClientConfiguration.builder()
                .connectedTo("localhost:9200") // set the address of the Elasticsearch cluster
                .usingSsl(createSSLContext(), new HostnameVerifier() {
                    @Override
                    public boolean verify(String s, SSLSession sslSession) {
                        logger.debug("HostnameVerifier CALLED " + s);
                        return true;
                    }
                }) // use the SSLContext with the client cert
                .withConnectTimeout(Duration.ofSeconds(5))
                .withSocketTimeout(Duration.ofSeconds(3))
                .withBasicAuth(USER_NAME, USER_PASS) // use the headers for authentication
                .build();
        return RestClients.create(clientConfiguration).rest();
    }

    private SSLContext createSSLContext() {
        try {

            // Init PKCS12 Key Store
            KeyStore ks = KeyStore.getInstance("PKCS12");
            ks.load(getClass().getClassLoader().getResourceAsStream(CERT_FILE),
                    CERT_PASSWORD.toCharArray());

            logger.debug("KeyStore has " + ks.size() + " entries");

            KeyManagerFactory keyManagerFactory = KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
            keyManagerFactory.init(ks, CERT_PASSWORD.toCharArray());

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
