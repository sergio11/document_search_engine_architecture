package com.dreamsoftware.documentsearchengine.web.controller.error.exception;

/**
 *
 * @author ssanchez
 */
public class DeleteFileException extends RuntimeException {

    public DeleteFileException(Exception ex) {
        super(ex);
    }
}
