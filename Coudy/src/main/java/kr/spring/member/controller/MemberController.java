package kr.spring.member.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.AuthCheckException;

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
	
	@PostMapping("/member/registerUser.do") //valid로 vo와 properties로 유효성 체크, model로 데이터 넘기기? 
	public String submit (@Valid MemberVO memberVO, BindingResult result, Model model) {
		
		logger.debug("<<회원가입>> : " + memberVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		//회원가입
		memberService.insertMember(memberVO);
		
		model.addAttribute("accessMsg","회원가입이 완료되었습니다.");
		
		return "common/notice";
	}
	
	//=============회원로그인===============//
		//로그인 폼
		@GetMapping("/member/login.do")
		public String formLogin() {
			return "memberLogin"; 
		}
		
		//로그인 폼에서 전송된 데이터 처리
		@PostMapping("/member/login.do")
		public String submitLogin(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
			
			logger.debug("<<회원 로그인>> : " + memberVO);
			
			if(result.hasFieldErrors("id")||(result.hasFieldErrors("passwd"))) {
				return formLogin();
			}
			
			MemberVO member = null;
			
			
			try {
				member = memberService.selectCheckMember(memberVO.getId());
				
				boolean check= false;
				
				if(member!=null) {
					logger.debug("<<로그인체크 시작>>");
					check = member.isCheckedPasswd(memberVO.getPasswd());
					logger.debug("<<로그인체크 성공>>");
				}
				
				if(check) {
					
					session.setAttribute("user", member);
					
					logger.debug("<<인증성공>>");
					logger.debug("<<아이디>> : "+member.getId());

					
					return "redirect:/main/main.do";
				}
				
				throw new AuthCheckException();
				
			}catch(AuthCheckException e) {
				
				if(member!=null && member.getAuth()==1) {
					result.reject("noAuthority");
				}else {
					result.reject("invalidIdOrPassword");
				}
				
				return formLogin();
					
			}

			
		}
	
} 






















