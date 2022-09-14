package kr.spring.study.application.service;

import kr.spring.study.application.vo.ApplicationVO;
import kr.spring.study.studygroup.vo.StudyGroupVO;
import org.springframework.boot.system.ApplicationTemp;

import java.util.List;
import java.util.Map;

public interface ApplicationService {

    public List<ApplicationTemp> selectAllStudyGroups(Map<String,Object> map);
    public void insertApplication(ApplicationVO applicationVO);
    //스터디 갯수 세기
    public int selectRowCount(Map<String,Object> map);
    //스터디 선택
    public ApplicationVO selectStudyGroup(Integer study_num);
}
