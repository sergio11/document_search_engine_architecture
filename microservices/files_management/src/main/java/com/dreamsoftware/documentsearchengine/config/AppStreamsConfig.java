package com.dreamsoftware.documentsearchengine.config;

import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;

/**
 *
 * @author ssanchez
 */
public interface AppStreamsConfig {

    String FILES_PROCESSED_OPERATIONS_CHANNEL = "files-processed-operations";

    /**
     *
     * @return
     */
    @Output(FILES_PROCESSED_OPERATIONS_CHANNEL)
    MessageChannel outboundFilesProcessedOperations();
}
