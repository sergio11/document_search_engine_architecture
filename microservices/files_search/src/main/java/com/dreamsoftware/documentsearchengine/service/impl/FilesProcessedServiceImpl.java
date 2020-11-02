package com.dreamsoftware.documentsearchengine.service.impl;

import com.dreamsoftware.documentsearchengine.mapper.ProcessedFileMapper;
import com.dreamsoftware.documentsearchengine.persistance.repository.FilesProcessedRepository;
import com.dreamsoftware.documentsearchengine.service.IFilesProcessedService;
import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileDTO;
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
     * @param searchText
     * @param page
     * @param size
     * @return
     */
    @Override
    public Page<ProcessedFileDTO> search(final String searchText, final Integer page, final Integer size) {
        Assert.notNull(page, "Page can not be null");
        Assert.notNull(size, "Size can not be null");
        return search(searchText, PageRequest.of(page, size));
    }

    /**
     *
     * @param searchText
     * @param pageable
     * @return
     */
    @Override
    public Page<ProcessedFileDTO> search(final String searchText, final Pageable pageable) {
        Assert.notNull(pageable, "Pageable can not be null");
        return filesProcessedRepository.search(searchText, pageable)
                .map(processedFileMapper::entityToDTO);
    }

}
