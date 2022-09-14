package kr.spring.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;

@Controller
public class MemberController {
	
	private static final Logger logger =LoggerFactory.getLogger(MemberController.class); 
	
	@Autowired
	private MemberService memberService;
	
	//자바빈 초기화
	@ModelAttribute
	public MemberVO initMember() {    
		return new MemberVO();
	}
	
	//=================회원가입==================//
	//폼 호출
	@GetMapping("/member/registerUser.do")
	public String form() {
			//타일즈 설정의 식별자 (name)
		return "memberRegister";
	}
}
