package com.dreamsoftware.documentsearchengine.web.controller.error;

import com.dreamsoftware.documentsearchengine.web.controller.FilesNotificationsResponseCodeEnum;
import com.dreamsoftware.documentsearchengine.web.controller.error.exception.NoNotificationsFoundException;
import com.dreamsoftware.documentsearchengine.web.core.APIResponse;
import com.dreamsoftware.documentsearchengine.web.core.ErrorResponseDTO;
import com.dreamsoftware.documentsearchengine.web.core.SupportController;
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
public class FilesNotificationsErrorController extends SupportController {

    /**
     *
     * @param ex
     * @param request
     * @return
     */
    @ExceptionHandler(NoNotificationsFoundException.class)
    @ResponseBody
    protected ResponseEntity<APIResponse<ErrorResponseDTO>> handleNoFilesProcessedFoundException(NoNotificationsFoundException ex, HttpServletRequest request) {
        return responseHelper.<String>createAndSendErrorResponse(FilesNotificationsResponseCodeEnum.NO_NOTIFICATIONS_FOUND,
                HttpStatus.NOT_FOUND, "No Notifications found.");
    }

}
