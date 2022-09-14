package kr.spring.study.studygroup.service;

import kr.spring.study.studygroup.dao.StudyUserMapper;
import kr.spring.study.studygroup.vo.StudyUserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class StudyUserServiceImpl implements StudyUserService{

    @Autowired
    private StudyUserMapper studyUserMapper;

    @Override
    public List<StudyUserVO> selectListStudyUser(Map<String, Object> map) {
        return studyUserMapper.selectListStudyUser(map);
    }

    @Override
    public void insertStudyUser(StudyUserVO studyUserVO) {
        studyUserMapper.insertStudyUser(studyUserVO);
    }

    @Override
    public int selectRowCount(Map<String, Object> map) {
        return studyUserMapper.selectRowCount(map);
    }

    @Override
    public void updateAuth(StudyUserVO studyUserVO) {
        studyUserMapper.updateAuth(studyUserVO);
    }

    @Override
    public void deleteApplication(Integer study_user_num) {

    }

    @Override
    public StudyUserVO selectStudyUser(Integer mem_num) {
        return studyUserMapper.selectStudyUser(mem_num);
    }
}
