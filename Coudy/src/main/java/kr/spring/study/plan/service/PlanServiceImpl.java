package kr.spring.study.plan.service;

import kr.spring.study.plan.dao.PlanMapper;
import kr.spring.study.plan.vo.PlanVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class PlanServiceImpl implements PlanService{
    private final PlanMapper planMapper;

    @Override
    public List<PlanVO> findPlans(Integer studyNum,String  thisYearMonth) {

        return planMapper.selectPlansByStudyNum(studyNum,thisYearMonth);

    }

    @Override
    public void createPlan(PlanVO planVO) {
        log.info("planVO = {}", planVO);
        planMapper.createPlan(planVO);
    }
}
