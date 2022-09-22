package kr.spring.teamblog.service;

import java.util.List;
import java.util.Map;

import kr.spring.notice.vo.NoticeReplyVO;
import kr.spring.teamblog.vo.TeamblogFavVO;
import kr.spring.teamblog.vo.TeamblogReplyVO;
import kr.spring.teamblog.vo.TeamblogVO;

public interface TeamblogService {
	public List<TeamblogVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertTeamblog(TeamblogVO teamblog);
	public TeamblogVO selectTeamblog(Integer team_num);
	public void updateHit(Integer team_num);
	public void updateTeamblog(TeamblogVO teamblog);
	public void deleteTeamblog(Integer team_num);
	public void deleteFile(Integer team_num);
	
	//팀블로그 좋아요
	public TeamblogFavVO selectFav(TeamblogFavVO fav);
	public int selectFavCount(Integer team_num);
	public void insertFav(TeamblogFavVO teamblogFav);
	public void deleteFav(Integer team_fav_num);
	
	//팀블로그 댓글
	public List<TeamblogReplyVO> selectListReply(
			Map<String,Object> map);
	public int selectRowCountReply(
			Map<String,Object> map);
	public TeamblogReplyVO selectReply(Integer team_re_num);
	public void insertReply(TeamblogReplyVO teamblogReply);
	public void updateReply(TeamblogReplyVO teamblogReply);
	public void deleteReply(Integer team_re_num);
	
}
