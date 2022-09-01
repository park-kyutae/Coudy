package kr.spring.study.plan.controller;


import kr.spring.study.plan.artgumentResolver.Login;
import kr.spring.study.plan.service.PlanService;
import kr.spring.study.plan.testUtil.MemberTest;
import kr.spring.study.plan.testUtil.StudyTest;
import kr.spring.study.plan.vo.PlanVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/study/plan")
@RequiredArgsConstructor
public class PlanAjaxController {
    private final PlanService planService;

    @PostMapping("/createPlan")
    public void createPlan(@Login Integer mem_num, @ModelAttribute CreatePlanForm form, BindingResult result) {
        int studyNum = StudyTest.getStudyNum();
        log.info("form = {}", form);
        log.info("studyNum = {}", studyNum);
        PlanVO planVO = new PlanVO(studyNum, form.getPlanContent(), form.getPlanStartDate(),
                form.getPlanEndDate(), form.getPlanColor(), mem_num, form.isPlanIsShared());
        planService.createPlan(planVO);

        log.info("planVO = {}", planVO);
    }

    @GetMapping("/findPlans")
    public List<FindPlanForm> findPlans(@Login Integer mem_num,
                                        @RequestParam Map<String, String> map) {
        int studyNum = StudyTest.getStudyNum();
        log.debug("Call PlanAjaxController.findPlans --- Variable = map = {}", map);
        List<PlanVO> plans = planService.findPlans(studyNum, map.get("thisYearMonth"));
        List<FindPlanForm> findPlanForms = new ArrayList<>();
        plans.stream().forEach(planVO -> {
            findPlanForms.add(new FindPlanForm(planVO.getPlanNum(), planVO.getPlanContent(),
                    planVO.getPlanStartDate(), planVO.getPlanEndDate(), planVO.getPlanColor(),
                    planVO.getMemNum(),planVO.isPlanIsCompleted(), planVO.isPlanIsShared()));
        });
        log.info("Call PlanAjaxController.findPlans --- Variable = plans = {}", plans);
        return findPlanForms;
    }
}
