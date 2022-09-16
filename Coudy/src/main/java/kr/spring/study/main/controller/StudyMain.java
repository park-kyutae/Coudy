package kr.spring.study.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudyMain {

    @GetMapping("/study/{studyNum}")
    public String studyMain(@PathVariable Integer studyNum, Model model) {



        return "study/main/main";
    }

}
