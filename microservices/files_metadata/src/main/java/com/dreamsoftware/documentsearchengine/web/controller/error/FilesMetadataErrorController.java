package com.dreamsoftware.documentsearchengine.web.controller.error;

import com.dreamsoftware.documentsearchengine.web.controller.FilesMetadataResponseCodeEnum;
import com.dreamsoftware.documentsearchengine.web.controller.error.exception.FileProcessedNotFoundException;
import com.dreamsoftware.documentsearchengine.web.controller.error.exception.NoFilesProcessedFoundException;
import com.dreamsoftware.documentserachengine.web.core.APIResponse;
import com.dreamsoftware.documentserachengine.web.core.ErrorResponseDTO;
import com.dreamsoftware.documentserachengine.web.core.SupportController;
import javax.servlet.http.HttpServletRequest;
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
