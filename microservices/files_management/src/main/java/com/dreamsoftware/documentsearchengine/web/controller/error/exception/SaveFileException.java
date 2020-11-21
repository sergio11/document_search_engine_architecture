package com.dreamsoftware.documentsearchengine.web.controller.error.exception;

/**
 *
 * @author ssanchez
 */
public class SaveFileException extends RuntimeException {

    public SaveFileException(Exception ex) {
        super(ex);
    }
}
