package kr.spring.techblog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.techblog.vo.TechblogFavVO;
import kr.spring.techblog.vo.TechblogReplyVO;
import kr.spring.techblog.vo.TechblogVO;

@Mapper
public interface TechblogMapper {
	//부모글
	public List<TechblogVO>selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	@Insert("INSERT INTO techblog (tech_num,tech_title,tech_name,"
			+ "tech_content,tech_category,"
			+ "tech_tag,mem_num) VALUES (techblog_seq.nextval,#{tech_title},"
			+ "#{tech_name},#{tech_content},#{tech_category},"
			+ "#{tech_tag},#{mem_num})")
	public void insertTechblog(TechblogVO techblog);
	@Select("SELECT * FROM techblog t JOIN member m "
			+ "USING(mem_num) JOIN member_detail d "
			+ "USING(mem_num) WHERE t.tech_num=#{tech_num}")
	public TechblogVO selectTechblog(Integer tech_num);
	@Update("UPDATE techblog SET tech_hit=tech_hit+1 WHERE tech_num=#{tech_num}")
	public void updateTechblogHit(Integer tech_num);
	public void updateTechblog(TechblogVO techblog);
	@Delete("DELETE FROM techblog WHERE tech_num=#{tech_num}")
	public void deleteTechblog(Integer tech_num);
	@Update("UPDATE techblog SET tech_photo='',"
			+ "tech_photoname='' WHERE tech_num=#{tech_num}")
	public void deleteFile(Integer tech_num);
	public List<TechblogVO>selectListA(Map<String, Object> map);
	public List<TechblogVO>selectListB(Map<String, Object> map);
	public List<TechblogVO>selectListC(Map<String, Object> map);
	public List<TechblogVO>selectListD(Map<String, Object> map);
	
	//부모글 좋아요
	@Select("SELECT * FROM techblog_fav "
			+ "WHERE tech_num=#{tech_num} AND mem_num=#{mem_num}")
	public TechblogFavVO selectFav(TechblogFavVO fav);
	@Select("SELECT COUNT(*) FROM techblog_fav "
			+ "WHERE tech_num=#{tech_num}")
	public int selectFavCount(Integer tech_num);
	@Insert("INSERT INTO techblog_fav (tech_fav_num,tech_num,mem_num) "
			+ "VALUES (techblog_fav_seq.nextval,#{tech_num},#{mem_num})")
	public void insertFav(TechblogFavVO techblogFav);
	@Delete("DELETE FROM techblog_fav WHERE tech_fav_num=#{tech_fav_num}")
	public void deleteFav(Integer tech_fav_num);
	@Delete("DELETE FROM techblog_fav WHERE tech_num=#{tech_num}")
	public void deleteFavByTechblogNum(Integer tech_num);
	
	//댓글
	public List<TechblogReplyVO> selectListReply(
			                  Map<String,Object> map);
	@Select("SELECT COUNT(*) FROM techblog_reply t "
			+ "JOIN member m ON t.mem_num=m.mem_num "
			+ "WHERE tech_num=#{tech_num}")
	public int selectRowCountReply(Map<String,Object> map);
	@Select("SELECT * FROM techblog_reply WHERE tech_re_num=#{tech_re_num}")
	public TechblogReplyVO selectReply(Integer tech_re_num);
	@Insert("INSERT INTO techblog_reply (tech_re_num,"
			+ "tech_re_content,tech_num,mem_num) "
			+ "VALUES (techblog_reply_seq.nextval,#{tech_re_content},"
			+ "#{tech_num},#{mem_num})")
	public void insertReply(TechblogReplyVO techReply);
	@Update("UPDATE techblog_reply SET "
			+ "tech_re_content=#{tech_re_content},"
			+ "tech_re_date=SYSDATE WHERE tech_re_num=#{tech_re_num}")
	public void updateReply(TechblogReplyVO techReply);
	@Delete("DELETE FROM techblog_reply WHERE tech_re_num=#{tech_re_num}")
	public void deleteReply(Integer tech_re_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
	@Delete("DELETE FROM techblog_reply "
			+ "WHERE tech_num=#{tech_num}")
	public void deleteReplyBytechNum(
			                       Integer tech_num);
}
