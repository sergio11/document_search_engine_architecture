package com.dreamsoftware.documentsearchengine.web.controller;

import com.dreamsoftware.documentsearchengine.service.IFilesManagementService;
import com.dreamsoftware.documentsearchengine.web.controller.error.exception.DeleteFileException;
import com.dreamsoftware.documentsearchengine.web.controller.error.exception.SaveFileException;
import com.dreamsoftware.documentsearchengine.web.core.APIResponse;
import com.dreamsoftware.documentsearchengine.web.core.SupportController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import javax.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * Files Management Controller
 *
 * @author ssanchez
 */
@RestController
@Validated
@RequestMapping("/api/v1/management/")
@Tag(name = "files_management", description = "/api/v1/management/ (Code Response interval -> 3XX)")
@RequiredArgsConstructor
public class FilesManagementController extends SupportController {

    /**
     * Files Management Service
     */
    private final IFilesManagementService filesManagementService;

    /**
     * Save File
     *
     * @param uploadFile
     * @return
     * @throws Throwable
     */
    @PreAuthorize("hasAuthority('SCOPE_FILES_MANAGEMENT')")
    @Operation(summary = "SAVE_FILE", description = "Save a new File")
    @RequestMapping(value = "/", method = RequestMethod.POST,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<APIResponse<String>> saveFile(
            @Valid @RequestPart(name = "file", required = true) MultipartFile uploadFile) throws Throwable {

        try {

            // Save File
            filesManagementService.save(uploadFile);

            // Create and Send Response
            return responseHelper.createAndSendResponse(
                    FilesManagementResponseCodeEnum.FILE_SAVED_SUCCESSFULLY, HttpStatus.OK,
                    "File Saved Successfully");

        } catch (final Exception ex) {
            throw new SaveFileException(ex);
        }
    }

    @PreAuthorize("hasAuthority('SCOPE_FILES_MANAGEMENT')")
    @Operation(summary = "DELETE_FILE", description = "Delete File")
    @RequestMapping(value = "/{name}", method = RequestMethod.DELETE)
    public ResponseEntity<APIResponse<String>> deleteByName(
            @Parameter(name = "name", description = "Processed File Name", required = true)
            @PathVariable final String name) {

        try {

            filesManagementService.delete(name);

            return responseHelper.createAndSendResponse(
                    FilesManagementResponseCodeEnum.FILE_DELETED_SUCCESSFULLY, HttpStatus.OK,
                    "File delete successfully");

        } catch (final Exception ex) {
            throw new DeleteFileException(ex);
        }

    }

}
