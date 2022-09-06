package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;

@Controller
public class MemberAjaxController {

	private static final Logger logger= LoggerFactory.getLogger(MemberAjaxController.class);
	
	@Autowired
	private MemberService memberService;
	
	//프로필 사진 수정
	@RequestMapping("/member/updateMyPhoto.do")
	@ResponseBody //클라이언트-서버 통신을 위해 json 형식의 데이터를 주고받는 [비동기 통신]
	public Map<String, String> processProfile( MemberVO memberVO, HttpSession session){ 
		//json 형태의 데이터를 받기				//멤버값(session의 num을 가져와서 memberVO가져오기 위한 값의 세팅)
											//session으로 num값을 가져오기 
		
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapAjax.put("result", "logout");
			
		}else {
			logger.debug("<<memberAjax진입 >>" +memberVO);
			
			memberVO.setMem_num(user.getMem_num());
			
			logger.debug("<<memberAjax진입 >>" +memberVO);

			memberService.updateProfile(memberVO);
		
			
			mapAjax.put("result", "success");

		}
		
		return mapAjax;
		
	}
	
	
	
}
