package kr.spring.techblog.controller;

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
import kr.spring.techblog.service.TechblogService;
import kr.spring.techblog.vo.TechblogVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;


@Controller
public class TechblogController {
	private static final Logger logger =
	         LoggerFactory.getLogger(
			          TechblogController.class);
	private int rowCount = 20;
	private int pageCount = 10;
	
	@Autowired
	private TechblogService techblogService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public TechblogVO initCommand() {
		return new TechblogVO();
	}
	//===========게시판 글 등록============//
	//등록 폼
	@GetMapping("/techblog/techblogWrite.do")
	public String form() {
		return "techblogWrite";
	}
	//등록 폼에서 전송된 데이터 처리
	@PostMapping("/techblog/techblogWrite.do")
	public String submit(@Valid TechblogVO techblogVO,
										BindingResult result,
										HttpServletRequest request,
										HttpSession session,
										Model model) {
		logger.debug("<<기술블로그 글 저장>> : "+techblogVO);
		
		//유효성 검사 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		MemberVO user = 
				(MemberVO)session.getAttribute("user");
		//회원번호 셋팅
		techblogVO.setMem_num(user.getMem_num());
		
		//글쓰기 
		techblogService.insertTechblog(techblogVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "글 등록이 완료되었습니다.");
		model.addAttribute(
				 "url", request.getContextPath()+"/techblog/techblogList.do");
		
		return "common/resultView";
	}

