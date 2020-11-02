package com.dreamsoftware.documentsearchengine.web.core;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;

/**
 *
 * @author ssanchez
 */
@Component
public class ResponseHelper {

    private final static String RESPONSE_CODE_HEADER_NAME = "X-RESPONSE-CODE";
    private final static String RESPONSE_NAME_HEADER_NAME = "X-RESPONSE-NAME";

    public static String BASE_API_ANY_REQUEST;
    public static String AUTHENTICATION_ANY_REQUEST;

    /**
     * Create and Send Versionable Response
     *
     * @param <T>
     * @param response
     * @param headersMap
     * @return
     */
    public <T extends IVersionable> ResponseEntity<APIResponse<T>> createAndSendVersionableResponse(APIResponse<T> response, Map<String, String> headersMap) {
        return ResponseEntity
                .status(response.getHttpStatusCode())
                .headers(buildHeaders(headersMap))
                .eTag(response.getData().getVersion())
                .body(response);
    }

    /**
     * Create and Send Response
     *
     * @param <T>
     * @param response
     * @param headersMap
     * @return
     */
    public <T> ResponseEntity<APIResponse<T>> createAndSendResponse(APIResponse<T> response, Map<String, String> headersMap) {
        return ResponseEntity
                .status(response.getHttpStatusCode())
                .headers(buildHeaders(headersMap))
                .body(response);
    }

    /**
     * Create and Send Versionable Response
     *
     * @param <T>
     * @param response
     * @return
     */
    public <T extends IVersionable> ResponseEntity<APIResponse<T>> createAndSendVersionableResponse(APIResponse<T> response) {
        return createAndSendVersionableResponse(response, null);
    }

    /**
     * Create and Send Response
     *
     * @param <T>
     * @param response
     * @return
     */
    public <T> ResponseEntity<APIResponse<T>> createAndSendResponse(APIResponse<T> response) {
        return createAndSendResponse(response, null);
    }

    /**
     * Create And Send Versionable Response
     *
     * @param <T>
     * @param responseCode
     * @param httpStatusCode
     * @param data
     * @return
     */
    public <T extends IVersionable> ResponseEntity<APIResponse<T>> createAndSendVersionableResponse(
            IResponseCodeTypes responseCode, HttpStatus httpStatusCode, T data) {

        final APIResponse<T> response = APIResponse.<T>builder()
                .status(ResponseStatusEnum.SUCCESS)
                .category(responseCode.getCategoryName())
                .code(responseCode.getResponseCode())
                .codeName(responseCode)
                .httpStatusCode(httpStatusCode)
                .infoUrl(getInfoUrl(responseCode))
                .data(data)
                .build();

        return createAndSendVersionableResponse(response);
    }

    /**
     * Create And Send Response
     *
     * @param <T>
     * @param responseCode
     * @param httpStatusCode
     * @param data
     * @return
     */
    public <T> ResponseEntity<APIResponse<T>> createAndSendResponse(
            IResponseCodeTypes responseCode, HttpStatus httpStatusCode, T data) {

        final APIResponse<T> response = APIResponse.<T>builder()
                .status(ResponseStatusEnum.SUCCESS)
                .category(responseCode.getCategoryName())
                .code(responseCode.getResponseCode())
                .codeName(responseCode)
                .httpStatusCode(httpStatusCode)
                .infoUrl(getInfoUrl(responseCode))
                .data(data)
                .build();

        return createAndSendResponse(response);
    }

    /**
     * Create and send error response
     *
     * @param responseCode
     * @param httpStatusCode
     * @param fieldErrors
     * @return
     */
    public ResponseEntity<APIResponse<ErrorResponseDTO>> createAndSendErrorResponse(IResponseCodeTypes responseCode, HttpStatus httpStatusCode, List<FieldErrorDTO> fieldErrors) {

        final APIResponse<ErrorResponseDTO> response = APIResponse.<ErrorResponseDTO>builder()
                .status(ResponseStatusEnum.ERROR)
                .category(responseCode.getCategoryName())
                .code(responseCode.getResponseCode())
                .codeName(responseCode)
                .httpStatusCode(httpStatusCode)
                .infoUrl(getInfoUrl(responseCode))
                .data(new ErrorResponseDTO(fieldErrors))
                .build();

        return createAndSendResponse(response);
    }

