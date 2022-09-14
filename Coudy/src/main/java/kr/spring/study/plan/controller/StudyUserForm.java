package kr.spring.study.plan.controller;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class StudyUserForm {
    private  int memNum;
    private  String  studyUserName;
}
