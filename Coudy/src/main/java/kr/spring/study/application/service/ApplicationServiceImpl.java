package kr.spring.study.application.service;

import kr.spring.study.application.dao.ApplicationMapper;
import kr.spring.study.application.vo.ApplicationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ApplicationServiceImpl implements ApplicationService{

    @Autowired
    private ApplicationMapper applicationMapper;

    @Override
    public void insertApplication(ApplicationVO applicationVO) {
        applicationMapper.insertApplication(applicationVO);
    }

    @Override
    public int selectApplicants(Integer study_num) {
        return applicationMapper.selectApplicants(study_num);
    }

    @Override
    public ApplicationVO selectStudyGroup(Integer study_num) {
        return null;
    }

    @Override
    public List<ApplicationVO> selectMyAllApplications(Integer mem_num) {
        return applicationMapper.selectMyAllApplications(mem_num);
    }

    @Override
    public List<ApplicationVO> selectMyStudyApplications(Integer study_num) {
        return applicationMapper.selectMyStudyApplications(study_num);
    }
}
