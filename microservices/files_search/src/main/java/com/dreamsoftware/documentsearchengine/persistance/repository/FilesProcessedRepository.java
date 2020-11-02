package com.dreamsoftware.documentsearchengine.persistance.repository;

import com.dreamsoftware.documentsearchengine.persistance.entity.ProcessedFileEntity;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ssanchez
 */
@Repository
public interface FilesProcessedRepository extends ElasticsearchRepository<ProcessedFileEntity, String> {
}
