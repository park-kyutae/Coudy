package kr.spring.techblog.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.techblog.vo.TechblogFavVO;
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
}
