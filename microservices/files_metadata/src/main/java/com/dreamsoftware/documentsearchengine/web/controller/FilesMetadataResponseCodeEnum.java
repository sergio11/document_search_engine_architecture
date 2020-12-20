package com.dreamsoftware.documentsearchengine.web.controller;

import com.dreamsoftware.documentsearchengine.web.core.IResponseCodeTypes;

/**
 *
 * @author ssanchez
 */
public enum FilesMetadataResponseCodeEnum implements IResponseCodeTypes {

    GET_FILES_PROCESSED(100L),
    GET_PROCESSED_FILE_DETAIL(101L),
    NO_FILES_PROCESSED_FOUND(102L),
    PROCESSED_FILE_NOT_FOUND(103L),
    VALIDATION_ERROR(104L);

    private final Long code;

    public static final String CATEGORY_NAME = "FILES_METADATA";

    private FilesMetadataResponseCodeEnum(Long code) {
        this.code = code;
    }

    @Override
    public Long getResponseCode() {
        return code;
    }

    @Override
    public String getCategoryName() {
        return CATEGORY_NAME;
    }

    @Override
    public String getCodeName() {
        return name();
    }
}
