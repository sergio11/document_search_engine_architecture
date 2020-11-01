package com.dreamsoftware.documentsearchengine.persistence.repository;

import com.dreamsoftware.documentsearchengine.persistence.entity.ProcessedFileEntity;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ssanchez
 */
@Repository
public interface FilesProcessedRepository extends MongoRepository<ProcessedFileEntity, ObjectId> {
}
