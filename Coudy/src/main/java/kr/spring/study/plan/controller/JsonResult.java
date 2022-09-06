package kr.spring.study.plan.controller;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class JsonResult {
    private String objectName;
    private String message;
    private String field;
    private String code;
}
