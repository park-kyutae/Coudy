package kr.spring.company.dao;

import kr.spring.company.vo.CompanyVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CompanyMapper {
    public List<CompanyVO> selectList(Map<String,Object> map);

    @Insert("INSERT INTO com_info (com_num,mem_num,com_name,com_title,com_career,com_pay,com_edu,com_time,com_empType,com_tag,com_zipcode,com_address1,com_address2,com_schedule,com_part,com_filename,com_photo,com_comTitle,com_comContent) VALUES (com_info_seq.nextval,#{mem_num},#{com_name},#{com_title},#{com_career},#{com_pay},#{com_edu},#{com_time},#{com_empType},#{com_tag},#{com_zipcode},#{com_address1},#{com_address2},#{com_schedule},#{com_part},#{com_filename},#{com_photo},#{com_comTitle},#{com_comContent})")
    public void insertCompany(CompanyVO companyVO);
}
