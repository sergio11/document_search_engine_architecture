package com.dreamsoftware.documentsearchengine.service;

import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileNotificationDTO;
import java.util.Optional;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 *
 * @author ssanchez
 */
public interface IProcessedFileNotificationService {

    /**
     *
     * @param page
     * @param size
     * @return
     */
    Page<ProcessedFileNotificationDTO> findPaginated(final Integer page, final Integer size);

    /**
     *
     * @param pageable
     * @return
     */
    Page<ProcessedFileNotificationDTO> findPaginated(final Pageable pageable);

    /**
     *
     * @param id
     * @return
     */
    Optional<ProcessedFileNotificationDTO> findById(final ObjectId id);

    /**
     *
     * @param processedFileNotification
     */
    void save(final ProcessedFileNotificationDTO processedFileNotification);

}
