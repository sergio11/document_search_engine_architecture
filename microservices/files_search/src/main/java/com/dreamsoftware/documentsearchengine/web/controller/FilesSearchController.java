package com.dreamsoftware.documentsearchengine.web.controller;

import com.dreamsoftware.documentsearchengine.service.IFilesProcessedService;
import com.dreamsoftware.documentsearchengine.web.controller.error.exception.NoFilesProcessedFoundException;
import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileDTO;
import com.dreamsoftware.documentsearchengine.web.core.APIResponse;
import com.dreamsoftware.documentsearchengine.web.core.ErrorResponseDTO;
import com.dreamsoftware.documentsearchengine.web.core.SupportController;
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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Validated
@RequestMapping("/api/v1/search/")
@Tag(name = "files_search", description = "/api/v1/search/ (Code Response interval -> 2XX)")
@RequiredArgsConstructor
public class FilesSearchController extends SupportController {

    /**
     * Files Processed Service
     */
    private final IFilesProcessedService filesProcessedService;

    /**
     *
     * @param page
     * @param size
     * @param searchText
     * @return
     * @throws Throwable
     */
    @Operation(summary = "SEARCH_FILES_PROCESSED - Search Files Processed", description = "Search Files Processed", tags = {"files_search"})
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Search results",
                content = @Content(
                        schema = @Schema(implementation = Page.class))),
        @ApiResponse(responseCode = "404", description = "No Files found",
                content = @Content(
                        schema = @Schema(implementation = ErrorResponseDTO.class)))
    })
    @RequestMapping(value = "/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<APIResponse<Page<ProcessedFileDTO>>> searchFilesProcessed(
            @RequestParam(name = "page", required = false, defaultValue = "0") final Integer page,
            @RequestParam(name = "size", required = false, defaultValue = "20") final Integer size,
            @RequestParam(name = "search", required = true) final String searchText) throws Throwable {

        final Page<ProcessedFileDTO> filesProcessedPage = filesProcessedService.search(searchText, page, size);

        if (!filesProcessedPage.hasContent()) {
            throw new NoFilesProcessedFoundException();
        }

        return responseHelper.createAndSendResponse(FilesSearchResponseCodeEnum.SEARCH_RESULTS,
                HttpStatus.OK, filesProcessedPage);

    }
}
