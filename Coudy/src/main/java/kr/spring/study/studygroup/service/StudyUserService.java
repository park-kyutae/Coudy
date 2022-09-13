package kr.spring.study.studygroup.service;

import kr.spring.study.studygroup.vo.StudyGroupVO;
import kr.spring.study.studygroup.vo.StudyUserVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface StudyUserService {

    public List<StudyUserVO> selectListStudyUser(Map<String,Object> map);
    public void insertStudyUser(StudyUserVO studyUserVO);
    public int selectRowCount(Map<String,Object> map);
    public void updateAuth(StudyUserVO studyUserVO);
    public void deleteApplication(Integer study_user_num);
    public StudyGroupVO selectStudyUser(Integer study_user_num);
}
