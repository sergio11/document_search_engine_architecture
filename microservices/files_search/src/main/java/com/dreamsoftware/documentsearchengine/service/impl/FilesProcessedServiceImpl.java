package com.dreamsoftware.documentsearchengine.service.impl;

import com.dreamsoftware.documentsearchengine.mapper.ProcessedFileMapper;
import com.dreamsoftware.documentsearchengine.persistance.repository.FilesProcessedRepository;
import com.dreamsoftware.documentsearchengine.service.IFilesProcessedService;
import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileDTO;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
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
    public Page<ProcessedFileDTO> findPaginated(Integer page, Integer size) {
        Assert.notNull(page, "Page can not be null");
        Assert.notNull(size, "Size can not be null");
        return findPaginated(PageRequest.of(page, size));
    }

    @Override
    public Page<ProcessedFileDTO> findPaginated(Pageable pageable) {
        Assert.notNull(pageable, "Pageable can not be null");

        return filesProcessedRepository.findAll(pageable)
                .map(processedFileMapper::entityToDTO);
    }

    @Override
    public Optional<ProcessedFileDTO> findById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
