package kr.spring.member.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.AuthCheckException;
import kr.spring.util.FileUtil;  

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
				logger.debug("<<try 멤버  >> : " + memberVO);
				logger.debug("<<try 멤버  >> : " + member);

				
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
				logger.debug("<<뭔가 잘못됨 >>");
				return formLogin();//
					
			}

			
		}
		
		//==============로그아웃===============//
		@RequestMapping("/member/logout.do")
		public String logout(HttpSession session) {
			session.invalidate();
			
			return "redirect:/main/main.do";
		}
		
		//=================myPage==============//
		@GetMapping("/member/myPage.do")
		public String myPage(HttpSession session, Model model) {
			
			//유저정보 가져오기
			MemberVO user = (MemberVO)session.getAttribute("user");
			
			//한 건의 레코드 읽어오기
			MemberVO member = memberService.selectMember(user.getMem_num());
			logger.debug("<<한건의 레코드 읽어오기 >> :"+member);
			
			//request에 참조할 수 있도록 함  -->?
			model.addAttribute("member",member);
			
			return "memberMyPage";
		}
		
		//프로필 사진 출력(로그인 전용)
		@RequestMapping("/member/photoView.do")
		public ModelAndView getProfile(HttpSession session, HttpServletRequest request) {
			
			ModelAndView mav = new ModelAndView();
			
			MemberVO user = (MemberVO)session.getAttribute("user");
			
			//로그인이 안된경우
			if(user==null) {
				byte[] readbyte = 
						FileUtil.getBytes(
				     request.getServletContext().getRealPath(
						          "/image_bundle/face.png"));
				mav.addObject("imageFile", readbyte);
				mav.addObject("filename", "face.png");
				mav.setViewName("imageView");
				
			}else { //로그인이 된 경우
				MemberVO memberVO = memberService.selectMember(user.getMem_num());
				viewProfile(memberVO,request,mav);
			}
			
			return mav;
		}
		//프로필 사진 출력(회원번호 지정)
		@RequestMapping("/member/viewProfile.do")
		public ModelAndView getProfileByMem_num(
				          @RequestParam int mem_num,
				          HttpSession session,
				          HttpServletRequest request) {
			
			ModelAndView mav = new ModelAndView();
			
			MemberVO memberVO = memberService.selectMember(mem_num);
			
			viewProfile(memberVO,request,mav);
			
			return mav;
		}

		//이미지 처리 공통 코드 
		private void viewProfile(MemberVO memberVO, HttpServletRequest request, ModelAndView mav) {
			if(memberVO.getPhoto_name()==null) {//업로드한 프로필 사진이 없다는 것 
				byte[] readbyte 												//왜 이미지번들이지?
					= FileUtil.getBytes(request.getServletContext().getRealPath("/image_bundle/face.png"));
				mav.addObject("imageFile", readbyte);
				mav.addObject("filename", "face.png");
			}else {
				//업로드한 프로필 사진이 있음
				mav.addObject("imageFile", memberVO.getPhoto());
				mav.addObject("filename", memberVO.getPhoto_name());
			}
			//뷰 이름 지정
			mav.setViewName("imageView");
		}
		
		

		//===============정보수정==================//
		@GetMapping("/member/updateUser.do")
		public String updateUser(HttpSession session, Model model) { //세션값과 데이터를 받으면  됨
			
			MemberVO user = (MemberVO)session.getAttribute("user"); 
			
			MemberVO memberVO =  memberService.selectMember(user.getMem_num());
			
			model.addAttribute("memberVO",memberVO);
			
			
			return "memberModify";
		}
		@PostMapping("member/updateUser.do")
		public String submitUpdate(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
			
			logger.debug("<<회원정보수정 처리>> : " + memberVO);
			
			//유효성 체크 결과 오류가 있으면 폼 호출
			if(result.hasErrors()) {
				return "memberModify";
			}
			
			//전송되지 않은 회원번호를 세션에서 추출
			MemberVO user = 
					(MemberVO)session.getAttribute("user");
			memberVO.setMem_num(user.getMem_num());
			
			//회원정보수정
			memberService.updateMember(memberVO);
			
			return "redirect:/member/myPage.do";
		}
		
	//==============회원 탈퇴================
	@GetMapping("/member/delete.do")
	public String formDelete() {
		return "memberDelete";
	}
		
	@PostMapping("/member/delete.do")
	public String submitDelete( @Valid MemberVO memberVO,
								BindingResult result,
								Model model,
								HttpSession session) {
		
		logger.debug("<<회원탈퇴 >> : " + memberVO);
		
		if(result.hasFieldErrors("id") || result.hasFieldErrors("passwd")) {
			return formDelete(); 
		}
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		memberVO.setMem_num(user.getMem_num());
		
		try {
			//로그인한 회원의 아이디 구하기
			MemberVO db_member = memberService.selectMember(memberVO.getMem_num());
			
			boolean check = false;
			
			//로그인한 회원 아이디와 입력한 아이디 대조
			if(db_member!=null && memberVO.getId().equals(db_member.getId())) {
				
				//비밀번호 일치여부 체크
				check = db_member.isCheckedPasswd(memberVO.getPasswd());
				
			}
			//인증성공
			if(check){
				//회원정보 삭제
				memberService.deleteMember(memberVO.getMem_num());
				
				//로그아웃
				session.invalidate();
				
				model.addAttribute("accessMsg", "회원탈퇴를 완료했습니다.");
				return "common/notice";
				
			}
			
			//인증실패
			throw new AuthCheckException();
		}catch(AuthCheckException e) {
			return formDelete();
		}
		
	}
	
	//===========비밀번호 변경===========//
	@GetMapping("/member/changePassword.do")
	public String formChangePassword() {
		return "memberChangePassword";
	}
		
		
	
} 
 





















