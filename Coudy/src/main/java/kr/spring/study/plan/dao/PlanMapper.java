package kr.spring.study.plan.dao;

import kr.spring.study.plan.vo.PlanVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PlanMapper {
    @Select("select PLAN_NUM, PLAN_CONTENT," +
            " PLAN_START_DATE, PLAN_END_DATE, PLAN_COLOR, MEM_NUM, PLAN_IS_COMPLETED,PLAN_IS_SHARED" +
            " from STUDY_PLAN where STUDY_NUM=#{studyNum} " +
            "and PLAN_END_DATE >= #{thisYearMonth} " +
            "and PLAN_START_DATE <= LAST_DAY(#{thisYearMonth})")
    List<PlanVO> selectPlansByStudyNum(int studyNum, String thisYearMonth);
    @Select("select PLAN_NUM, PLAN_CONTENT," +
            " PLAN_START_DATE, PLAN_END_DATE, PLAN_COLOR, MEM_NUM, PLAN_IS_COMPLETED,PLAN_IS_SHARED" +
            " from STUDY_PLAN where PLAN_NUM=#{planNum}")
    PlanVO selectPlan(int planNum);

    @Select("select PLAN_NUM, PLAN_CONTENT," +
            " PLAN_START_DATE, PLAN_END_DATE, PLAN_COLOR, PLAN_IS_COMPLETED" +
            " from STUDY_PLAN where STUDY_NUM=#{studyNum} " +
            "and PLAN_IS_SHARED = 1 order by PLAN_START_DATE")
    List<PlanVO> selectAllSharedPlans(int studyNum);

    @Update("update STUDY_PLAN set PLAN_CONTENT=#{planContent},PLAN_START_DATE=#{planStartDate}," +
            "PLAN_END_DATE=#{planEndDate},PLAN_COLOR=#{planColor},PLAN_IS_COMPLETED=#{planIsCompleted},PLAN_IS_SHARED=#{planIsShared} " +
            "where plan_num = #{planNum}")
    void updatePlan(PlanVO planVO);

    @Update("update STUDY_PLAN set PLAN_IS_COMPLETED=#{planIsCompleted} " +
            "where plan_num = #{planNum}")
    void updateCompletePlan(int planNum,boolean planIsCompleted);

    @Insert("insert into STUDY_PLAN (PLAN_NUM, STUDY_NUM, PLAN_CONTENT, PLAN_START_DATE, PLAN_END_DATE, PLAN_COLOR, MEM_NUM,PLAN_IS_SHARED)" +
            "values (STUDY_PLAN_SEQ.nextval,#{studyNum},#{planContent},#{planStartDate}," +
            "#{planEndDate},#{planColor},#{memNum},#{planIsShared})")
    void createPlan(PlanVO planVO);

    @Delete("delete STUDY_PLAN where PLAN_NUM=#{planNum}")
    void deletePlan(int planNum);

}
