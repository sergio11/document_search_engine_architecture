package com.dreamsoftware.documentsearchengine.persistence.repository;

import com.dreamsoftware.documentsearchengine.persistence.entity.ProcessedFileNotificationEntity;
import java.util.Optional;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ssanchez
 */
@Repository
public interface ProcessedFileNotificationRepository extends MongoRepository<ProcessedFileNotificationEntity, ObjectId> {

    /**
     * Find One By Name
     *
     * @param name
     * @return
     */
    Optional<ProcessedFileNotificationEntity> findOneByName(final String name);

}
