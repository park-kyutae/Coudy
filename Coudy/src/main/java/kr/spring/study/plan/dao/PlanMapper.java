package kr.spring.study.plan.dao;

import kr.spring.study.plan.vo.PlanVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PlanMapper {
    @Select("select PLAN_NUM, STUDY_NUM, PLAN_CONTENT," +
            " TO_CHAR(PLAN_START_DATE,'YYYY-MM-DD'), TO_CHAR(PLAN_END_DATE,'YYYY-MM-DD'), PLAN_COLOR, MEM_NUM, PLAN_IS_COMPLETED,PLAN_IS_SHARED" +
//            " PLAN_START_DATE,PLAN_END_DATE, PLAN_COLOR, MEM_NUM, PLAN_IS_COMPLETED,PLAN_IS_SHARED" +
            " from STUDY_PLAN where STUDY_NUM=#{studyNum} " +
            "and PLAN_END_DATE >= TO_DATE(#{thisYearMonth},'YYYY-MM-DD')" +
            "and PLAN_START_DATE <= LAST_DAY(TO_DATE(#{thisYearMonth},'YYYY-MM-DD'))")
    List<PlanVO> selectPlansByStudyNum(Integer studyNum, String thisYearMonth);

    @Update("update STUDY_PLAN set PLAN_CONTENT =#{planContent},PLAN_START_DATE=TO_Date(#{planStartDate},'YYYY-MM-DD'),PLAN_END_DATE=TO_Date(#{planEndDate},'YYYY-MM-DD'),PLAN_COLOR=#{planColor},PLAN_IS_COMPLETED=#{planIsCompleted},PLAN_IS_SHARED=#{planIsShared} where plan_num = #{planNum}")
    void updatePlan(PlanVO planVO);

    @Insert("insert into STUDY_PLAN (PLAN_NUM, STUDY_NUM, PLAN_CONTENT, PLAN_START_DATE, PLAN_END_DATE, PLAN_COLOR, MEM_NUM,PLAN_IS_SHARED)values (STUDY_PLAN_SEQ.nextval,#{studyNum},#{planContent},TO_Date(#{planStartDate},'YYYY-MM-DD')," +
            "TO_DATE(#{planEndDate},'YYYY-MM-DD'),#{planColor},#{memNum},#{planIsShared})")
    void createPlan(PlanVO planVO);
    @Delete("delete STUDY_PLAN where PLAN_NUM=#{planNum}")
    void deletePlan(int planNum);

}
