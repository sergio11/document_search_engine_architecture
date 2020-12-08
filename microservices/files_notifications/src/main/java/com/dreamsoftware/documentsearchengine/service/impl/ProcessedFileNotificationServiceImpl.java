package com.dreamsoftware.documentsearchengine.service.impl;

import com.dreamsoftware.documentsearchengine.mapper.ProcessedFileNotificationMapper;
import com.dreamsoftware.documentsearchengine.persistence.repository.ProcessedFileNotificationRepository;
import com.dreamsoftware.documentsearchengine.service.IProcessedFileNotificationService;
import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileNotificationDTO;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import com.dreamsoftware.documentsearchengine.persistence.entity.ProcessedFileNotificationEntity;

/**
 *
 * @author ssanchez
 */
@Service("processedFileService")
@RequiredArgsConstructor
public class ProcessedFileNotificationServiceImpl implements IProcessedFileNotificationService {

    private final ProcessedFileNotificationMapper processedFileNotificationMapper;
    private final ProcessedFileNotificationRepository processedFileNotificationRepository;

    /**
     *
     * @param page
     * @param size
     * @return
     */
    @Override
    public Page<ProcessedFileNotificationDTO> findPaginated(final Integer page, final Integer size) {
        Assert.notNull(page, "Page can not be null");
        Assert.notNull(size, "Size can not be null");
        return findPaginated(PageRequest.of(page, size));
    }

    /**
     *
     * @param pageable
     * @return
     */
    @Override
    public Page<ProcessedFileNotificationDTO> findPaginated(final Pageable pageable) {
        Assert.notNull(pageable, "Pageable can not be null");

        return processedFileNotificationRepository.findAll(pageable)
                .map(processedFileNotificationMapper::entityToDTO);
    }

    /**
     *
     * @param id
     * @return
     */
    @Override
    public Optional<ProcessedFileNotificationDTO> findById(ObjectId id) {
        Assert.notNull(id, "File id can not be null");

        return processedFileNotificationRepository.findById(id)
                .map(processedFileNotificationMapper::entityToDTO);
    }

    /**
     *
     * @param processedFileNotification
     */
    @Override
    public void save(final ProcessedFileNotificationDTO processedFileNotification) {
        Assert.notNull(processedFileNotification, "Processed File Notification can not be null");

        final ProcessedFileNotificationEntity processedFileNotificationToSave
                = processedFileNotificationMapper.dtoToEntity(processedFileNotification);

        processedFileNotificationRepository.save(processedFileNotificationToSave);

    }

}
