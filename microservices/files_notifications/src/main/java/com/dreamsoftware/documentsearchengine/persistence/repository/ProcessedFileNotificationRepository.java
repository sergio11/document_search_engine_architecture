package com.dreamsoftware.documentsearchengine.persistence.repository;

import com.dreamsoftware.documentsearchengine.persistence.entity.ProcessedFileNotificationEntity;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ssanchez
 */
@Repository
public interface ProcessedFileNotificationRepository extends MongoRepository<ProcessedFileNotificationEntity, ObjectId> {

}
