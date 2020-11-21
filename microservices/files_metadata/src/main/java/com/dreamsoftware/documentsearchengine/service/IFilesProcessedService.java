package com.dreamsoftware.documentsearchengine.service;

import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileDTO;
import java.util.Optional;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 *
 * @author ssanchez
 */
public interface IFilesProcessedService {

    /**
     *
     * @param page
     * @param size
     * @return
     */
    Page<ProcessedFileDTO> findPaginated(final Integer page, final Integer size);

    /**
     *
     * @param pageable
     * @return
     */
    Page<ProcessedFileDTO> findPaginated(final Pageable pageable);

    /**
     *
     * @param id
     * @return
     */
    Optional<ProcessedFileDTO> findById(final ObjectId id);

    /**
     *
     * @param name
     * @return
     */
    Optional<ProcessedFileDTO> findByName(final String name);

}
