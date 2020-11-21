package com.dreamsoftware.documentsearchengine.config.props;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 *
 * @author ssanchez
 */
@Component
@Data
public class UploadProperties {

    @Value("${uploads.directory}")
    private String uploadsDirectory;

}
