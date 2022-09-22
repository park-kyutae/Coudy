package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping("/member/confirmId.do")
	@ResponseBody //ajax로 보내는애들은 꼭 필요함
	public Map<String,String> process(@RequestParam String id){
		
		logger.debug("<<id중복체크1>> : " + id);
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		logger.debug("<<id중복체크2>> : " + id);

		MemberVO member = memberService.selectCheckMember(id);
		logger.debug("<<id중복체크3>> : " + member);

		if(member!=null) {
			//아이디 중복
			logger.debug("<<id중복됨!!!!!!>> : " + member);
			mapAjax.put("result", "duplicated");
			
		}else {
			//아이디 미중복
			logger.debug("<<id중복체크 통과!!!!!!!>> : " + member);
			mapAjax.put("result", "good");
			
		}
		return mapAjax;
	}
	

	
	
	
	
//	@RequestMapping("member/noChangeId.do")
//	@ResponseBody
//	public Map<String,String> noChangeId(@RequestParam String id, HttpSession session){
//	
//		Map<String,String> mapAjax = new HashMap<String, String>();
//	
//		MemberVO user = (MemberVO)session.getAttribute("user");
//				
//		MemberVO member = memberService.selectCheckMember(user.getId());
//		logger.debug("아이디넘어옴?"+id);
//		if(user.getId()==id) {
//			logger.debug("아이디 변동 없음");
//			//아이디 변동 없음 
//			mapAjax.put("result", "noChanged");
//		}if(user.getId()!=id) {
//			logger.debug("아이디 변동 있음");
//			mapAjax.put("result", "changed");
//		}
//		
//		
//		return mapAjax;
//	}
	
	
}
