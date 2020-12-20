package com.dreamsoftware.documentsearchengine.web.controller;

import com.dreamsoftware.documentsearchengine.web.core.IResponseCodeTypes;

/**
 *
 * @author ssanchez
 */
public enum FilesSearchResponseCodeEnum implements IResponseCodeTypes {

    SEARCH_RESULTS(200L),
    NO_FILES_PROCESSED_FOUND(201L);

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

    @Override
    public String getCodeName() {
        return name();
    }
}
