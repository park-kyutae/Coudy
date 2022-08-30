package kr.spring.study.plan.controller;

import kr.spring.interceptor.LoginConst;
import kr.spring.study.plan.artgumentResolver.Login;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

@Component
@Controller
@RequestMapping("study/plan")
public class PlanController {
    //TODO 팀원 기능 완성 시 제거
    private boolean isStudyManager(Integer mem_num) {
        if (mem_num == null) {
            return false;
        }
        return true;

    }

    @GetMapping
    public String planMain(@Login Integer mem_num, Model model) {




        return "study/plan/plan";
    }
}
