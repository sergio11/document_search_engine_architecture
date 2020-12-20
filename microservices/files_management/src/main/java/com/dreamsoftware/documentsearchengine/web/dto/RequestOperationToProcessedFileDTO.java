package com.dreamsoftware.documentsearchengine.web.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 *
 * @author ssanchez
 */
@Data
@Builder
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class RequestOperationToProcessedFileDTO {

    /**
     * File Id
     */
    @JsonProperty("id")
    private String id;

    /**
     * File Name
     */
    @JsonProperty("name")
    private String filename;

    /**
     * Operation
     */
    @JsonProperty("operation")
    private RequestOperationTypeEnum operation;

}
