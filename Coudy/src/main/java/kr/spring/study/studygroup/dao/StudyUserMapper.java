package kr.spring.study.studygroup.dao;

import kr.spring.study.studygroup.vo.StudyGroupVO;
import kr.spring.study.studygroup.vo.StudyUserVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface StudyUserMapper {

    public List<StudyUserVO> selectListStudyUser(Map<String,Object> map);
    @Insert("INSERT INTO study_user (study_user_num,registered,is_group_manager,study_num,mem_num) " +
            "VALUES (application_seq.nextval,#{registered},#{is_group_manager},#{study_num},#{mem_num})")
    public void insertStudyUser(StudyUserVO studyUserVO);
    public int selectRowCount(Map<String,Object> map);
    public void updateAuth(StudyUserVO studyUserVO);

    @Delete("")
    public void deleteApplication(Integer study_user_num);

    @Select("SELECT * FROM study_user s JOIN member m USING(mem_num) JOIN member_detail d USING(mem_num) WHERE s.study_user_num=#{study_user_num}")
    public StudyGroupVO selectStudyUser(Integer study_user_num);

}