	//===========게시판 글 목록============//
		@RequestMapping("/techblog/techblogList.do")
		public ModelAndView process(
				@RequestParam(value="pageNum",defaultValue="1") 
				int currentPage,
				@RequestParam(value="keyfield",defaultValue="")
				String keyfield,
				@RequestParam(value="keyword",defaultValue="")
				String keyword) {
			
			Map<String,Object> map = 
					    new HashMap<String,Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			
			//글의 총개수(검색된 글의 개수)
			int count = techblogService.selectRowCount(map);
			
			logger.debug("<<count>> : " + count);
			
			//페이지 처리
			PagingUtil page = 
					new PagingUtil(keyfield,keyword,
							currentPage,count,
							rowCount,pageCount,"techblogList.do");
			
			List<TechblogVO> list = null;
			if(count > 0) {
				
				map.put("start", page.getStartRow());
				map.put("end", page.getEndRow());
				
				list = techblogService.selectList(map);
			}
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("techblogList");
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("page", page.getPage());
			
			return mav;
		}
		//===========게시판 글 A목록============//
		@RequestMapping("/techblog/techblogListA.do")
		public ModelAndView processA(
				@RequestParam(value="pageNum",defaultValue="1") 
				int currentPage,
				@RequestParam(value="keyfield",defaultValue="")
				String keyfield,
				@RequestParam(value="keyword",defaultValue="")
				String keyword) {
			
			Map<String,Object> map = 
					    new HashMap<String,Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			
			//글의 총개수(검색된 글의 개수)
			int count = techblogService.selectRowCount(map);
			
			logger.debug("<<count>> : " + count);
			
			//페이지 처리
			PagingUtil page = 
					new PagingUtil(keyfield,keyword,
							currentPage,count,
							rowCount,pageCount,"techblogListA.do");
			
			List<TechblogVO> listA = null;
			if(count > 0) {
				
				map.put("start", page.getStartRow());
				map.put("end", page.getEndRow());
				
				listA = techblogService.selectListA(map);
			}
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("techblogListA");
			mav.addObject("count", count);
			mav.addObject("listA", listA);
			mav.addObject("page", page.getPage());
			
			return mav;
		}		
		//===========게시판 글 B목록============//
				@RequestMapping("/techblog/techblogListB.do")
				public ModelAndView processB(
						@RequestParam(value="pageNum",defaultValue="1") 
						int currentPage,
						@RequestParam(value="keyfield",defaultValue="")
						String keyfield,
						@RequestParam(value="keyword",defaultValue="")
						String keyword) {
					
					Map<String,Object> map = 
							    new HashMap<String,Object>();
					map.put("keyfield", keyfield);
					map.put("keyword", keyword);
					
					//글의 총개수(검색된 글의 개수)
					int count = techblogService.selectRowCount(map);
					
					logger.debug("<<count>> : " + count);
					
					//페이지 처리
					PagingUtil page = 
							new PagingUtil(keyfield,keyword,
									currentPage,count,
									rowCount,pageCount,"techblogListB.do");
					
					List<TechblogVO> listB = null;
					if(count > 0) {
						
						map.put("start", page.getStartRow());
						map.put("end", page.getEndRow());
						
						listB = techblogService.selectListB(map);
					}
					
					ModelAndView mav = new ModelAndView();
					mav.setViewName("techblogListB");
					mav.addObject("count", count);
					mav.addObject("listB", listB);
					mav.addObject("page", page.getPage());
					
					return mav;
				}
				//===========게시판 글 C목록============//
				@RequestMapping("/techblog/techblogListC.do")
				public ModelAndView processC(
						@RequestParam(value="pageNum",defaultValue="1") 
						int currentPage,
						@RequestParam(value="keyfield",defaultValue="")
						String keyfield,
						@RequestParam(value="keyword",defaultValue="")
						String keyword) {
					
					Map<String,Object> map = 
							    new HashMap<String,Object>();
					map.put("keyfield", keyfield);
					map.put("keyword", keyword);
					
					//글의 총개수(검색된 글의 개수)
					int count = techblogService.selectRowCount(map);
					
					logger.debug("<<count>> : " + count);
					
					//페이지 처리
					PagingUtil page = 
							new PagingUtil(keyfield,keyword,
									currentPage,count,
									rowCount,pageCount,"techblogListC.do");
					
					List<TechblogVO> listC = null;
					if(count > 0) {
						
						map.put("start", page.getStartRow());
						map.put("end", page.getEndRow());
						
						listC = techblogService.selectListC(map);
					}
					
					ModelAndView mav = new ModelAndView();
					mav.setViewName("techblogListC");
					mav.addObject("count", count);
					mav.addObject("listC", listC);
					mav.addObject("page", page.getPage());
					
					return mav;
				}
				//===========게시판 글 C목록============//
				@RequestMapping("/techblog/techblogListD.do")
				public ModelAndView processD(
						@RequestParam(value="pageNum",defaultValue="1") 
						int currentPage,
						@RequestParam(value="keyfield",defaultValue="")
						String keyfield,
						@RequestParam(value="keyword",defaultValue="")
						String keyword) {
					
					Map<String,Object> map = 
							    new HashMap<String,Object>();
					map.put("keyfield", keyfield);
					map.put("keyword", keyword);
					
					//글의 총개수(검색된 글의 개수)
					int count = techblogService.selectRowCount(map);
					
					logger.debug("<<count>> : " + count);
					
					//페이지 처리
					PagingUtil page = 
							new PagingUtil(keyfield,keyword,
									currentPage,count,
									rowCount,pageCount,"techblogListD.do");
					
					List<TechblogVO> listD = null;
					if(count > 0) {
						
						map.put("start", page.getStartRow());
						map.put("end", page.getEndRow());
						
						listD = techblogService.selectListD(map);
					}
					
					ModelAndView mav = new ModelAndView();
					mav.setViewName("techblogListD");
					mav.addObject("count", count);
					mav.addObject("listD", listD);
					mav.addObject("page", page.getPage());
					
					return mav;
				}
		//========게시판 글상세===========//
		@RequestMapping("/techblog/techblogDetail.do")
		public ModelAndView detail(
				          @RequestParam int tech_num
				          ) {
			
			logger.debug("<<tech_num>> : " + tech_num);
			
			//해당 글의 조회수 증가
			techblogService.updateTechblogHit(tech_num);
			
			TechblogVO techblogVO = 
					techblogService.selectTechblog(tech_num);
			
			//제목에 태그를 허용하지 않음
			techblogVO.setTech_title(
				 StringUtil.useNoHtml(techblogVO.getTech_title()));
			//내용에 줄바꿈 처리하면서 태그를 허용하지 않음
			//ckeditor 사용시 아래 코드 주석 처리
			/*
			board.setContent(
			 StringUtil.useBrNoHtml(board.getContent()));
			*/
			                          //뷰 이름    속성명   속성값
			return new ModelAndView("techblogView","techblog",techblogVO);
		}
		
