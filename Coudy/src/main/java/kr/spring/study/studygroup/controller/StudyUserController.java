package kr.spring.study.studygroup.controller;

import kr.spring.study.studygroup.service.StudyUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class StudyUserController {

    @Autowired
    private StudyUserService studyUserService;


}
