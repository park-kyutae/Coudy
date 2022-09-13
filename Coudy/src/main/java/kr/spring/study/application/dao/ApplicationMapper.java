package kr.spring.study.application.dao;

import kr.spring.study.application.vo.ApplicationVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ApplicationMapper {

    public List<ApplicationVO> selectAllApplications(Map<String, Object> map);
    @Insert("INSERT INTO application (application_num,career,meet_time,request,study_num,mem_num) " +
            "VALUES (application_seq.nextval,#{career},#{meet_time},#{request},#{study_num},#{mem_num})")
    public void insertApplication(ApplicationVO applicationVO);
    public int selectRowCount(Map<String,Object> map);
    public ApplicationVO selectApplication(Integer application_num);
}
