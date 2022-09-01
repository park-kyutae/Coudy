package kr.spring.study.plan.service;

import kr.spring.study.plan.vo.PlanVO;

import java.util.List;


public interface PlanService {
    List<PlanVO> findPlans(Integer studyNum,String thisYearMonth);

    void createPlan(PlanVO planVO);

}
