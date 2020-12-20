package com.dreamsoftware.documentsearchengine.web.controller;

import com.dreamsoftware.documentsearchengine.web.core.IResponseCodeTypes;

/**
 *
 * @author ssanchez
 */
public enum FilesNotificationsResponseCodeEnum implements IResponseCodeTypes {

    GET_NOTIFICATIONS(400L),
    NO_NOTIFICATIONS_FOUND(401L);

    private final Long code;

    public static final String CATEGORY_NAME = "FILES_NOTIFICATIONS";

    private FilesNotificationsResponseCodeEnum(Long code) {
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
