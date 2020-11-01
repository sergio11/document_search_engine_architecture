package com.dreamsoftware.documentsearchengine.service.impl;

import com.dreamsoftware.documentsearchengine.mapper.ProcessedFileMapper;
import com.dreamsoftware.documentsearchengine.persistence.repository.FilesProcessedRepository;
import com.dreamsoftware.documentsearchengine.service.IFilesProcessedService;
import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileDTO;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

/**
 *
 * @author ssanchez
 */
@Service("filesProcessedService")
@RequiredArgsConstructor
public class FilesProcessedServiceImpl implements IFilesProcessedService {

    private final ProcessedFileMapper processedFileMapper;
    private final FilesProcessedRepository filesProcessedRepository;

    /**
     *
     * @param page
     * @param size
     * @return
     */
    @Override
    public Page<ProcessedFileDTO> findPaginated(final Integer page, final Integer size) {
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
    public Page<ProcessedFileDTO> findPaginated(final Pageable pageable) {
        Assert.notNull(pageable, "Pageable can not be null");

        return filesProcessedRepository.findAll(pageable)
                .map(processedFileMapper::entityToDTO);
    }

    /**
     *
     * @param id
     * @return
     */
    @Override
    public Optional<ProcessedFileDTO> findById(ObjectId id) {
        Assert.notNull(id, "File id can not be null");

        return filesProcessedRepository.findById(id)
                .map(processedFileMapper::entityToDTO);
    }

}
