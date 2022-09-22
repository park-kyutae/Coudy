package kr.spring.study.studygroup.dao;


import kr.spring.member.vo.MemberVO;
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
            "VALUES (study_user_seq.nextval,#{registered},#{is_group_manager},#{study_num},#{mem_num})")
    public void insertStudyUser(StudyUserVO studyUserVO);
    public int selectRowCount(Map<String,Object> map);
    public void updateAuth(StudyUserVO studyUserVO);

    @Delete("")
    public void deleteApplication(Integer study_user_num);

    @Select("SELECT * FROM study_user s JOIN member m USING(mem_num) JOIN member_detail d USING(mem_num) WHERE s.study_num=#{study_num} AND mem_num=#{mem_num}")
    public StudyUserVO selectStudyUser(Integer study_num, Integer mem_num);

    @Select("SELECT * FROM study_user s JOIN member m USING(mem_num) JOIN member_detail d USING(mem_num) WHERE s.mem_num=#{mem_num}")
    public StudyUserVO selectUser(Integer mem_num);

    @Select("SELECT * FROM MEMBER_DETAIL md JOIN STUDY_USER S on md.MEM_NUM = s.MEM_NUM where STUDY_NUM=#{study_num}")
    public List<MemberVO> selectMemberByStudyNum(Integer study_num);
}
