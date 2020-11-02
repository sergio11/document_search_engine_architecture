package com.dreamsoftware.documentsearchengine.web.controller;

import com.dreamsoftware.documentsearchengine.web.core.IResponseCodeTypes;

/**
 *
 * @author ssanchez
 */
public enum FilesSearchResponseCodeEnum implements IResponseCodeTypes {

    GET_FILES_PROCESSED(200L),
    GET_PROCESSED_FILE_DETAIL(201L),
    NO_FILES_PROCESSED_FOUND(202L),
    PROCESSED_FILE_NOT_FOUND(203L);

    private final Long code;

    public static final String CATEGORY_NAME = "FILES_SEARCH_SERVICE";

    private FilesSearchResponseCodeEnum(Long code) {
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
}
