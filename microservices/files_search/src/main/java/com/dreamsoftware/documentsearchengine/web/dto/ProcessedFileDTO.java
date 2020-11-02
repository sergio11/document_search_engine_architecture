package com.dreamsoftware.documentsearchengine.web.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.Date;
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
public class ProcessedFileDTO {

    /**
     * File Id
     */
    @JsonProperty("id")
    private String id;

    @JsonProperty("version")
    private Integer version;

    /**
     * File UUID
     */
    @JsonProperty("uuid")
    private String uuid;

    /**
     * File Name
     */
    @JsonProperty("name")
    private String name;

    /**
     * File Permissions
     */
    @JsonProperty("permissions")
    private String permissions;

    /**
     * File Mime Type
     */
    @JsonProperty("mime_type")
    private String mimeType;

    /**
     * File Mime Extension
     */
    @JsonProperty("mime_extension")
    private String mimeExtension;

    /**
     * File Created At
     */
    @JsonProperty("created_at")
    private Date createdAt;

    /**
     * File Language
     */
    @JsonProperty("language")
    private String language;

    /**
     * File Author
     */
    @JsonProperty("author")
    private String author;

    /**
     * File Creator
     */
    @JsonProperty("creator")
    private String creator;

    /**
     * File Producer
     */
    @JsonProperty("producer")
    private String producer;

    /**
     * File Last Modified Time
     */
    @JsonProperty("last_modified_time")
    private Date lastModifiedTime;

}
