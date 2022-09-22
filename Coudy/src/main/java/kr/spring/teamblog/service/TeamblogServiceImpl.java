package kr.spring.teamblog.service;

import java.util.List; 
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.teamblog.dao.TeamblogMapper;
import kr.spring.teamblog.vo.TeamblogFavVO;
import kr.spring.teamblog.vo.TeamblogReplyVO;
import kr.spring.teamblog.vo.TeamblogVO;

@Service
@Transactional
public class TeamblogServiceImpl implements TeamblogService {
	
	@Autowired
	private TeamblogMapper teamblogMapper;

	@Override
	public List<TeamblogVO> selectList(Map<String, Object> map) {
		return teamblogMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return teamblogMapper.selectRowCount(map);
	}

	@Override
	public void insertTeamblog(TeamblogVO teamblog) {
		teamblogMapper.insertTeamblog(teamblog);
	}

	@Override
	public TeamblogVO selectTeamblog(Integer team_num) {
		return teamblogMapper.selectTeamblog(team_num);
	}

	@Override
	public void updateHit(Integer team_num) {
		teamblogMapper.updateHit(team_num);
	}

	@Override
	public void updateTeamblog(TeamblogVO teamblog) {
		teamblogMapper.updateTeamblog(teamblog);
	}

	@Override
	public void deleteTeamblog(Integer team_num) {
		teamblogMapper.deleteFavByTeamblogNum(team_num);
		teamblogMapper.deleteReplyByTeamblogNum(team_num);
		teamblogMapper.deleteTeamblog(team_num);
	}

	@Override
	public void deleteFile(Integer team_num) {
		teamblogMapper.deleteFile(team_num);
	}

	@Override
	public TeamblogFavVO selectFav(TeamblogFavVO fav) {
		return teamblogMapper.selectFav(fav);
	}

	@Override
	public int selectFavCount(Integer team_num) {
		return teamblogMapper.selectFavCount(team_num);
	}

	@Override
	public void insertFav(TeamblogFavVO teamblogFav) {
		teamblogMapper.insertFav(teamblogFav);
	}

	@Override
	public void deleteFav(Integer team_fav_num) {
		teamblogMapper.deleteFav(team_fav_num);
	}

	@Override
	public List<TeamblogReplyVO> selectListReply(Map<String, Object> map) {
		return teamblogMapper.selectListReply(map);
	}

	@Override
	public int selectRowCountReply(Map<String, Object> map) {
		return teamblogMapper.selectRowCountReply(map);
	}

	@Override
	public TeamblogReplyVO selectReply(Integer team_re_num) {
		return teamblogMapper.selectReply(team_re_num);
	}

	@Override
	public void insertReply(TeamblogReplyVO teamblogReply) {
		teamblogMapper.insertReply(teamblogReply);
	}

	@Override
	public void updateReply(TeamblogReplyVO teamblogReply) {
		teamblogMapper.updateReply(teamblogReply);
	}

	@Override
	public void deleteReply(Integer team_re_num) {
		teamblogMapper.deleteReply(team_re_num);
	}
	
	

}
