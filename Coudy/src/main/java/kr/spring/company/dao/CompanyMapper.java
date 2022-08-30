package kr.spring.company.dao;

import kr.spring.company.vo.CompanyVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CompanyMapper {
    public List<CompanyVO> selectList(Map<String,Object> map);

    public void insertCompany(CompanyVO companyVO);
}
