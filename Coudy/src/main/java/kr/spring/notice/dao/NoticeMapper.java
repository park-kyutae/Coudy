package kr.spring.notice.dao;

import java.util.List;   
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.notice.vo.NoticeFavVO;
import kr.spring.notice.vo.NoticeReplyVO;
import kr.spring.notice.vo.NoticeVO;

@Mapper
public interface NoticeMapper {
	public List<NoticeVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	@Insert("INSERT INTO notice (notice_num,notice_title,notice_content,notice_uploadfile,notice_filename,notice_ip,mem_num) VALUES (notice_seq.nextval,#{notice_title},#{notice_content},#{notice_uploadfile},#{notice_filename},#{notice_ip},#{mem_num})")
	public void insertNotice(NoticeVO notice);
	@Select("SELECT * FROM notice b JOIN member m USING(mem_num) JOIN member_detail d USING(mem_num) WHERE b.notice_num=#{notice_num}")
	public NoticeVO selectNotice(Integer notice_num);
	@Update("UPDATE notice SET notice_hit=notice_hit+1 WHERE notice_num=#{notice_num}")
	public void updateHit(Integer notice_num);
	public void updateNotice(NoticeVO notice);
	@Delete("DELETE FROM notice WHERE notice_num=${notice_num}")
	public void deleteNotice(Integer notice_num);
	@Update("UPDATE notice SET notice_uploadfile='',notice_filename='' WHERE notice_num=#{notice_num}")
	public void deleteFile(Integer notice_num);
	
	//부모글 좋아요
	@Select("SELECT * FROM notice_fav WHERE notice_num=#{notice_num} AND mem_num=#{mem_num}")
	public NoticeFavVO selectFav(NoticeFavVO fav);
	@Select("SELECT COUNT(*) FROM notice_fav WHERE notice_num=#{notice_num}")
	public int selectFavCount(Integer notice_num);
	@Insert("INSERT INTO notice_fav (notice_fav_num,notice_num,mem_num) VALUES (notice_fav_seq.nextval,#{notice_num},#{mem_num})")
	public void insertFav(NoticeFavVO noticeFav);
	@Delete("DELETE FROM notice_fav WHERE notice_fav_num=#{notice_fav_num}")
	public void deleteFav(Integer notice_fav_num);
	@Delete("DELETE FROM notice_fav WHERE notice_num=#{notice_num}")
	public void deleteFavByNoticeNum(Integer notice_num);

	//댓글
	public List<NoticeReplyVO> selectListReply(
			Map<String,Object> map);
	@Select("SELECT COUNT(*) FROM notice_reply b "
			+ "JOIN member m ON b.mem_num=m.mem_num "
			+ "WHERE notice_num=#{notice_num}")
	public int selectRowCountReply(Map<String,Object> map);
	@Select("SELECT * FROM notice_reply WHERE notice_re_num=#{notice_re_num}")
	public NoticeReplyVO selectReply(Integer notice_re_num);
	@Insert("INSERT INTO notice_reply (notice_re_num,"
			+ "notice_re_content,notice_re_ip,notice_num,mem_num) "
			+ "VALUES (notice_reply_seq.nextval,#{notice_re_content},"
			+ "#{notice_re_ip},#{notice_num},#{mem_num})")
	public void insertReply(NoticeReplyVO noticeReply);
	@Update("UPDATE notice_reply SET "
			+ "notice_re_content=#{notice_re_content},notice_re_ip=#{notice_re_ip}, "
			+ "notice_re_mdate=SYSDATE WHERE notice_re_num=#{notice_re_num}")
	public void updateReply(NoticeReplyVO noticeReply);
	@Delete("DELETE FROM notice_reply WHERE notice_re_num=#{notice_re_num}")
	public void deleteReply(Integer notice_re_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
	@Delete("DELETE FROM notice_reply "
			+ "WHERE notice_num=#{notice_num}")
	public void deleteReplyByNoticeNum(
			Integer notice_num);

}
