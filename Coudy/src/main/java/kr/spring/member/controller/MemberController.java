package kr.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.AuthCheckException;
import kr.spring.util.FileUtil;
import kr.spring.util.PagingUtil;  

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
		
		model.addAttribute("message","회원가입이 완료되었습니다.");
		model.addAttribute("url","/");
		
		return "common/resultView";
	}
	
//	//=======================로그인 유효성 체크===========================//
//	@RequestMapping("/member/loginSubmit.do")
//	@ResponseBody
//	public ModelAndView loginValid(@RequestParam String id, @RequestParam String passwd, HttpSession session){
//		
//		Map<String, String> mapAjax = new HashMap<String, String>();
//		
//		ModelAndView mav = new ModelAndView();
//		
//		
//		MemberVO member =null;
//		member = memberService.selectCheckMember(id);
//		
//		boolean check = false;
//		
//		if(member != null) {
//			check = member.isCheckedPasswd(passwd);
//		}
//		
//		if(member == null) {
//			mav.addObject("result", "hasNoData");
//			formLogin();
//			logger.debug("<<hasNoData로 들어옴 >>" + member+" ::::::: "+id+"::::"+passwd);
//		}
//		
//		if(!check) {
//			mav.addObject("result", "checkedFail");
//			formLogin();
//			logger.debug("<<checkedFail로 들어옴 >>" + member+" ::::::: "+id+"::::"+passwd);
//			
//		}
//		
//		if(check) {
//			mav.addObject("result", "success");
//			session.setAttribute("user", member);
//			mav.setViewName("/main/main.do");
//			logger.debug("<<success로 들어옴 >>" + member+" ::::::: "+id+"::::"+passwd);
//			
//		}
//		
//		
//		
//		return mav;
//		
//	}
	
	//=============회원로그인===============//
		//로그인 폼
		@GetMapping("/member/login.do")
		public String formLogin() {
			return "memberLogin"; 
		}
		
//		//=======================로그인 유효성 체크===========================//
//		@RequestMapping("/member/loginSubmit.do")
//		@ResponseBody
//		public ModelAndView loginValid(@RequestParam String id, @RequestParam String passwd, HttpSession session){
//			
//			Map<String, String> mapAjax = new HashMap<String, String>();
//			
//			ModelAndView mav = new ModelAndView();
//			
//			
//			MemberVO member =null;
//			member = memberService.selectCheckMember(id);
//			
//			boolean check = false;
//			
//			if(member != null) {
//				check = member.isCheckedPasswd(passwd);
//			}
//			
//			if(member == null) {
//				mav.addObject("result", "hasNoData");
//				formLogin();
//				logger.debug("<<hasNoData로 들어옴 >>" + member+" ::::::: "+id+"::::"+passwd);
//			}
//			
//			if(!check) {
//				mav.addObject("result", "checkedFail");
//				formLogin();
//				logger.debug("<<checkedFail로 들어옴 >>" + member+" ::::::: "+id+"::::"+passwd);
//				
//			}
//			
//			if(check) {
//				mav.addObject("result", "success");
//				session.setAttribute("user", member);
//				mav.setViewName("/main/main.do");
//				logger.debug("<<success로 들어옴 >>" + member+" ::::::: "+id+"::::"+passwd);
//				
//			}
//			
//			
//			
//			return mav;
//			
//		}
	
	//==================================================================================//	
		
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
			model.addAttribute("user",user);
			
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
		public String submitUpdate(@Valid MemberVO memberVO, BindingResult result, HttpSession session, Model model) {
			
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
			
			model.addAttribute("message","수정이 완료되었습니다!");
			model.addAttribute("url","/member/myPage.do");
			
			return "common/resultView";
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
	
	@PostMapping("/member/changePassword.do")
	public String submitChangePassword(
										@Valid MemberVO memberVO,
										BindingResult result,
										Model model,
										HttpSession session,
										HttpServletRequest request) {
		
		logger.debug("<<비밀번호 변경>>");
		
		//유효성 체크
		//now_password, password만 처리
		if(result.hasFieldErrors("now_passwd") || result.hasFieldErrors("passwd")) {
			return formChangePassword();
		}
		
		//세션에서 user값 가져오기
		MemberVO user =	 (MemberVO)session.getAttribute("user");
		memberVO.setMem_num(user.getMem_num());
		
		//비밀번호 일치여부 체크 위해서 회원정보 호출
		MemberVO db_member = memberService.selectMember(memberVO.getMem_num());
		
		//폼에서 전송한 현재 비밀번호와 DB에서 받아온 현재 비밀번호 일치 여부 체크
		if(db_member.getPasswd().equals(user.getPasswd())) {
			//rejectValue(String field, Strig ErrorCode, String defaultMessage) : 
								//필드에 대한 에러코드를 추가 에러코드에 대한 메세지가 존재하지 않을 경우 defaultMessage를 사용
			result.rejectValue("now_passwd", "invalidPassword");
		}
		
		//비밀번호 변경
		memberService.updatePasswd(memberVO);
		
		//View에서 표시할 메세지
		model.addAttribute("message", "비밀번호 변경 완료");
		
		//url을 보내? 왜?
		model.addAttribute("url", request.getContextPath()+"/member/myPage.do");
		
		
		
		return "common/resultView";
		
	}
	
	//===================관리자=======================//
	//회원관리
	
	@RequestMapping("/member/admin_list.do")
	public ModelAndView formAdminList( @RequestParam(value="pageNum",defaultValue="1")
										int currentPage,
									   @RequestParam(value="keyfield",defaultValue="")
										String keyfield,
									   @RequestParam(value="keyword", defaultValue="")
									    String keyword) {

		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//총 글의 개수 또는 검색된 글의 개수
		int count = memberService.selectRowCount(map);
		
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, 20, 10, "admin_list.do");
		
		map.put("start", page.getStartRow());
		map.put("end", page.getEndRow());
		
		List<MemberVO> list=null;
		
		if(count >0) {
			list = memberService.selectList(map); 
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//회원관리-수정
	@GetMapping("/member/admin_update.do")
	public String form(@RequestParam int mem_num, Model model) {
		
		MemberVO memberVO = memberService.selectMember(mem_num);
		
		model.addAttribute("memberVO",memberVO); //jsp ModelAttribute값과 이름이 똑같아야함
		
		return "admin_memberModify";
	}
	
	@PostMapping("/member/admin_update.do")
	public String submit(MemberVO member, Model model,  HttpServletRequest request) {
		
		//service로 회원정보 수정
		memberService.updateByAdmin(member);
		
		logger.debug("<<관리자 회원정보 수정>>"+member);
		
		//view에 표시될 메세지?
		model.addAttribute("message","수정이 완료되었습니다.");
		model.addAttribute("url",request.getContextPath()+"/member/admin_update.do?mem_num="+member.getMem_num());
		
		return "/member/resultModifyMember";
	}
		
	
} 
 





















