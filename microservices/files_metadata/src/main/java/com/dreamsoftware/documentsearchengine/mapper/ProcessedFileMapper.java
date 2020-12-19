package com.dreamsoftware.documentsearchengine.mapper;

import com.dreamsoftware.documentsearchengine.persistence.entity.ProcessedFileEntity;
import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileDTO;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        @Mapping(expression = "java(processedFileEntity.getId().toString())", target = "id"),
        @Mapping(expression = "java(createWebhdfsUrlForFilename(processedFileEntity))", target = "url")
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

    /**
     *
     * @param processedFileEntity
     * @return
     */
    protected String createWebhdfsUrlForFilename(final ProcessedFileEntity processedFileEntity) {
        try {
            return String.format("http://namenode:9870/webhdfs/v1/uploads/%s?op=OPEN", URLEncoder.encode(processedFileEntity.getName().replace("_", "."), "UTF-8").replace("+", "%20"));
        } catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex);
        }
    }
}
