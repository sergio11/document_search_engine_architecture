package com.dreamsoftware.documentsearchengine.config;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.messaging.MessageChannel;

/**
 *
 * @author ssanchez
 */
public interface AppStreamsConfig {

    String PROCESSED_FILES_CHANNEL = "processed-files-state";

    /**
     * Input Channel definition
     *
     * @return
     */
    @Input(PROCESSED_FILES_CHANNEL)
    MessageChannel inputProcessedFilesNotifications();
}
