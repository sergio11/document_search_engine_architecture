package com.dreamsoftware.documentsearchengine.persistance.entity;

import static com.dreamsoftware.documentsearchengine.persistance.entity.ProcessedFileEntity.INDEX_NAME;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.DateFormat;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

/**
 *
 * @author ssanchez
 */
@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
@Document(indexName = INDEX_NAME, createIndex = false)
public class ProcessedFileEntity {

    public final static String INDEX_NAME = "processed_files";

    /**
     * Document Id
     */
    @Id
    private String id;

    /**
     * Document Version
     */
    @Field(name = "@version")
    private Integer version;

    /**
     * File Created At
     */
    @Field(name = "document.metadata.created", type = FieldType.Date, format = DateFormat.date_time_no_millis)
    private Date createdAt;

    /**
     * Processed At
     */
    /*@Field(name = "document.document.processed_at", type = FieldType.Date,
            format = DateFormat.custom, pattern = "EEE MMM d HH:mm:ss z yyyy")
    private Date processedAt;*/
    /**
     * File Language
     */
    @Field(name = "document.metadata.language", type = FieldType.Text)
    private String language;

    /**
     * File Author
     */
    @Field(name = "document.metadata.author", type = FieldType.Text)
    private String author;

    /**
     * File Creator
     */
    @Field(name = "document.metadata.creator", type = FieldType.Text)
    private String creator;

    /**
     * File Producer
     */
    @Field(name = "document.metadata.producer", type = FieldType.Text)
    private String producer;

    /**
     * File UUID
     */
    @Field(name = "document.attrs.uuid", type = FieldType.Text)
    private String uuid;

    /**
     * File Name
     */
    @Field(name = "document.attrs.filename", type = FieldType.Text)
    private String name;

    /**
     * File Permissions
     */
    @Field(name = "document.attrs.file_permissions", type = FieldType.Text)
    private String permissions;

    /**
     * File Mime Type
     */
    @Field(name = "document.attrs.mime_type", type = FieldType.Text)
    private String mimeType;

    /**
     * File Mime Extension
     */
    @Field(name = "document.attrs.mime_extension", type = FieldType.Text)
    private String mimeExtension;

    /**
     * File Last Modified Time
     */
    @Field(name = "document.attrs.file_lastModifiedTime", type = FieldType.Date, format = DateFormat.date_time_no_millis)
    private Date lastModifiedTime;

}
