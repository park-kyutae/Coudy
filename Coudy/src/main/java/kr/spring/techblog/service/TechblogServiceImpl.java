package kr.spring.techblog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.techblog.dao.TechblogMapper;
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
		techblogmapper.deleteTechblog(tech_num);
	}

	@Override
	public void deleteFile(Integer tech_num) {
		techblogmapper.deleteFile(tech_num);
	}
	
	

}
