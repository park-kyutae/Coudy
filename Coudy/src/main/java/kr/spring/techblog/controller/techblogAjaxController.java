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
}





