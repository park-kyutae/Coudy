package kr.spring.company.dao;

import kr.spring.company.vo.CompanyVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

@Mapper
public interface CompanyMapper {
    @Select("SELECT * FROM com_info ORDER BY com_num DESC")
    public List<CompanyVO> selectList(Map<String,Object> map);

    @Select("SELECT COUNT(*) FROM com_info")
    public int selectListCount();
    @Insert("INSERT INTO com_info (com_num,mem_num,com_name,com_title,com_career,com_pay,com_edu,com_time,com_empType,com_tag,com_zipcode,com_address1,com_address2,com_schedule,com_part,com_filename,com_photo,com_comTitle,com_comContent) VALUES (com_info_seq.nextval,#{mem_num},#{com_name},#{com_title},#{com_career},#{com_pay},#{com_edu},#{com_time},#{com_empType},#{com_tag},#{com_zipcode},#{com_address1},#{com_address2},#{com_schedule},#{com_part},#{com_filename},#{com_photo},#{com_comTitle},#{com_comContent})")
    public void insertCompany(CompanyVO companyVO);

    @Select("SELECT * FROM com_info WHERE com_num=#{com_num}")
    public CompanyVO selectCompany(Integer com_num);

    @Update("UPDATE com_info SET com_hit = com_hit+1 WHERE com_num=#{com_num}")
    public void updateHit(Integer com_num);
}
