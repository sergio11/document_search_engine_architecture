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

}
