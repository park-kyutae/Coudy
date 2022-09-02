package kr.spring.techblog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.techblog.vo.TechblogVO;

@Mapper
public interface TechblogMapper {
	//부모글
	public List<TechblogVO>selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	@Insert("INSERT INTO techblog (tech_num,tech_title,tech_name,"
			+ "tech_photo,tech_photoname,tech_content,tech_kategorie,"
			+ "tech_tag,mem_num) VALUES (techblog_seq.nextval,#{tech_title},"
			+ "#{tech_name},#{tech_photo},#{tech_photoname},#{tech_content},"
			+ "#{tech_kategorie},#{tech_tag},#{mem_num})")
	public void insertTechblog(TechblogVO techblog);
	@Select("SELECT * FROM techblog t JOIN member m "
			+ "USING(mem_num) JOIN member_detail d "
			+ "USING(mem_num) WHERE t.tech_num=#{tech_num}")
	public TechblogVO selectTechblog(Integer tech_num);
	@Update("UPDATE techblog SET hit=hit+1 WHERE tech_num=#{tech_num}")
	public void updateTechblogHit(Integer tech_num);
	public void updateTechblog(TechblogVO techblog);
	@Delete("DELETE FROM techblog WHERE tech_num=#{tech_num}")
	public void deleteTechblog(Integer tech_num);
	@Update("UPDATE techblog SET tech_photo='',"
			+ "tech_photoname='' WHERE tech_num=#{tech_num}")
	public void deleteFile(Integer tech_num);
}