		//===========파일다운로드===========//
		@RequestMapping("/techblog/file.do")
		public ModelAndView download(
				   @RequestParam int tech_num) {
			
			TechblogVO techblogVO = 
					techblogService.selectTechblog(tech_num);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("downloadView");
			mav.addObject("downloadFile", 
					techblogVO.getTech_photo());
			mav.addObject("filename", 
					          techblogVO.getTech_photoname());
			
			return mav;
		}
		
		//=========이미지 출력=========//
		@RequestMapping("/techblog/imageView.do")
		public ModelAndView viewImage(
				   @RequestParam int tech_num,
				   @RequestParam int tech_type) {
			
			TechblogVO techblogVO = 
					techblogService.selectTechblog(tech_num);
			
			ModelAndView mav = new ModelAndView();
			//뷰 이름
			mav.setViewName("imageView");
			
			if(tech_type==1) {//프로필 사진
				mav.addObject("imageFile", techblogVO.getPhoto());
				mav.addObject("filename", techblogVO.getPhoto_name());
			}else if(tech_type==2) {//업로드된 이미지
				mav.addObject("imageFile", techblogVO.getTech_photo());
				mav.addObject("filename", techblogVO.getTech_photoname());
			}
			return mav;
		}
		
		//===========게시판 글수정===========//
		//수정 폼
		@GetMapping("/techblog/techblogUpdate.do")
		public String formUpdate(
				@RequestParam int tech_num,
				                         Model model) {
			TechblogVO techblogVO = 
					techblogService.selectTechblog(tech_num);
			
			model.addAttribute("techblogVO", techblogVO);
			
			return "techblogModify";
		}
		//수정 폼에서 전송된 데이터 처리
		@PostMapping("/techblog/techblogUpdate.do")
		public String submitUpdate(@Valid TechblogVO techblogVO,
				            BindingResult result,
				            HttpServletRequest request,
				            Model model) {
			logger.debug("<<기술블로그 수정>> : " + techblogVO);
			
			//유효성 체크 결과 오류가 있으면 폼 호출
			if(result.hasErrors()) {
				//title 또는 content가 입력되지 않아 유효성 체크에
				//걸리면 파일 정보를 잃어버리기 때문에 품을
				//호출할 때 다시 셋팅해주어야 함.
				TechblogVO techVo = techblogService.selectTechblog(
						techblogVO.getTech_num());
				techblogVO.setTech_photoname(techVo.getTech_photoname());
				return "techblogModify";
			}
			
			//글수정
			techblogService.updateTechblog(techblogVO);
			
			//View에 표히살 메시지
			model.addAttribute("message", "기술블로그 수정 완료!!");
			model.addAttribute("url", 
					request.getContextPath()+"/techblog/techblogDetail.do?tech_num="+techblogVO.getTech_num());	

			return "common/resultView";
		}
		
		//==========게시판 글삭제==========//
		@RequestMapping("/techblog/techblogDelete.do")
		public String submitDelete(
				       @RequestParam int tech_num,
				       Model model,
				       HttpServletRequest request) {
			
			logger.debug("<<기술블로그 글삭제>> : " + tech_num);
			
			//글삭제
			techblogService.deleteTechblog(tech_num);
			
			//View에 표시할 메시지
			model.addAttribute("message", "글삭제 완료!!");
			model.addAttribute("url", 
					request.getContextPath()+"/techblog/techblogList.do");
			
			return "common/resultView";
		}
}
