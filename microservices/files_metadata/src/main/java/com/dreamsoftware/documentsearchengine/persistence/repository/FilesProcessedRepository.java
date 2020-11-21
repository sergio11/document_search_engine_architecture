package com.dreamsoftware.documentsearchengine.persistence.repository;

import com.dreamsoftware.documentsearchengine.persistence.entity.ProcessedFileEntity;
import java.util.Optional;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ssanchez
 */
@Repository
public interface FilesProcessedRepository extends MongoRepository<ProcessedFileEntity, ObjectId> {

    /**
     * Find One By Name
     *
     * @param name
     * @return
     */
    Optional<ProcessedFileEntity> findOneByName(final String name);

}
