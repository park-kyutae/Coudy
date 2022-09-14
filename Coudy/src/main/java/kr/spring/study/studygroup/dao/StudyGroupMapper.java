package kr.spring.study.studygroup.dao;

import kr.spring.study.studygroup.vo.StudyGroupVO;
import kr.spring.study.studygroup.vo.StudyUserVO;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface StudyGroupMapper {

    @Select("SELECT studygroup_seq.nextval FROM dual")
    public int selectStudy_num();
    public List<StudyGroupVO> selectAllStudyGroups(Map<String,Object> map);
    @Insert("INSERT INTO studygroup (study_num,stack,name,description,limit,location,purpose,limit_date,start_date,end_date,mem_num) " +
            "VALUES (#{study_num},#{stack},#{name},#{description},#{limit},#{location},#{purpose},#{limit_date},#{start_date},#{end_date},#{mem_num})")
    public void insertStudyGroup(StudyGroupVO studyGroup);
    @Insert("INSERT INTO study_user (study_user_num,registered,is_group_manager,study_num,mem_num) " +
            "VALUES (study_user_seq.nextval,#{registered},#{is_group_manager},#{study_num},#{mem_num})")
    public void insertStudyUser(StudyGroupVO studyGroup);
    public int selectRowCount(Map<String,Object> map);
    public void updateStudyGroup(StudyGroupVO studyGroup);

    @Delete("DELETE FROM studygroup WHERE study_num=#{study_num}")
    public void deleteStudyGroup(Integer study_num);

    @Select("SELECT * FROM studygroup s JOIN member m USING(mem_num) JOIN member_detail d USING(mem_num) WHERE s.study_num=#{study_num}")
    public StudyGroupVO selectStudyGroup(Integer study_num);

    @Update("UPDATE studygroup SET uploadfile='',filename='' WHERE study_num=#{study_num}")
    public void deleteFile(Integer study_num);
}
