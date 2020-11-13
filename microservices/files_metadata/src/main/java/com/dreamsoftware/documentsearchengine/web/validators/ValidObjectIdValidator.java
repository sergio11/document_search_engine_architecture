package com.dreamsoftware.documentsearchengine.web.validators;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.bson.types.ObjectId;

/**
 * Valid Object Id Validator
 *
 * @author ssanchez
 */
public class ValidObjectIdValidator implements ConstraintValidator<ValidObjectId, String> {

    @Override
    public void initialize(ValidObjectId constraintAnnotation) {
    }

    @Override
    public boolean isValid(String id, ConstraintValidatorContext cvc) {
        return ObjectId.isValid(id);
    }

}
