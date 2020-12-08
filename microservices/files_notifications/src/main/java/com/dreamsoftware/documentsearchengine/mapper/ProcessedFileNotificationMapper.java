package com.dreamsoftware.documentsearchengine.mapper;

import com.dreamsoftware.documentsearchengine.persistence.entity.ProcessedFileNotificationEntity;
import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileNotificationDTO;
import java.util.List;
import org.mapstruct.IterableMapping;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.Named;

/**
 *
 * @author ssanchez
 */
@Mapper(unmappedTargetPolicy = org.mapstruct.ReportingPolicy.IGNORE)
public abstract class ProcessedFileNotificationMapper {

    /**
     *
     * @param processedFileNotificationEntity
     * @return
     */
    @Mappings({})
    @Named("entityToDTO")
    public abstract ProcessedFileNotificationDTO entityToDTO(ProcessedFileNotificationEntity processedFileNotificationEntity);

    /**
     *
     * @param processedFileNotificationDTO
     * @return
     */
    @Mappings({})
    @Named("DTOtoEntity")
    public abstract ProcessedFileNotificationEntity dtoToEntity(ProcessedFileNotificationDTO processedFileNotificationDTO);

    /**
     *
     * @param processedFileNotificationEntityList
     * @return
     */
    @IterableMapping(qualifiedByName = "entityToDTO")
    public abstract List<ProcessedFileNotificationDTO> entityToDTO(List<ProcessedFileNotificationEntity> processedFileNotificationEntityList);
}
