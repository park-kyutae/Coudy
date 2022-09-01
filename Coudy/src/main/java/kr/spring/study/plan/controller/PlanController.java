package kr.spring.study.plan.controller;

import kr.spring.study.plan.artgumentResolver.Login;
import kr.spring.study.plan.testUtil.MemberTest;
import kr.spring.study.plan.testUtil.StudyTest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.awt.image.ImageProducer;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
@Controller
@RequestMapping("study/plan")
@Slf4j
public class PlanController {


    @GetMapping
    public String planMain(@Login Integer memNum,Model model) {

        List<StudyUserForm> studyUserForms = StudyTest.findStudyUsers().stream()
                .map(x -> new StudyUserForm(x, MemberTest.getMemberName(x)))
                .collect(Collectors.toList());

        model.addAttribute("studyUserForms", studyUserForms);

        return "study/plan/plan";
    }


}
