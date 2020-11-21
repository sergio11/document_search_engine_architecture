package com.dreamsoftware.documentsearchengine.client;

import com.dreamsoftware.documentsearchengine.web.core.APIResponse;
import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author ssanchez
 */
@FeignClient(name = "files-metadata-service")
public interface IFilesMetadataClient {

    /**
     * Get Processed File By Name
     *
     * @param name
     * @return
     */
    @GetMapping(path = "/api/v1/metadata/name/{name}", consumes = "application/json")
    APIResponse<ProcessedFileDTO> getProcessedFileByName(@PathVariable("name") String name);

}
