package kr.spring.study.plan.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Slf4j
@RestControllerAdvice(basePackages = {"kr.spring.study.plan.controller", "kr.spring.study.todo.controller"})
@RequiredArgsConstructor
public class JsonRestControllerAdvice {
    private final String GLOBAL_ERROR = "globalError";

    private final MessageSource ms;

//    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(BindException.class)
    public List<ErrorResult> BindingExceptionHandler(Errors errors, Locale locale) {
        log.info("Call JsonRestControllerAdvice.BindingExceptionHandler");
        return getErrorResults(errors, locale);
    }
//    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(HttpMessageNotReadableException.class)
    public List<ErrorResult> HttpMessageExceptionHandler(Locale locale) {
        log.info("Call JsonRestControllerAdvice.HttpMessageExceptionHandler");
        List<ErrorResult> errorResults = new ArrayList<>();
        errorResults.add(new ErrorResult(null, ms.getMessage("TypeMismatch",null, locale), GLOBAL_ERROR));
        return errorResults;
    }

    private List<ErrorResult> getErrorResults(Errors errors, Locale locale) {
        List<ErrorResult> errorResults = new ArrayList<>();
        for (ObjectError error : errors.getAllErrors()) {
            String field = error instanceof FieldError ? ((FieldError) error).getField() : GLOBAL_ERROR;
            errorResults.add(new ErrorResult(error.getObjectName(), ms.getMessage(error, locale), field));
        }
        return errorResults;
    }
}
