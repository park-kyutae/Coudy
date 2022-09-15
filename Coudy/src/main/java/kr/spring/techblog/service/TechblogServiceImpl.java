package kr.spring.techblog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.techblog.dao.TechblogMapper;
import kr.spring.techblog.vo.TechblogFavVO;
import kr.spring.techblog.vo.TechblogVO;

@Service
@Transactional
public class TechblogServiceImpl implements TechblogService{

	@Autowired
	private TechblogMapper techblogmapper;

	@Override
	public List<TechblogVO> selectList(Map<String, Object> map) {
		return techblogmapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return techblogmapper.selectRowCount(map);
	}

	@Override
	public void insertTechblog(TechblogVO techblog) {
		techblogmapper.insertTechblog(techblog);
	}

	@Override
	public TechblogVO selectTechblog(Integer tech_num) {
		return techblogmapper.selectTechblog(tech_num);
	}

	@Override
	public void updateTechblogHit(Integer tech_num) {
		techblogmapper.updateTechblogHit(tech_num);
	}

	@Override
	public void updateTechblog(TechblogVO techblog) {
		techblogmapper.updateTechblog(techblog);
	}

	@Override
	public void deleteTechblog(Integer tech_num) {
		techblogmapper.deleteFavByTechblogNum(tech_num);
		techblogmapper.deleteTechblog(tech_num);
	}

	@Override
	public void deleteFile(Integer tech_num) {
		techblogmapper.deleteFile(tech_num);
	}

	@Override
	public TechblogFavVO selectFav(TechblogFavVO fav) {
		return techblogmapper.selectFav(fav);
	}

	@Override
	public int selectFavCount(Integer tech_num) {
		return techblogmapper.selectFavCount(tech_num);
	}

	@Override
	public void insertFav(TechblogFavVO techblogFav) {
		techblogmapper.insertFav(techblogFav);
	}

	@Override
	public void deleteFav(Integer tech_fav_num) {
		techblogmapper.deleteFav(tech_fav_num);
	}
	
	

}
