package kr.spring.techblog.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.vo.MemberVO;
import kr.spring.techblog.service.TechblogService;
import kr.spring.techblog.vo.TechblogFavVO;
import kr.spring.util.PagingUtil;

@Controller
public class techblogAjaxController {
	private static final Logger logger =
			LoggerFactory.getLogger(techblogAjaxController.class);
	
	private int rowCount = 10;
	private int pageCount = 10;
	
	@Autowired
	private TechblogService techblogService;
	
	//===========부모글 업로드 파일 삭제===========//
	@RequestMapping("/techblog/deleteFile.do")
	@ResponseBody
	public Map<String,String> processFile(
			         @RequestParam int tech_num,
			                HttpSession session){
		Map<String,String> mapJson = 
				new HashMap<String,String>();
		
		MemberVO user = 
			   (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			techblogService.deleteFile(tech_num);
			mapJson.put("result", "success");
		}
		
		return mapJson;
	}
	
	//==========부모글 좋아요============//
		//부모글 좋아요 등록
		@RequestMapping("/techblog/writeFav.do")
		@ResponseBody
		public Map<String,Object> writeFav(
				             TechblogFavVO fav,
				             HttpSession session){
			logger.debug("<<부모글 좋아요 등록>> : " + fav);
			
			Map<String,Object> mapJson= 
					new HashMap<String,Object>();
			
			MemberVO user = 
					(MemberVO)session.getAttribute("user");
			if(user==null) {
				mapJson.put("result", "logout");
			}else {
				//로그인된 회원번호 셋팅
				fav.setMem_num(user.getMem_num());
				
				//기존에 등록된 좋아요 확인
				TechblogFavVO techFav = 
						techblogService.selectFav(fav);
				
				if(techFav!=null) {//등록된 좋아요 정보가 있는 경우
					techblogService.deleteFav(techFav.getTech_fav_num());
					
					mapJson.put("result", "success");
					mapJson.put("status", "noFav");
					mapJson.put("count", techblogService.selectFavCount(
							                      fav.getTech_num()));
					
				}else {//등록된 좋아요 정보가 없는 경우
					techblogService.insertFav(fav);
					
					mapJson.put("result", "success");
					mapJson.put("status", "yesFav");
					mapJson.put("count", techblogService.selectFavCount(
							                    fav.getTech_num()));
				}
			}
			return mapJson;
		}
		//부모글 좋아요 읽기
		@RequestMapping("/techblog/getFav.do")
		@ResponseBody
		public Map<String,Object> getFav(
				         TechblogFavVO fav,
				         HttpSession session){
			
			logger.debug("<<게시판 좋아요 읽기>> : " + fav);
			
			Map<String,Object> mapJson = 
					new HashMap<String,Object>();
			
			MemberVO user = 
				  (MemberVO)session.getAttribute("user");
			if(user==null) {//로그인이 되지 않은 경우
				mapJson.put("status", "noFav");
				mapJson.put("count", techblogService.selectFavCount(
						                     fav.getTech_num()));
			}else {//로그인 된 경우
				fav.setMem_num(user.getMem_num());
				
				//등록된 좋아요 정보 읽기
				TechblogFavVO techFav = techblogService.selectFav(fav);
				
				if(techFav!=null) {//좋아요 등록
					mapJson.put("status", "yesFav");
					mapJson.put("count", techblogService.selectFavCount(
							                     fav.getTech_num()));
				}else {//좋아요 미등록
					mapJson.put("status", "noFav");
					mapJson.put("count", techblogService.selectFavCount(
							                     fav.getTech_num()));
				}
			}
			return mapJson;		
		}
}





