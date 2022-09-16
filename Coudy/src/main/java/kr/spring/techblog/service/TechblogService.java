package kr.spring.techblog.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.techblog.vo.TechblogFavVO;
import kr.spring.techblog.vo.TechblogReplyVO;
import kr.spring.techblog.vo.TechblogVO;

public interface TechblogService {
	//부모글
	public List<TechblogVO>selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	public void insertTechblog(TechblogVO techblog);
	public TechblogVO selectTechblog(Integer tech_num);
	public void updateTechblogHit(Integer tech_num);
	public void updateTechblog(TechblogVO techblog);
	public void deleteTechblog(Integer tech_num);
	public void deleteFile(Integer tech_num);
	
	//부모글 좋아요
	public TechblogFavVO selectFav(TechblogFavVO fav);
	public int selectFavCount(Integer tech_num);
	public void insertFav(TechblogFavVO techblogFav);
	public void deleteFav(Integer tech_fav_num);
	
	//댓글
	public List<TechblogReplyVO> selectListReply(Map<String,Object> map);
	public int selectRowCountReply(Map<String,Object> map);
	public TechblogReplyVO selectReply(Integer tech_re_num);
	public void insertReply(TechblogReplyVO techReply);
	public void updateReply(TechblogReplyVO techReply);
	public void deleteReply(Integer tech_re_num);
}
