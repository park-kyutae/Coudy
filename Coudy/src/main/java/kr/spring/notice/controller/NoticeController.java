package kr.spring.notice.controller;

import java.util.HashMap; 

import java.util.List;
import java.util.Map;

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

import kr.spring.member.vo.MemberVO;
import kr.spring.notice.service.NoticeService;
import kr.spring.notice.vo.NoticeVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	private int rowCount=20;
	private int pageCount=10;
	
	@Autowired
	private NoticeService noticeService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public NoticeVO initCommand() {
		return new NoticeVO();
	}
	
	//========공지 글 등록========//
	//등록 폼
	@GetMapping("/notice/write.do")
	public String form() {
		return "noticeWrite";
	}
	//등록폼에서 전송된 데이터 처리
	@PostMapping("/notice/write.do")
	public String submit(@Valid NoticeVO noticeVO,BindingResult result,HttpServletRequest request,HttpSession session,Model model) {
		
		logger.debug("<<공지게시판 글 저장>> : "+noticeVO);
		
		//유효성 검사 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//회원번호 셋팅
		noticeVO.setMem_num(user.getMem_num());
		//ip셋팅
		noticeVO.setNotice_ip(request.getRemoteAddr());
		
		//글쓰기
		noticeService.insertNotice(noticeVO);
		
		//View에 표시할 메시지
		model.addAttribute("message","공지 등록이 완료되었습니다.");
		
		model.addAttribute("url",request.getContextPath()+"/notice/list.do");
		
		return "common/resultView";
		
	}
	
	
	//========공지 글 목록=======//
	@RequestMapping("/notice/list.do")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
								@RequestParam(value="keyfield",defaultValue="") String keyfield,
								@RequestParam(value="keyword",defaultValue="") String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//글의 총 개수(검색된 글의 개수)
		int count=noticeService.selectRowCount(map);
		
		logger.debug("<<count>> : "+count);
		
		//페이지 처리
		PagingUtil page=new PagingUtil(keyfield,keyword,currentPage,count,rowCount,pageCount,"list.do");
		
		List<NoticeVO> list=null;
		if(count>0) {
			
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list=noticeService.selectList(map);
		}
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("noticeList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//===========공지 글 상세===============//
	@RequestMapping("/notice/detail.do")
	public ModelAndView detail(@RequestParam int notice_num) {
		
		logger.debug("<<board_num>> : "+notice_num);
		
		//해당 글의 조회수 증가
		noticeService.updateHit(notice_num);
		
		NoticeVO notice = noticeService.selectNotice(notice_num);
		
		//제목에 태그를 허용하지 않음
		notice.setNotice_title(StringUtil.useNoHtml(notice.getNotice_title()));
		
		return new ModelAndView("noticeView","notice",notice);
		
	}
	
	//================파일 다운로드================//
	@RequestMapping("/notice/file.do")
	public ModelAndView download(@RequestParam int notice_num) {
		
		NoticeVO notice=noticeService.selectNotice(notice_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("downloadView");
		mav.addObject("downloadFile", notice.getNotice_uploadfile());
		
		mav.addObject("filename",notice.getNotice_filename());
		
		return mav;
	}
	
	//==========이미지 출력============//
	@RequestMapping("/notice/imageView.do")
	public ModelAndView viewImage(@RequestParam int notice_num,@RequestParam int notice_type) {
		
		NoticeVO notice = noticeService.selectNotice(notice_num);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("imageView");
		
		if(notice_type==1) {//프로필 사진
			mav.addObject("imageFile",notice.getPhoto());
			mav.addObject("filename",notice.getPhoto_name());
		}else if(notice_type==2) {//보여주는 사진 수
			mav.addObject("imageFile",notice.getNotice_uploadfile());
			mav.addObject("filename",notice.getNotice_filename());
		}
		return mav;
	}
	
	//=============게시판 글 수정=============//
	//수정 폼
	@GetMapping("/notice/update.do")
	public String formUpdate(@RequestParam int notice_num, Model model) {
		
		NoticeVO noticeVO = noticeService.selectNotice(notice_num);
		
		model.addAttribute("noticeVO",noticeVO);
		
		return "noticeModify";
	}
	
	//수정 폼에서 전송된 데이터 처리
	@PostMapping("/notice/update.do")
	public String submitUpdate(@Valid NoticeVO noticeVO,BindingResult result,HttpServletRequest request,Model model) {

		logger.debug("<<글수정>> : " +noticeVO);

		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			//title 또는 content가 입력되지 않아 유효성 체크에 걸리면 파일 정보를 잃어버리기 때문에 폼을 호출할 때 다시 셋팅해주어야 함.
			NoticeVO vo = noticeService.selectNotice(noticeVO.getNotice_num());
			noticeVO.setNotice_filename(vo.getNotice_filename());
			return "noticeModify";
		}

		//ip셋팅
		noticeVO.setNotice_ip(request.getRemoteAddr());
		//글수정
		noticeService.updateNotice(noticeVO);

		//View에 표시할 메시지
		model.addAttribute("message","글수정 완료!!");
		model.addAttribute("url",request.getContextPath()+"/notice/detail.do?notice_num="+noticeVO.getNotice_num());

		return "common/resultView";
	}
	
	//========공지글 삭제==========//
	@RequestMapping("/notice/delete.do")
	public String submitDelete(
			@RequestParam int notice_num,
			Model model,
			HttpServletRequest request) {
		
		logger.debug("<<글 삭제>> : "+notice_num);
		
		//글 삭제 
		noticeService.deleteNotice(notice_num);
		
		//View에 표시할 메시지
		model.addAttribute("message", "글 삭제 완료!!");
		model.addAttribute("url",request.getContextPath()+"/notice/list.do");
		
		return "common/resultView";
	}

}



































