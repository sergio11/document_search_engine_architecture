package com.dreamsoftware.documentsearchengine.service;

import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 *
 * @author ssanchez
 */
public interface IFilesProcessedService {

    /**
     *
     * @param searchText
     * @param page
     * @param size
     * @return
     */
    Page<ProcessedFileDTO> search(final String searchText, final Integer page, final Integer size);

    /**
     *
     * @param searchText
     * @param pageable
     * @return
     */
    Page<ProcessedFileDTO> search(final String searchText, final Pageable pageable);

}
