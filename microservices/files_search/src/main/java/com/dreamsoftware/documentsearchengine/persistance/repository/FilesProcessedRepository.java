package com.dreamsoftware.documentsearchengine.persistance.repository;

import com.dreamsoftware.documentsearchengine.persistance.entity.ProcessedFileEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.annotations.Query;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ssanchez
 */
@Repository
public interface FilesProcessedRepository extends ElasticsearchRepository<ProcessedFileEntity, String> {

    /**
     * @param term
     * @param pageable
     * @return
     */
    @Query("{\"match\": {\"document.document.content\": {\"query\": \"?0\"}}}")
    Page<ProcessedFileEntity> search(final String term, final Pageable pageable);
}
