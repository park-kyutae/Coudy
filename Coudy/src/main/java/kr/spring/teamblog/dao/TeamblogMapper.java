package kr.spring.teamblog.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.teamblog.vo.TeamblogFavVO;
import kr.spring.teamblog.vo.TeamblogReplyVO;
import kr.spring.teamblog.vo.TeamblogVO;

@Mapper
public interface TeamblogMapper {
	public List<TeamblogVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	@Insert("INSERT INTO teamblog (team_num,team_title,team_content,team_uploadfile,team_filename,team_ip,mem_num) VALUES (teamblog_seq.nextval,#{team_title},#{team_content},#{team_uploadfile},#{team_filename},#{team_ip},#{mem_num})")
	public void insertTeamblog(TeamblogVO teamblog);
	@Select("SELECT * FROM teamblog b JOIN member m USING (mem_num) JOIN member_detail d USING(mem_num) WHERE b.team_num=#{team_num}")
	public TeamblogVO selectTeamblog(Integer team_num);
	@Update("UPDATE teamblog SET team_hit=team_hit+1 WHERE team_num=#{team_num}")
	public void updateHit(Integer team_num);
	public void updateTeamblog(TeamblogVO teamblog);
	@Delete("DELETE FROM teamblog WHERE team_num=#{team_num}")
	public void deleteTeamblog(Integer team_num);
	@Update("UPDATE teamblog SET team_uploadfile='', team_filename='' WHERE team_num=#{team_num}")
	public void deleteFile(Integer team_num);
	
	//부모글 좋아요
	@Select("SELECT * FROM teamblog_fav WHERE team_num=#{team_num} AND mem_num=#{mem_num}")
	public TeamblogFavVO selectFav(TeamblogFavVO fav);
	@Select("SELECT COUNT(*) FROM teamblog_fav WHERE team_num=#{team_num}")
	public int selectFavCount(Integer team_num);
	@Insert("INSERT INTO teamblog_fav (team_fav_num,team_num,mem_num) VALUES (team_fav_seq.nextval,#{team_num},#{mem_num})")
	public void insertFav(TeamblogFavVO teamblogFav);
	@Delete("DELETE FROM teamblog_fav WHERE team_fav_num=#{team_fav_num}")
	public void deleteFav(Integer team_fav_num);
	@Delete("DELETE FROM teamblog_fav WHERE team_num=#{team_num}")
	public void deleteFavByTeamblogNum(Integer team_num);
	
	//부모글 댓글
	public List<TeamblogReplyVO> selectListReply(Map<String,Object> map);
	@Select("SELECT COUNT(*) FROM teamblog_reply b JOIN member m ON b.mem_num=m.mem_num WHERE team_num=#{team_num}")
	public int selectRowCountReply(Map<String,Object> map);
	@Select("SELECT * FROM teamblog_reply WHERE team_re_num=#{team_re_num}")
	public TeamblogReplyVO selectReply(Integer team_re_num);
	@Insert("INSERT INTO teamblog_reply (team_re_num,team_re_content,team_re_ip,team_num,mem_num) VALUES (team_reply_seq.nextval,#{team_re_content},#{team_re_ip},#{team_num},#{mem_num})")
	public void insertReply(TeamblogReplyVO teamblogReply);
	@Update("UPDATE teamblog_reply SET team_re_content=#{team_re_content},team_re_ip=#{team_re_ip},team_re_mdate=SYSDATE WHERE team_re_num=#{team_re_num}")
	public void updateReply(TeamblogReplyVO teamblogReply);
	@Delete("DELETE FROM teamblog_reply WHERE team_re_num=#{team_re_num}")
	public void deleteReply(Integer team_re_num);
	@Delete("DELETE FROM teamblog_reply WHERE team_num=#{team_num}")
	public void deleteReplyByTeamblogNum(Integer team_num);
}








