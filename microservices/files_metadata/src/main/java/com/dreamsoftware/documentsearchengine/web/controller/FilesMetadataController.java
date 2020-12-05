package com.dreamsoftware.documentsearchengine.web.controller;

import com.dreamsoftware.documentsearchengine.service.IFilesProcessedService;
import com.dreamsoftware.documentsearchengine.web.controller.error.exception.FileProcessedNotFoundException;
import com.dreamsoftware.documentsearchengine.web.controller.error.exception.NoFilesProcessedFoundException;
import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileDTO;
import com.dreamsoftware.documentsearchengine.web.core.APIResponse;
import com.dreamsoftware.documentsearchengine.web.core.ErrorResponseDTO;
import com.dreamsoftware.documentsearchengine.web.core.SupportController;
import com.dreamsoftware.documentsearchengine.web.validators.ValidObjectId;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import javax.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
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
@RequestMapping("/api/v1/metadata/")
@Tag(name = "files_metadata", description = "/api/v1/metadata/ (Code Response interval -> 1XX)")
@RequiredArgsConstructor
public class FilesMetadataController extends SupportController {

    private final IFilesProcessedService filesProcessedService;

    /**
     *
     * @param page
     * @param size
     * @return
     * @throws Throwable
     */
    @Operation(summary = "GET_FILES_PROCESSED - Get Files Processed", description = " Get Files Processed", tags = {"files_metadata"})
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Files proccessed List",
                content = @Content(
                        schema = @Schema(implementation = Page.class))),
        @ApiResponse(responseCode = "404", description = "No Files found",
                content = @Content(
                        schema = @Schema(implementation = ErrorResponseDTO.class)))
    })
    @PreAuthorize("hasAuthority('SCOPE_FILES_METADATA')")
    @RequestMapping(value = "/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<APIResponse<Page<ProcessedFileDTO>>> getFilesProcessed(
            @RequestParam(name = "page", required = false, defaultValue = "0") final Integer page,
            @RequestParam(name = "size", required = false, defaultValue = "20") final Integer size) throws Throwable {

        final Page<ProcessedFileDTO> filesProcessedPage = filesProcessedService.findPaginated(page, size);

        if (!filesProcessedPage.hasContent()) {
            throw new NoFilesProcessedFoundException();
        }

        return responseHelper.createAndSendResponse(
                FilesMetadataResponseCodeEnum.GET_FILES_PROCESSED,
                HttpStatus.OK, filesProcessedPage);

    }

    /**
     *
     * @param id
     * @return
     * @throws Throwable
     */
    @Operation(summary = "GET_PROCESSED_FILE_DETAIL - Get Processed File Detail", description = "Get Processed File Detail", tags = {"files_metadata"})
    @PreAuthorize("hasAuthority('SCOPE_FILES_METADATA')")
    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<APIResponse<ProcessedFileDTO>> getProcessedFileById(
            @Parameter(name = "id", description = "Processed File Id", required = true)
            @PathVariable @Valid @ValidObjectId(message = "Invalid Id Format") final String id) throws Throwable {

        // Find file by id
        final ProcessedFileDTO processedFile = filesProcessedService.findById(new ObjectId(id))
                .orElseThrow(FileProcessedNotFoundException::new);

        return responseHelper.createAndSendResponse(
                FilesMetadataResponseCodeEnum.GET_PROCESSED_FILE_DETAIL,
                HttpStatus.OK, processedFile);
    }

    /**
     * Get Processed File By Name
     *
     * @param name
     * @return
     * @throws Throwable
     */
    @Operation(summary = "GET_PROCESSED_FILE_DETAIL_BY_NAME - Get Processed File Detail By Name", description = "Get Processed File Detail By Name", tags = {"files_metadata"})
    @PreAuthorize("hasAuthority('SCOPE_FILES_METADATA')")
    @RequestMapping(value = {"/name/{name}"}, method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<APIResponse<ProcessedFileDTO>> getProcessedFileByName(
            @Parameter(name = "name", description = "Processed File Name", required = true)
            @PathVariable final String name) throws Throwable {

        // Find file by name
        final ProcessedFileDTO processedFile = filesProcessedService.findByName(name)
                .orElseThrow(FileProcessedNotFoundException::new);

        return responseHelper.createAndSendResponse(
                FilesMetadataResponseCodeEnum.GET_PROCESSED_FILE_DETAIL,
                HttpStatus.OK, processedFile);
    }

}
