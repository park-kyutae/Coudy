package kr.spring.notice.service;

import java.util.List;  
import java.util.Map;

import kr.spring.notice.vo.NoticeFavVO;
import kr.spring.notice.vo.NoticeReplyVO;
import kr.spring.notice.vo.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertNotice(NoticeVO notice);
	public NoticeVO selectNotice(Integer notice_num);
	public void updateHit(Integer notice_num);
	public void updateNotice(NoticeVO notice);
	public void deleteNotice(Integer notice_num);
	public void deleteFile(Integer notice_num);
	
	//공지글 좋아요
	public NoticeFavVO selectFav(NoticeFavVO fav);
	public int selectFavCount(Integer notice_num);
	public void insertFav(NoticeFavVO noticeFav);
	public void deleteFav(Integer notice_fav_num);
		
	//공지글 댓글
	public List<NoticeReplyVO> selectListReply(
			Map<String,Object> map);
	public int selectRowCountReply(
			Map<String,Object> map);
	public NoticeReplyVO selectReply(Integer notice_re_num);
	public void insertReply(NoticeReplyVO noticeReply);
	public void updateReply(NoticeReplyVO noticeReply);
	public void deleteReply(Integer notice_re_num);
}
