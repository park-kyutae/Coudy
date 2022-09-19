package kr.spring.company.dao;

import kr.spring.company.vo.CompanyResumeVO;
import kr.spring.company.vo.CompanyScrapVO;
import kr.spring.company.vo.CompanyVO;
import org.apache.ibatis.annotations.*;

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

    @Insert("INSERT INTO com_scrap (scrap_num,mem_num,com_num) VALUES (com_scrap_seq.nextval,#{mem_num},#{com_num})")
    void insertScrap(CompanyScrapVO companyScrapVO);

    @Select("SELECT count(*) FROM com_scrap WHERE com_num = #{com_num} AND mem_num=#{mem_num}")
    Integer selectScrapCount(Integer com_num,Integer mem_num);

    @Select("SELECT * FROM com_scrap WHERE com_num=#{com_num} AND mem_num=#{mem_num}")
    CompanyScrapVO selectScrap(Integer com_num, Integer mem_num);

    @Delete("DELETE FROM com_scrap WHERE scrap_num=#{scrap_num}")
    public void deleteScrap(Integer scrap_num);

    @Insert("INSERT INTO com_resume (resume_num,uploadfile,filename,mem_num,com_num,mem_name) VALUES (com_resume_seq.nextval,#{uploadfile},#{filename},#{mem_num},#{com_num},#{mem_name})")
    public void insertResume(CompanyResumeVO companyResumeVO);

    @Select("SELECT * FROM com_resume r JOIN com_info i " +
            "USING(com_num) WHERE r.resume_num=#{resume_num}")
    public CompanyResumeVO selectResume(Integer resume_num);

    @Select("SELECT * FROM COM_RESUME r\n" +
            "    INNER JOIN COM_INFO CI on CI.COM_NUM = r.COM_NUM\n" +
            "        WHERE CI.MEM_NUM=#{mem_num}")
    public List<CompanyResumeVO> resumeList(Integer mem_num);


}