    /**
     * Create and send error response
     *
     * @param responseCode
     * @param httpStatusCode
     * @param message
     * @return
     */
    public ResponseEntity<APIResponse<ErrorResponseDTO>> createAndSendErrorResponse(IResponseCodeTypes responseCode, HttpStatus httpStatusCode, String message) {

        final APIResponse<ErrorResponseDTO> response = APIResponse.<ErrorResponseDTO>builder()
                .status(ResponseStatusEnum.ERROR)
                .category(responseCode.getCategoryName())
                .code(responseCode.getResponseCode())
                .codeName(responseCode)
                .httpStatusCode(httpStatusCode)
                .infoUrl(getInfoUrl(responseCode))
                .data(new ErrorResponseDTO(Arrays.asList(
                        FieldErrorDTO.builder().message(message).build())))
                .build();

        return createAndSendResponse(response);
    }

    /**
     * Create and send error response
     *
     * @param responseCode
     * @param httpStatusCode
     * @param fieldErrors
     * @param headers
     * @return
     */
    public ResponseEntity<APIResponse<ErrorResponseDTO>> createAndSendErrorResponse(IResponseCodeTypes responseCode, HttpStatus httpStatusCode, List<FieldErrorDTO> fieldErrors,
            Map<String, String> headers) {

        final APIResponse<ErrorResponseDTO> response = APIResponse.<ErrorResponseDTO>builder()
                .status(ResponseStatusEnum.ERROR)
                .category(responseCode.getCategoryName())
                .code(responseCode.getResponseCode())
                .codeName(responseCode)
                .httpStatusCode(httpStatusCode)
                .infoUrl(getInfoUrl(responseCode))
                .data(new ErrorResponseDTO(fieldErrors))
                .build();

        return createAndSendResponse(response, headers);
    }

    /**
     * Create and send Error response with header
     *
     * @param <T>
     * @param responseCode
     * @param httpStatusCode
     * @param data
     * @return
     */
    public <T> ResponseEntity<APIResponse<T>> createAndSendErrorResponseWithHeader(IResponseCodeTypes responseCode, HttpStatus httpStatusCode, T data) {

        final APIResponse<T> response = APIResponse.<T>builder()
                .status(ResponseStatusEnum.ERROR)
                .category(responseCode.getCategoryName())
                .code(responseCode.getResponseCode())
                .codeName(responseCode)
                .httpStatusCode(httpStatusCode)
                .infoUrl(getInfoUrl(responseCode))
                .data(data)
                .build();

        Map<String, String> headers = new HashMap<>();
        headers.put(RESPONSE_CODE_HEADER_NAME, responseCode.getResponseCode().toString());
        headers.put(RESPONSE_NAME_HEADER_NAME, responseCode.toString());

        return createAndSendResponse(response, headers);
    }

    /**
     * Get info url
     *
     * @param responseCode
     * @return
     */
    protected String getInfoUrl(IResponseCodeTypes responseCode) {
        return "http://yourAppUrlToDocumentedApiCodes.com/api/support/" + responseCode.getResponseCode();
    }

    /**
     * Private Methods
     */
    private HttpHeaders buildHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Cache-Control", "no-store");
        headers.set("Pragma", "no-cache");
        headers.setContentType(MediaType.APPLICATION_JSON);
        return headers;
    }

    /**
     * Build Headers
     *
     * @param headersMap
     * @return
     */
    private HttpHeaders buildHeaders(@Nullable Map<String, String> headersMap) {
        final HttpHeaders headers = buildHeaders();
        if (headersMap != null) {
            headersMap.entrySet().forEach((headerEntry) -> {
                headers.set(headerEntry.getKey(), headerEntry.getValue());
            });
        }
        return headers;
    }

}
