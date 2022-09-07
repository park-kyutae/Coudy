package kr.spring.techblog.service;

import java.util.List;
import java.util.Map;

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
}
