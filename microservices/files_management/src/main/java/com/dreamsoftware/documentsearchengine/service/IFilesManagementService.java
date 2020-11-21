package com.dreamsoftware.documentsearchengine.service;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ssanchez
 */
public interface IFilesManagementService {

    /**
     * Save File
     *
     * @param uploadFile
     */
    void save(final MultipartFile uploadFile);

}
