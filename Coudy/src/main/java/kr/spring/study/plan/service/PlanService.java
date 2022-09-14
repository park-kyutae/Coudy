package kr.spring.study.plan.service;

import kr.spring.study.plan.vo.PlanVO;

import java.util.List;


public interface PlanService {
    List<PlanVO> findPlans(int studyNum,String thisYearMonth);

    void createPlan(PlanVO planVO);
    void updatePlan(PlanVO planVO);
    void deletePlan(int planNum);

    void updateIsCompleted(int planNum);

    List<PlanVO> findAllPlan(int studyNum);

}
