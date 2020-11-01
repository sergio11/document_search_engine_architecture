package com.dreamsoftware.documentserachengine.web.core;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import org.springframework.http.HttpStatus;

@Data
@Builder
@AllArgsConstructor
public class APIResponse<T> {

    /**
     * Category
     */
    @JsonProperty("category")
    private String category;

    /**
     * Code
     */
    @JsonProperty("code")
    private Long code;

    /**
     * Response code name
     */
    @JsonProperty("code_name")
    private IResponseCodeTypes codeName;

    /**
     * Response Status
     */
    @JsonProperty("status")
    private ResponseStatusEnum status;

    /**
     * Response Http Status
     */
    @JsonProperty("http_status")
    private HttpStatus httpStatusCode;

    /**
     * Response Info Url
     */
    @JsonProperty("info_url")
    private String infoUrl;

    /**
     * Response Data
     */
    @JsonProperty("data")
    private T data;

}
