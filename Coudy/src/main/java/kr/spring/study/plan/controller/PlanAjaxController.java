package kr.spring.study.plan.controller;


import kr.spring.study.plan.artgumentResolver.Login;
import kr.spring.study.plan.service.PlanService;
import kr.spring.study.plan.vo.PlanVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.validation.*;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/study/plan/{studyNum}")
@RequiredArgsConstructor
public class PlanAjaxController {
    private final PlanService planService;

    @PostMapping
    public Map<String, Object> createPlan(@Login Integer mem_num, @Validated @RequestBody CreatePlanForm form,
                                          BindingResult result, Locale locale, @PathVariable Integer studyNum) throws BindException {
        log.info("Call PlanAjaxController.createPlan --- Variable = form = {}", form);
        log.info("Call PlanAjaxController.createPlan --- Variable = result = {}", result.getAllErrors());


        //일정 삭제할 권한 있는지 검사 >> 인터셉터에서 처리?aop
<<<<<<< HEAD

=======
>>>>>>> branch 'main' of https://github.com/park-kyutae/Coudy.git
        isInvalidDate(form.getPlanStartDate(), form.getPlanEndDate(), result);


        if (result.hasErrors()) {
            throw new BindException(result);
        }
        PlanVO planVO = new PlanVO(studyNum, form.getPlanContent(), form.getPlanStartDate(),
                form.getPlanEndDate(), form.getPlanColor(), mem_num, form.isPlanIsShared());
        planService.createPlan(planVO);

        return Map.of("result", "success");
    }


    @PatchMapping
    public Map<String, Object> updatePlan(@Login Integer mem_num, @Validated @RequestBody UpdatePlanForm form,
                                          BindingResult result, Locale locale, @PathVariable Integer studyNum) throws ParseException, BindException {
        log.info("Call PlanAjaxController.updatePlan --- Variable = form = {}", form);
        log.info("Call PlanAjaxController.updatePlan --- Variable = result.getAllErrors() = {}", result.getAllErrors());
        isInvalidDate(form.getPlanStartDate(), form.getPlanEndDate(), result);
        if (result.hasErrors()) {
            throw new BindException(result);
        }
        PlanVO planVO = new PlanVO(form.getPlanNum(), studyNum, form.getPlanContent(), form.getPlanStartDate(),
                form.getPlanEndDate(), form.getPlanColor(), mem_num, form.isPlanIsCompleted(), form.isPlanIsShared());
        planService.updatePlan(planVO);
        return Map.of("result", "success");
    }

    @PatchMapping("/progress/update-completed")
    public Map<String, Object> updateIsCompleted(@Login Integer mem_num, @Validated @RequestBody CommonPlanNumForm form,
                                                 @PathVariable Integer studyNum) {
        planService.updateIsCompleted(form.getPlanNum());
        return Map.of("result", "success");
    }

    @DeleteMapping
    public Map<String, Object> deletePlan(@Login Integer mem_num, @Validated @RequestBody CommonPlanNumForm form, @PathVariable Integer studyNum) {
        log.info("Call PlanAjaxController.deletePlan --- Variable = mem_num = {}", mem_num);
        planService.deletePlan(form.getPlanNum());

        //검증 여부따라 result값 바꾸기 + jsp에서 오류 처리
        return Map.of("result", "success");
    }

    @GetMapping("/find")
    public List<FindPlanForm> findPlans(@Login Integer mem_num,
                                        @RequestParam String thisYearMonth, @PathVariable Integer studyNum) {
        //일정 추가/삭제/수정 보여지게 할건지 is_owned,is_team_manager 필드 추가해서 ajax에서 처리
//        List<PlanVO> plans = planService.findPlans(studyNum, map.get("thisYearMonth"));
        List<FindPlanForm> plans = planService.findPlans(studyNum, thisYearMonth).stream()
                .map(x -> new FindPlanForm(x.getPlanNum(), x.getPlanContent(), x.getPlanStartDate(),
                        x.getPlanEndDate(), x.getPlanColor(), x.getMemNum(), x.isPlanIsCompleted(), x.isPlanIsShared()))
                .collect(Collectors.toList());


        log.info("Call PlanAjaxController.findPlans --- Variable = plans = {}", plans);
        return plans;
    }

    @GetMapping("/progress/find-all-shared")
    public List<FindSharedForm> findAllSharedPlan(@Login Integer mem_num, @PathVariable Integer studyNum) {
        List<FindSharedForm> plans = planService.findAllPlan(studyNum).stream()
                .map(x -> new FindSharedForm(x.getPlanNum(), x.getPlanContent(), x.getPlanStartDate(), x.getPlanEndDate(), x.getPlanColor(), x.isPlanIsCompleted()))
                .collect(Collectors.toList());
        return plans;
    }

    //validator 사용?
    private void isInvalidDate(Date startDate, Date endDate, Errors errors) {
        log.info("Call PlanAjaxController.isInvalidDate --- Variable = startDate = {}", startDate);
        log.info("Call PlanAjaxController.isInvalidDate --- Variable = endDate = {}", endDate);
        if (!errors.hasErrors() && endDate.before(startDate)) {
            errors.reject("laterThanStart");
        }
    }
}
