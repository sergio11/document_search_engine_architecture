package com.dreamsoftware.documentsearchengine.web.controller;

import com.dreamsoftware.documentsearchengine.service.IProcessedFileNotificationService;
import com.dreamsoftware.documentsearchengine.web.controller.error.exception.NoNotificationsFoundException;
import com.dreamsoftware.documentsearchengine.web.core.APIResponse;
import com.dreamsoftware.documentsearchengine.web.core.ErrorResponseDTO;
import com.dreamsoftware.documentsearchengine.web.core.SupportController;
import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileNotificationDTO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Files Metadata Controller
 *
 * @author ssanchez
 */
@RestController
@Validated
@RequestMapping("/api/v1/notifications/")
@Tag(name = "files_notifications", description = "/api/v1/notifications/ (Code Response interval -> 4XX)")
@RequiredArgsConstructor
public class FilesNotificationsController extends SupportController {

    private final IProcessedFileNotificationService processedFileNotificationService;

    /**
     *
     * @param page
     * @param size
     * @return
     * @throws Throwable
     */
    @Operation(summary = "GET_NOTIFICATIONS - GetProcessed files notifications", description = " Get Notifications", tags = {"files_notifications"})
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Notifications List",
                content = @Content(
                        schema = @Schema(implementation = Page.class))),
        @ApiResponse(responseCode = "404", description = "No Notifications found",
                content = @Content(
                        schema = @Schema(implementation = ErrorResponseDTO.class)))
    })
    @PreAuthorize("hasAuthority('SCOPE_FILES_NOTIFICATIONS')")
    @RequestMapping(value = "/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<APIResponse<Page<ProcessedFileNotificationDTO>>> getNotifications(
            @RequestParam(name = "page", required = false, defaultValue = "0") final Integer page,
            @RequestParam(name = "size", required = false, defaultValue = "20") final Integer size) throws Throwable {

        final Page<ProcessedFileNotificationDTO> filesProcessedPage = processedFileNotificationService.findPaginated(page, size);

        if (!filesProcessedPage.hasContent()) {
            throw new NoNotificationsFoundException();
        }

        return responseHelper.createAndSendResponse(
                FilesNotificationsResponseCodeEnum.GET_NOTIFICATIONS,
                HttpStatus.OK, filesProcessedPage);

    }

}
