package kr.spring.company.service;

import kr.spring.company.dao.CompanyMapper;
import kr.spring.company.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class CompanyServiceImpl implements CompanyService{

    @Autowired
    CompanyMapper companyMapper;

    @Override
    public List<CompanyVO> selectList(Map<String, Object> map) {
        return companyMapper.selectList(map);
    }

    @Override
    public int selectListCount() {
        return companyMapper.selectListCount();
    }

    @Override
    public void insertCompany(CompanyVO companyVO) {
        companyMapper.insertCompany(companyVO);
    }

    @Override
    public CompanyVO selectCompany(Integer com_num) {
        return companyMapper.selectCompany(com_num);
    }

    @Override
    public void updateHit(Integer com_num) {
        companyMapper.updateHit(com_num);
    }

    @Override
    public void insertScrap(CompanyScrapVO companyScrapVO) {
        companyMapper.insertScrap(companyScrapVO);
    }
    @Override
    public Integer selectScrapCount(Integer com_num, Integer mem_num) {
        return companyMapper.selectScrapCount(com_num, mem_num);
    }

    @Override
    public void deleteScrap(Integer scrap_num) {
        companyMapper.deleteScrap(scrap_num);
    }

    @Override
    public CompanyScrapVO selectScrap(Integer com_num, Integer mem_num) {
        return companyMapper.selectScrap(com_num,mem_num);
    }

    @Override
    public void insertResume(CompanyResumeVO companyResumeVO) {
        companyMapper.insertResume(companyResumeVO);
    }

    @Override
    public CompanyResumeVO selectResume(Integer resume_num) {
        return companyMapper.selectResume(resume_num);
    }

    @Override
    public List<CompanyResumeVO> resumeList(Integer mem_num) {
        return companyMapper.resumeList(mem_num);
    }

    @Override
    public List<MyResumeDTO> myResumeList(Integer mem_num) {
        return companyMapper.myResumeList(mem_num);
    }

    @Override
    public List<MyScrapDTO> selectMyScrap(Integer mem_num) {
        return companyMapper.selectMyScrap(mem_num);
    }


}
