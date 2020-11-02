package com.dreamsoftware.documentsearchengine.web.core;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;
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
public class ErrorResponseDTO {

    /**
     * Field Errors
     */
    @JsonProperty("errors")
    private List<FieldErrorDTO> fieldErrors;

    /**
     * Add Field Error
     *
     * @param path
     * @param message
     */
    public void addFieldError(String path, String message) {
        fieldErrors.add(new FieldErrorDTO(path, message));
    }

}
