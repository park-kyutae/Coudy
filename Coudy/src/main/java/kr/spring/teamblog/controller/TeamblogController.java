package kr.spring.teamblog.controller;

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
import kr.spring.notice.vo.NoticeVO;
import kr.spring.teamblog.service.TeamblogService;
import kr.spring.teamblog.vo.TeamblogVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;


@Controller
public class TeamblogController {
	private static final Logger logger = LoggerFactory.getLogger(TeamblogController.class);
	
	private int rowCount = 20;
	private int pageCount=10;
	
	@Autowired
	private TeamblogService teamblogService;
	
	//자바빈 초기화
	@ModelAttribute
	public TeamblogVO initCommand() {
		return new TeamblogVO();
	}
	
	//==============블로그 글 등록===============//
	//등록 폼
	@GetMapping("/teamblog/write.do")
	public String form() {
		return "teamblogWrite";
	}
	
	@PostMapping("/teamblog/write.do")
	public String submit(@Valid TeamblogVO teamblogVO,BindingResult result,HttpServletRequest request,HttpSession session,Model model) {
		
		logger.debug("<<팀블로그 글 저장>> : "+teamblogVO);
		
		if(result.hasErrors()) {
			return form();
		}
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		teamblogVO.setMem_num(user.getMem_num());
		
		teamblogVO.setTeam_ip(request.getRemoteAddr());
		
		teamblogService.insertTeamblog(teamblogVO);
		
		model.addAttribute("message","공지 등록이 완료되었습니다.");
		
		model.addAttribute("url",request.getContextPath()+"/teamblog/list.do");
		
		return "common/resultView";
	}
	//==========팀 블로그목록========//
	
	@RequestMapping("/teamblog/list.do")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
								@RequestParam(value="keyfield",defaultValue="") String keyfield,
								@RequestParam(value="keyword",defaultValue="") String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//글의 총 개수(검색된 글의 개수)
		int count=teamblogService.selectRowCount(map);
		
		logger.debug("<<count>> : "+count);
		
		//페이지 처리
		PagingUtil page=new PagingUtil(keyfield,keyword,currentPage,count,rowCount,pageCount,"list.do");
		
		List<TeamblogVO> list=null;
		if(count>0) {
			
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list=teamblogService.selectList(map);
		}
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("teamblogList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//===========팀블로그 글 상세============//
	@RequestMapping("/teamblog/detail.do")
	public ModelAndView detail(@RequestParam int team_num) {
		
		logger.debug("<<team_num>>:"+team_num);
		
		teamblogService.updateHit(team_num);
		
		TeamblogVO teamblog = teamblogService.selectTeamblog(team_num);
		
		teamblog.setTeam_title(StringUtil.useNoHtml(teamblog.getTeam_title()));
		
		return new ModelAndView("teamblogView","teamblog",teamblog);
	}
	
	//================팀블로그 파일 다운로드================//
	@RequestMapping("/teamblog/file.do")
	public ModelAndView download(@RequestParam int team_num) {
		
		TeamblogVO teamblog=teamblogService.selectTeamblog(team_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("downloadView");
		mav.addObject("downloadFile", teamblog.getTeam_uploadfile());
		
		mav.addObject("filename",teamblog.getTeam_filename());
		
		return mav;
	}
	
	
	//==========팀블로그 이미지 출력============//
	@RequestMapping("/teamblog/imageView.do")
	public ModelAndView viewImage(@RequestParam int team_num,@RequestParam int teamblog_type) {

		TeamblogVO teamblog = teamblogService.selectTeamblog(team_num);

		ModelAndView mav = new ModelAndView();

		mav.setViewName("imageView");

		if(teamblog_type==1) {//프로필 사진
			mav.addObject("imageFile",teamblog.getPhoto());
			mav.addObject("filename",teamblog.getPhoto_name());
		}else if(teamblog_type==2) {//보여주는 사진 수
			mav.addObject("imageFile",teamblog.getTeam_uploadfile());
			mav.addObject("filename",teamblog.getTeam_filename());
		}
		return mav;
	}

	//=============팀블로그 글 수정=============//
	//수정 폼
	@GetMapping("/teamblog/update.do")
	public String formUpdate(@RequestParam int team_num, Model model) {
		
		TeamblogVO teamblogVO = teamblogService.selectTeamblog(team_num);
		
		model.addAttribute("teamblogVO",teamblogVO);
		
		return "teamblogModify";
	}
	
	//수정 폼에서 전송된 데이터 처리
	@PostMapping("/teamblog/update.do")
	public String submitUpdate(@Valid TeamblogVO teamblogVO,BindingResult result,HttpServletRequest request,Model model) {

		logger.debug("<<팀블로그수정>> : " +teamblogVO);

		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			//title 또는 content가 입력되지 않아 유효성 체크에 걸리면 파일 정보를 잃어버리기 때문에 폼을 호출할 때 다시 셋팅해주어야 함.
			TeamblogVO vo = teamblogService.selectTeamblog(teamblogVO.getTeam_num());
			teamblogVO.setTeam_filename(vo.getTeam_filename());
			return "teamblogModify";
		}

		//ip셋팅
		teamblogVO.setTeam_ip(request.getRemoteAddr());
		//글수정
		teamblogService.updateTeamblog(teamblogVO);

		//View에 표시할 메시지
		model.addAttribute("message","글수정 완료!!");
		model.addAttribute("url",request.getContextPath()+"/teamblog/detail.do?team_num="+teamblogVO.getTeam_num());

		return "common/resultView";
	}
	
	//===========팀블로그 글삭제===========//
	@RequestMapping("/teamblog/delete.do")
	public String submitDelete(
			@RequestParam int team_num,
			Model model, HttpServletRequest request) {
		
		logger.debug("<<팀블로그 삭제>> : "+team_num);
		
		//글 삭제
		teamblogService.deleteTeamblog(team_num);
		
		//View에 표시할 메시지
		model.addAttribute("message","글 삭제 완료");
		model.addAttribute("url",request.getContextPath()+"/teamblog/list.do");
		
		return "common/resultView";
	}
		
}

