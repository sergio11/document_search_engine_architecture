package com.dreamsoftware.documentsearchengine.web.controller.error;

import com.dreamsoftware.documentsearchengine.web.controller.FilesMetadataResponseCodeEnum;
import com.dreamsoftware.documentsearchengine.web.controller.error.exception.FileProcessedNotFoundException;
import com.dreamsoftware.documentsearchengine.web.controller.error.exception.NoFilesProcessedFoundException;
import com.dreamsoftware.documentsearchengine.web.core.APIResponse;
import com.dreamsoftware.documentsearchengine.web.core.ErrorResponseDTO;
import com.dreamsoftware.documentsearchengine.web.core.FieldErrorDTO;
import com.dreamsoftware.documentsearchengine.web.core.SupportController;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolationException;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author ssanchez
 */
@ControllerAdvice
@Order(Ordered.HIGHEST_PRECEDENCE)
public class FilesMetadataErrorController extends SupportController {

    /**
     * Handler for Constraint Violation Exception
     *
     * @param ex
     * @return
     */
    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseBody
    public ResponseEntity<APIResponse<ErrorResponseDTO>> handleConstraintViolationException(ConstraintViolationException ex) {

        List<FieldErrorDTO> fieldErrors = ex.getConstraintViolations().stream()
                .map(constraintViolation -> FieldErrorDTO.builder()
                .field(constraintViolation.getPropertyPath().toString())
                .message(constraintViolation.getMessage())
                .build())
                .collect(Collectors.toList());

        return responseHelper.createAndSendErrorResponse(
                FilesMetadataResponseCodeEnum.VALIDATION_ERROR,
                HttpStatus.BAD_REQUEST, fieldErrors);

    }

    /**
     *
     * @param ex
     * @param request
     * @return
     */
    @ExceptionHandler(FileProcessedNotFoundException.class)
    @ResponseBody
    protected ResponseEntity<APIResponse<ErrorResponseDTO>> handleFileProcessedNotFoundException(FileProcessedNotFoundException ex, HttpServletRequest request) {
        return responseHelper.<String>createAndSendErrorResponse(FilesMetadataResponseCodeEnum.PROCESSED_FILE_NOT_FOUND,
                HttpStatus.NOT_FOUND, "File Proccessed Not Found");
    }

    /**
     *
     * @param ex
     * @param request
     * @return
     */
    @ExceptionHandler(NoFilesProcessedFoundException.class)
    @ResponseBody
    protected ResponseEntity<APIResponse<ErrorResponseDTO>> handleNoFilesProcessedFoundException(NoFilesProcessedFoundException ex, HttpServletRequest request) {
        return responseHelper.<String>createAndSendErrorResponse(FilesMetadataResponseCodeEnum.NO_FILES_PROCESSED_FOUND,
                HttpStatus.NOT_FOUND, "No Files Processed.");
    }

}
