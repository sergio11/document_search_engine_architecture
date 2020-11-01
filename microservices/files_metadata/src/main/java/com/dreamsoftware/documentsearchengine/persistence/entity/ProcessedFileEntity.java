package com.dreamsoftware.documentsearchengine.persistence.entity;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 *
 * @author ssanchez
 */
@Document(collection = ProcessedFileEntity.COLLECTION_NAME)
public class ProcessedFileEntity {

    public final static String COLLECTION_NAME = "processed_files";

    /**
     * Id
     */
    @Id
    private ObjectId id;

    /**
     * File Name
     */
    @Field("attrs.filename")
    private String name;

    /**
     * File Permissions
     */
    @Field("attrs.file_permissions")
    private String permissions;

    /**
     * File Mime Type
     */
    @Field("attrs.mime_type")
    private String mimeType;

    /**
     * File Mime Extension
     */
    @Field("attrs.mime_extension")
    private String mimeExtension;

    /**
     * File UUID
     */
    @Field("attrs.uuid")
    private String uuid;

    /**
     * File Created At
     */
    @Field("metadata.created")
    private String createdAt;

    /**
     * File Language
     */
    @Field("metadata.language")
    private String language;

    /**
     * File Author
     */
    @Field("metadata.Author")
    private String author;

    /**
     * File Creator
     */
    @Field("metadata.creator")
    private String creator;

    /**
     * File Producer
     */
    @Field("metadata.producer")
    private String producer;
    /**
     * File Last Modified Time
     */
    @Field("attrs.file_lastModifiedTime")
    private String lastModifiedTime;

    /**
     * File Processed At
     */
    @Field("document.processed_at")
    private String processedAt;

}
