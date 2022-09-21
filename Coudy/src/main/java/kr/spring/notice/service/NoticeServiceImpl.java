package kr.spring.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.notice.dao.NoticeMapper;
import kr.spring.notice.vo.NoticeFavVO;
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
		// TODO Auto-generated method stub
		
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

	

}
