package com.dreamsoftware.documentsearchengine.handler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.integration.IntegrationMessageHeaderAccessor;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.kafka.support.KafkaHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;
import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileNotificationDTO;
import com.dreamsoftware.documentsearchengine.config.AppStreamsConfig;
import com.dreamsoftware.documentsearchengine.service.IProcessedFileNotificationService;

/**
 *
 * @author ssanchez
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class ProcessedFilesNotificationsHandler {

    private final IProcessedFileNotificationService processedFileNotificationService;

    /**
     *
     * @param processedFileNotification
     * @param topic
     * @param partition
     * @param offset
     * @param acknowledgment
     * @param deliveryAttempt
     */
    @StreamListener(AppStreamsConfig.PROCESSED_FILES_CHANNEL)
    public void onNewProcessedFileNotification(
            @Payload final ProcessedFileNotificationDTO processedFileNotification,
            @Header(KafkaHeaders.RECEIVED_TOPIC) String topic,
            @Header(KafkaHeaders.RECEIVED_PARTITION_ID) Integer partition,
            @Header(KafkaHeaders.OFFSET) Long offset,
            @Header(KafkaHeaders.ACKNOWLEDGMENT) Acknowledgment acknowledgment,
            @Header(IntegrationMessageHeaderAccessor.DELIVERY_ATTEMPT) Integer deliveryAttempt) {

        log.info("onNewProcessedFileNotification for file '{}' with state '{}' received from bus. topic: {}, partition: {}, offset: {}, deliveryAttempt: {}",
                processedFileNotification.getFilename(), processedFileNotification.getFileState(), topic, partition, offset, deliveryAttempt);

        try {
            processedFileNotificationService.save(processedFileNotification);
            // commit offset
            if (acknowledgment != null) {
                acknowledgment.acknowledge();
                log.info("Commit Offsets ...");
            }
        } catch (final Exception ex) {
            log.error("Collect Processed Files Notifications Exception -> " + ex.getMessage());
        }
    }
}
