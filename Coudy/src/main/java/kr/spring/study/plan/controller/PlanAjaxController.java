package kr.spring.study.plan.controller;


import kr.spring.study.plan.artgumentResolver.Login;
import kr.spring.study.plan.service.PlanService;
import kr.spring.study.plan.testUtil.StudyTest;
import kr.spring.study.plan.vo.PlanVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/study/plan")
@RequiredArgsConstructor
public class PlanAjaxController {
    private final PlanService planService;
    private final MessageSource messageSource;

    @PostMapping("/createPlan")
    public Object createPlan(@Login Integer mem_num, @Validated @ModelAttribute CreatePlanForm form, BindingResult result,Locale locale) throws ParseException {
        log.info("Call PlanAjaxController.createPlan --- Variable = form = {}", form);
        log.info("Call PlanAjaxController.createPlan --- Variable = result = {}", result.getAllErrors());

        if (!result.hasErrors()) {
            if (isInvalidDate(form.getPlanStartDate(), form.getPlanEndDate())) {
                result.reject("laterThanStart");
                return getErrorMessages(result,locale);
            }
            int studyNum = StudyTest.getStudyNum();
            PlanVO planVO = new PlanVO(studyNum, form.getPlanContent(), form.getPlanStartDate(),
                    form.getPlanEndDate(), form.getPlanColor(), mem_num, form.isPlanIsShared());
            planService.createPlan(planVO);
        }

        return getErrorMessages(result,locale);
    }


    @PostMapping("/updatePlan")
    public Object updatePlan(@Login Integer mem_num, @Validated @ModelAttribute UpdatePlanForm form, BindingResult result,Locale locale) throws ParseException {
        log.info("Call PlanAjaxController.updatePlan --- Variable = form = {}", form);
        log.info("Call PlanAjaxController.updatePlan --- Variable = result.getAllErrors() = {}", result.getAllErrors());


        if (!result.hasErrors()) {
            if (isInvalidDate(form.getPlanStartDate(), form.getPlanEndDate())) {
                result.reject("laterThanStart");
                return getErrorMessages(result, locale);
            }

            int studyNum = StudyTest.getStudyNum();
            PlanVO planVO = new PlanVO(form.getPlanNum(), studyNum, form.getPlanContent(), form.getPlanStartDate(),
                    form.getPlanEndDate(), form.getPlanColor(), mem_num, form.isPlanIsCompleted(), form.isPlanIsShared());
            planService.updatePlan(planVO);
        }
        return getErrorMessages(result, locale);
    }

    @PostMapping("/deletePlan")
    public void deletePlan(@Login Integer mem_num, @RequestParam Integer planNum) {
        log.info("Call PlanAjaxController.deletePlan --- Variable = mem_num = {}", mem_num);
        int studyNum = StudyTest.getStudyNum();
        planService.deletePlan(planNum);

    }

    @GetMapping("/findPlans")
    public List<PlanVO> findPlans(@Login Integer mem_num,
                                  @RequestParam Map<String, String> map) {
        int studyNum = StudyTest.getStudyNum();
        List<PlanVO> plans = planService.findPlans(studyNum, map.get("thisYearMonth"));
        log.info("Call PlanAjaxController.findPlans --- Variable = plans = {}", plans);
        return plans;
    }


    private List<JsonResult> getErrorMessages(BindingResult result,Locale locale) {
        List<JsonResult> jsonResults = new ArrayList<>();
        for (ObjectError error: result.getAllErrors()) {
            String field = error instanceof FieldError ? ((FieldError) error).getField() : "globalError";
            jsonResults.add(new JsonResult(error.getObjectName(), messageSource.getMessage(error, locale), field, error.getCode()));
        }
        return jsonResults;
    }

    private boolean isInvalidDate(String startDateStr,String endDateStr) throws ParseException  {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = format.parse(startDateStr);
            Date endDate = format.parse(endDateStr);
            log.info("Call PlanAjaxController.isInvalidDate --- Variable = startDate = {}", startDate);
            log.info("Call PlanAjaxController.isInvalidDate --- Variable = endDate = {}", endDate);
            return endDate.before(startDate);
    }
}
