package kr.spring.company.service;

import kr.spring.company.dao.CompanyMapper;
import kr.spring.company.vo.CompanyVO;
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
}
