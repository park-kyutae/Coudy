package kr.spring.study.plan.controller;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class StudyUserForm {
    private final int memNum;
    private final String  studyUserName;
}
