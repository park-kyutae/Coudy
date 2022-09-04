package kr.spring.study.studygroup.service;

import kr.spring.study.studygroup.vo.StudyGroupReviewVO;
import kr.spring.study.studygroup.vo.StudyGroupVO;

import java.util.List;
import java.util.Map;

public interface StudyGroupService {
    
    //전체글 조회
    public List<StudyGroupVO> selectAllStudyGroups(Map<String,Object> map);
    //스터디 등록
    public void insertStudyGroup(StudyGroupVO studyGroup);
    //스터디 수정
    public void updateStudyGroup(StudyGroupVO studyGroup);
    //스터디 삭제
    public void deleteStudyGroup(Integer study_num);
    //스터디 갯수 세기
    public int selectRowCount(Map<String,Object> map);
    //스터디 선택
    public StudyGroupVO selectStudyGroup(Integer study_num);
    //스터디 프로필 사진 삭제
    //리뷰 작성
    //public void insertStudyGroupReview(StudyGroupReviewVO studyGroupReview);
    //리뷰 수정
    //public void updateStudyGroupReview(StudyGroupReviewVO studyGroupReview);
    //리뷰 삭제

    //리뷰 전체 조회
    //리뷰 숫자 세기
    //리뷰 선택
}
