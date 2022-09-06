package kr.spring.company.service;

import kr.spring.company.vo.CompanyVO;

import java.util.List;
import java.util.Map;

public interface CompanyService {
    public List<CompanyVO> selectList(Map<String,Object> map);
    public int selectListCount();

    public void insertCompany(CompanyVO companyVO);
    public CompanyVO selectCompany(Integer com_num);
    public void updateHit(Integer com_num);
}
