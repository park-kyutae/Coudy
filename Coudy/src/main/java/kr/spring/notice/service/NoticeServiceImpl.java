package kr.spring.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.notice.dao.NoticeMapper;
import kr.spring.notice.vo.NoticeFavVO;
import kr.spring.notice.vo.NoticeReplyVO;
import kr.spring.notice.vo.NoticeVO;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public List<NoticeVO> selectList(Map<String, Object> map) {
		return noticeMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return noticeMapper.selectRowCount(map);
	}

	@Override
	public void insertNotice(NoticeVO notice) {
		noticeMapper.insertNotice(notice);
	}

	@Override
	public NoticeVO selectNotice(Integer notice_num) {
		return noticeMapper.selectNotice(notice_num);
	}

	@Override
	public void updateHit(Integer notice_num) {
		noticeMapper.updateHit(notice_num);
	}

	@Override
	public void updateNotice(NoticeVO notice) {
		noticeMapper.updateNotice(notice);
	}

	@Override
	public void deleteNotice(Integer notice_num) {
		//부모글 좋아요 삭제
		noticeMapper.deleteFavByNoticeNum(notice_num);
		//댓글이 존재하면 댓글을 우선 삭제하고 부모글을 삭제
		noticeMapper.deleteReplyByNoticeNum(notice_num);
		//부모글 삭제
		noticeMapper.deleteNotice(notice_num);
	}

	@Override
	public void deleteFile(Integer notice_num) {
		noticeMapper.deleteFile(notice_num);
	}

	@Override
	public NoticeFavVO selectFav(NoticeFavVO fav) {
		return noticeMapper.selectFav(fav);
	}

	@Override
	public int selectFavCount(Integer notice_num) {
		return noticeMapper.selectFavCount(notice_num);
	}

	@Override
	public void insertFav(NoticeFavVO noticeFav) {
		noticeMapper.insertFav(noticeFav);
	}

	@Override
	public void deleteFav(Integer notice_fav_num) {
		noticeMapper.deleteFav(notice_fav_num);
	}

	@Override
	public List<NoticeReplyVO> selectListReply(Map<String, Object> map) {
		return noticeMapper.selectListReply(map);
	}

	@Override
	public int selectRowCountReply(Map<String, Object> map) {
		return noticeMapper.selectRowCountReply(map);
	}

	@Override
	public NoticeReplyVO selectReply(Integer notice_re_num) {
		return noticeMapper.selectReply(notice_re_num);
	}

	@Override
	public void insertReply(NoticeReplyVO noticeReply) {
		noticeMapper.insertReply(noticeReply);
	}

	@Override
	public void updateReply(NoticeReplyVO noticeReply) {
		noticeMapper.updateReply(noticeReply);
	}

	@Override
	public void deleteReply(Integer notice_re_num) {
		noticeMapper.deleteReply(notice_re_num);
	}

	

}
