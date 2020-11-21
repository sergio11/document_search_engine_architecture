package com.dreamsoftware.documentsearchengine.web.controller.error;

import com.dreamsoftware.documentsearchengine.web.controller.FilesManagementResponseCodeEnum;
import com.dreamsoftware.documentsearchengine.web.controller.error.exception.SaveFileException;
import com.dreamsoftware.documentsearchengine.web.core.APIResponse;
import com.dreamsoftware.documentsearchengine.web.core.ErrorResponseDTO;
import com.dreamsoftware.documentsearchengine.web.core.FieldErrorDTO;
import com.dreamsoftware.documentsearchengine.web.core.SupportController;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class FilesManagementErrorController extends SupportController {

    private static final Logger logger = LoggerFactory.getLogger(FilesManagementErrorController.class);

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
                FilesManagementResponseCodeEnum.VALIDATION_ERROR,
                HttpStatus.BAD_REQUEST, fieldErrors);

    }

    /**
     *
     * @param ex
     * @param request
     * @return
     */
    @ExceptionHandler(SaveFileException.class)
    @ResponseBody
    protected ResponseEntity<APIResponse<ErrorResponseDTO>> handleSaveFileException(SaveFileException ex, HttpServletRequest request) {
        ex.printStackTrace();
        logger.debug("SaveFileException -> " + ex.getMessage());

        return responseHelper.<String>createAndSendErrorResponse(FilesManagementResponseCodeEnum.SAVE_FILE_ERROR,
                HttpStatus.INTERNAL_SERVER_ERROR, "Save File Error");
    }
}
