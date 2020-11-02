package com.dreamsoftware.documentsearchengine.web.core;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author ssanchez
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FieldErrorDTO {

    /**
     * Field Name
     */
    @JsonProperty("field")
    private String field;

    /**
     * Field Message Error
     */
    @JsonProperty("message")
    private String message;

}
