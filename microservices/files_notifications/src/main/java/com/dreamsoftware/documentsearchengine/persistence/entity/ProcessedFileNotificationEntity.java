package com.dreamsoftware.documentsearchengine.persistence.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 *
 * @author ssanchez
 */
@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
@Document(collection = ProcessedFileNotificationEntity.COLLECTION_NAME)
public class ProcessedFileNotificationEntity {

    public final static String COLLECTION_NAME = "processed_files_notification";

    /**
     * Id
     */
    @Id
    private ObjectId id;

    /**
     * File Name
     */
    @Field("file_name")
    private String filename;

    /**
     * File Last Modified Time
     */
    @Field("file_last_modified_time")
    private String fileLastModifiedTime;

    /**
     * File Mime Extension
     */
    @Field("file_mime_extension")
    private String fileMimeExtension;

    /**
     * File Mime Type
     */
    @Field("file_mime_type")
    private String fileMimeType;

    /**
     * File HDFS Path
     */
    @Field("file_hdfs_path")
    private String fileHdfsPath;

    /**
     * File State
     */
    @Field("file_state")
    private String fileState;

}
