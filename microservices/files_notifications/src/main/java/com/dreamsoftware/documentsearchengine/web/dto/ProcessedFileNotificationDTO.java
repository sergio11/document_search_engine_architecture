package com.dreamsoftware.documentsearchengine.web.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 *
 * @author ssanchez
 */
@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class ProcessedFileNotificationDTO {

    /**
     * File Name
     */
    @JsonProperty("file_name")
    private String filename;

    /**
     * File Last Modified Time
     */
    @JsonProperty("file_last_modified_time")
    private String fileLastModifiedTime;

    /**
     * File Mime Extension
     */
    @JsonProperty("file_mime_extension")
    private String fileMimeExtension;

    /**
     * File Mime Type
     */
    @JsonProperty("file_mime_type")
    private String fileMimeType;

    /**
     * File HDFS Path
     */
    @JsonProperty("file_hdfs_path")
    private String fileHdfsPath;

    /**
     * File State
     */
    @JsonProperty("file_state")
    private String fileState;

}
