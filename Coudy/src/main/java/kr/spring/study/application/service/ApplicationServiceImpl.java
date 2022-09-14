package kr.spring.study.application.service;

import kr.spring.study.application.dao.ApplicationMapper;
import kr.spring.study.application.vo.ApplicationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.system.ApplicationTemp;
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
    public int selectRowCount(Map<String, Object> map) {
        return 0;
    }

    @Override
    public ApplicationVO selectStudyGroup(Integer study_num) {
        return null;
    }

    @Override
    public List<ApplicationTemp> selectAllStudyGroups(Map<String, Object> map) {
        return null;
    }
}
