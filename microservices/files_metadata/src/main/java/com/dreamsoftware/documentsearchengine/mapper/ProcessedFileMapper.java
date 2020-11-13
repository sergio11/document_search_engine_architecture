package com.dreamsoftware.documentsearchengine.mapper;

import com.dreamsoftware.documentsearchengine.persistence.entity.ProcessedFileEntity;
import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileDTO;
import java.util.List;
import org.mapstruct.IterableMapping;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.Named;

/**
 *
 * @author ssanchez
 */
@Mapper(unmappedTargetPolicy = org.mapstruct.ReportingPolicy.IGNORE)
public abstract class ProcessedFileMapper {

    /**
     *
     * @param processedFileEntity
     * @return
     */
    @Mappings({
        @Mapping(expression = "java(processedFileEntity.getId().toString())", target = "id")
    })
    @Named("entityToDTO")
    public abstract ProcessedFileDTO entityToDTO(ProcessedFileEntity processedFileEntity);

    /**
     *
     * @param processedFileEntityList
     * @return
     */
    @IterableMapping(qualifiedByName = "entityToDTO")
    public abstract List<ProcessedFileDTO> entityToDTO(List<ProcessedFileEntity> processedFileEntityList);
}
