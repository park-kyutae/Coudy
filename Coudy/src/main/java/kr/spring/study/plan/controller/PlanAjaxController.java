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
@RequestMapping("/study/plan/{studyNum}")
@RequiredArgsConstructor
public class PlanAjaxController {
    private final PlanService planService;
    private final MessageSource messageSource;

    @PostMapping("/create")
    public Object createPlan(@Login Integer mem_num, @Validated @RequestBody CreatePlanForm form,
                             BindingResult result, Locale locale, @PathVariable Integer studyNum) throws ParseException {

        log.info("Call PlanAjaxController.createPlan --- Variable = form = {}", form);
        log.info("Call PlanAjaxController.createPlan --- Variable = result = {}", result.getAllErrors());
        //일정 삭제할 권한 있는지 검사 >> 인터셉터에서 처리?aop


        if (!result.hasErrors()) {
            if (isInvalidDate(form.getPlanStartDate(), form.getPlanEndDate())) {
                result.reject("laterThanStart");
                return getErrorMessages(result, locale);
            }
            PlanVO planVO = new PlanVO(studyNum, form.getPlanContent(), form.getPlanStartDate(),
                    form.getPlanEndDate(), form.getPlanColor(), mem_num, form.isPlanIsShared());
            planService.createPlan(planVO);
        }

        return getErrorMessages(result, locale);
    }


    @PostMapping("/update")
    public Object updatePlan(@Login Integer mem_num, @Validated @RequestBody UpdatePlanForm form,
                             BindingResult result, Locale locale, @PathVariable Integer studyNum) throws ParseException {
        log.info("Call PlanAjaxController.updatePlan --- Variable = form = {}", form);
        log.info("Call PlanAjaxController.updatePlan --- Variable = result.getAllErrors() = {}", result.getAllErrors());


        if (!result.hasErrors()) {
            if (isInvalidDate(form.getPlanStartDate(), form.getPlanEndDate())) {
                result.reject("laterThanStart");
                return getErrorMessages(result, locale);
            }

            PlanVO planVO = new PlanVO(form.getPlanNum(), studyNum, form.getPlanContent(), form.getPlanStartDate(),
                    form.getPlanEndDate(), form.getPlanColor(), mem_num, form.isPlanIsCompleted(), form.isPlanIsShared());
            planService.updatePlan(planVO);
        }
        return getErrorMessages(result, locale);
    }

    @PostMapping("/delete")
    public Map<String,String> deletePlan(@Login Integer mem_num, @RequestBody Map<String,Integer > map, @PathVariable Integer studyNum) {
        log.info("Call PlanAjaxController.deletePlan --- Variable = mem_num = {}", mem_num);
        planService.deletePlan(map.get("planNum"));

        //검증 여부따라 result값 바꾸기 + jsp에서 오류 처리
        return Map.of("result", "success");
    }

    @GetMapping("/findPlans")
    public List<FindPlanForm> findPlans(@Login Integer mem_num,
                                        @RequestParam String thisYearMonth, @PathVariable Integer studyNum) {
        //일정 추가/삭제/수정 보여지게 할건지 is_owned,is_team_manager 필드 추가해서 ajax에서 처리
//        List<PlanVO> plans = planService.findPlans(studyNum, map.get("thisYearMonth"));
        List<FindPlanForm> plans = planService.findPlans(studyNum, thisYearMonth).stream()
                .map(x -> new FindPlanForm(x.getPlanNum(), x.getStudyNum(), x.getPlanContent(), x.getPlanStartDate(),
                        x.getPlanEndDate(), x.getPlanColor(), x.getMemNum(), x.isPlanIsCompleted(), x.isPlanIsShared()))
                .collect(Collectors.toList());


        log.info("Call PlanAjaxController.findPlans --- Variable = plans = {}", plans);
        return plans;
    }

    private List<JsonResult> getErrorMessages(BindingResult result, Locale locale) {
        List<JsonResult> jsonResults = new ArrayList<>();
        for (ObjectError error : result.getAllErrors()) {
            String field = error instanceof FieldError ? ((FieldError) error).getField() : "globalError";
            jsonResults.add(new JsonResult(error.getObjectName(), messageSource.getMessage(error, locale), field, error.getCode()));
        }
        return jsonResults;
    }

    private boolean isInvalidDate(String startDateStr, String endDateStr) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = format.parse(startDateStr);
        Date endDate = format.parse(endDateStr);
        log.info("Call PlanAjaxController.isInvalidDate --- Variable = startDate = {}", startDate);
        log.info("Call PlanAjaxController.isInvalidDate --- Variable = endDate = {}", endDate);
        return endDate.before(startDate);
    }
}
