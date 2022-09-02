package kr.spring.study.studygroup.service;

import kr.spring.study.studygroup.dao.StudyGroupMapper;
import kr.spring.study.studygroup.vo.StudyGroupReviewVO;
import kr.spring.study.studygroup.vo.StudyGroupVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class StudyGroupServiceImpl implements StudyGroupService{

    @Autowired
    private StudyGroupMapper studyGroupMapper;

    @Override
    public List<StudyGroupVO> selectAllStudyGroups(Map<String, Object> map) {
        return studyGroupMapper.selectAllStudyGroups(map);
    }

    @Override
    public void insertStudyGroup(StudyGroupVO studyGroup) {
        studyGroupMapper.insertStudyGroup(studyGroup);
    }

    @Override
    public void updateStudyGroup(StudyGroupVO studyGroup) {
        studyGroupMapper.updateStudyGroup(studyGroup);
    }

    @Override
    public void deleteStudyGroup(Integer study_num) {
        studyGroupMapper.deleteStudyGroup(study_num);
    }

    @Override
    public void selectRowCount(Map<String, Object> map) {
        studyGroupMapper.selectRowCount(map);
    }

    @Override
    public StudyGroupVO selectStudyGroup(Integer study_num) {
        return studyGroupMapper.selectStudyGroup(study_num);
    }

   /* @Override
    public void insertStudyGroupReview(StudyGroupReviewVO studyGroupReview) {

    }

    @Override
    public void updateStudyGroupReview(StudyGroupReviewVO studyGroupReview) {

    }*/
}
