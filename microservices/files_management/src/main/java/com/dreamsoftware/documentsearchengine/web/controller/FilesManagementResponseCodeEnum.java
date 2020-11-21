package com.dreamsoftware.documentsearchengine.web.controller;

import com.dreamsoftware.documentsearchengine.web.core.IResponseCodeTypes;

/**
 *
 * @author ssanchez
 */
public enum FilesManagementResponseCodeEnum implements IResponseCodeTypes {

    FILE_SAVED_SUCCESSFULLY(300L),
    SAVE_FILE_ERROR(301L),
    VALIDATION_ERROR(302L);

    private final Long code;

    public static final String CATEGORY_NAME = "FILES_MANAGEMENT";

    private FilesManagementResponseCodeEnum(Long code) {
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
