package kr.spring.notice.controller;

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
import kr.spring.notice.service.NoticeService;
import kr.spring.notice.vo.NoticeFavVO;
import kr.spring.notice.vo.NoticeReplyVO;
import kr.spring.util.PagingUtil;

@Controller
public class NoticeAjaxController {
	private static final Logger logger=
			LoggerFactory.getLogger(NoticeAjaxController.class);
	
	private int rowCount=10;
	private int pageCount=10;
	
	@Autowired
	private NoticeService noticeService;
	
	//=======부모글 업로드 파일 삭제=====//
	@RequestMapping("/notice/deleteFile.do")
	@ResponseBody
	public Map<String,String> processFile(
			@RequestParam int notice_num,HttpSession session){
		Map<String,String> mapJson=
				new HashMap<String,String>();
		
		MemberVO user=(MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			noticeService.deleteFile(notice_num);
			mapJson.put("result", "success");
		}
		
		return mapJson;
	}
	
	//=============부모글 좋아요============//
	//부모글 좋아요 등록
	@RequestMapping("/notice/writeFav.do")
	@ResponseBody
	public Map<String,Object> writeFav(
			             NoticeFavVO fav,
			             HttpSession session){
		logger.debug("<<부모글 좋아요 등록>> : " + fav);
		
		Map<String,Object> mapJson= 
				new HashMap<String,Object>();
		
		MemberVO user = 
				(MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			//로그인된 회원번호 셋팅
			fav.setMem_num(user.getMem_num());
			
			//기존에 등록된 좋아요 확인
			NoticeFavVO noticeFav = 
					noticeService.selectFav(fav);
			
			if(noticeFav!=null) {//등록된 좋아요 정보가 있는 경우
				noticeService.deleteFav(noticeFav.getNotice_fav_num());
				
				mapJson.put("result", "success");
				mapJson.put("status", "noFav");
				mapJson.put("count", noticeService.selectFavCount(
						                      fav.getNotice_num()));
				
			}else {//등록된 좋아요 정보가 없는 경우
				noticeService.insertFav(fav);
				
				mapJson.put("result", "success");
				mapJson.put("status", "yesFav");
				mapJson.put("count", noticeService.selectFavCount(
						                    fav.getNotice_num()));
			}
		}
		return mapJson;
	}
	//부모글 좋아요 읽기
	@RequestMapping("/notice/getFav.do")
	@ResponseBody
	public Map<String,Object> getFav(
			         NoticeFavVO fav,
			         HttpSession session){
		
		logger.debug("<<게시판 좋아요 읽기>> : " + fav);
		
		Map<String,Object> mapJson = 
				new HashMap<String,Object>();
		
		MemberVO user = 
			  (MemberVO)session.getAttribute("user");
		if(user==null) {//로그인이 되지 않은 경우
			mapJson.put("status", "noFav");
			mapJson.put("count", noticeService.selectFavCount(
					                     fav.getNotice_num()));
		}else {//로그인 된 경우
			fav.setMem_num(user.getMem_num());
			
			//등록된 좋아요 정보 읽기
			NoticeFavVO noticeFav = noticeService.selectFav(fav);
			
			if(noticeFav!=null) {//좋아요 등록
				mapJson.put("status", "yesFav");
				mapJson.put("count", noticeService.selectFavCount(
						                     fav.getNotice_num()));
			}else {//좋아요 미등록
				mapJson.put("status", "noFav");
				mapJson.put("count", noticeService.selectFavCount(
						                     fav.getNotice_num()));
			}
		}
		return mapJson;		
	}
	
	//===========댓글 등록==============//
		@RequestMapping("/notice/writeReply.do")
		@ResponseBody
		public Map<String,String> writeReply(
				NoticeReplyVO noticeReplyVO,
				HttpSession session,
				HttpServletRequest request){
			
			logger.debug("<<댓글 등록>> : "+noticeReplyVO);
			
			Map<String,String> mapAjax = new HashMap<String,String>();
			
			MemberVO user=(MemberVO)session.getAttribute("user");
			if(user==null) {
				mapAjax.put("result", "logout");
			}else {
				noticeReplyVO.setMem_num(user.getMem_num());
				noticeReplyVO.setNotice_re_ip(request.getRemoteAddr());
				noticeService.insertReply(noticeReplyVO);
				mapAjax.put("result", "success");
			}
			return mapAjax;
		}
		
		//=========댓글목록============//
		@RequestMapping("/notice/listReply.do")
		@ResponseBody
		public Map<String,Object> getList(
				 @RequestParam(value="pageNum",defaultValue="1") 
				  int currentPage,
				  @RequestParam int notice_num,
				  HttpSession session){
			
			logger.debug("<<currentPage>> : " + currentPage);
			logger.debug("<<notice_num>> : " + notice_num);
			
			Map<String,Object> map = 
					new HashMap<String,Object>();
			map.put("notice_num", notice_num);
			
			//총 글의 개수
			int count = 
				noticeService.selectRowCountReply(map);
			
			PagingUtil page = 
					new PagingUtil(currentPage,count,
							rowCount,pageCount,null);
			
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			List<NoticeReplyVO> list = null;
			if(count > 0) {
				list = noticeService.selectListReply(map);
			}else {
				list = Collections.emptyList();
			}
			
			Map<String,Object> mapAjax = 
					new HashMap<String,Object>();
			mapAjax.put("count", count);
			mapAjax.put("rowCount", rowCount);
			mapAjax.put("list", list);
			
			//로그인 한 회원정보 셋팅
			MemberVO user = 
				 (MemberVO)session.getAttribute("user");
			if(user!=null) {
				mapAjax.put(
						"user_num", user.getMem_num());
			}
			
			return mapAjax;
		}
		
		//==========댓글 수정==========//
		@RequestMapping("/notice/updateReply.do")
		@ResponseBody
		public Map<String,String> modifyReply(
				      NoticeReplyVO noticeReplyVO,
				      HttpSession session,
				      HttpServletRequest request){
			
			logger.debug("<<댓글 수정>> : " + noticeReplyVO);
			
			Map<String,String> mapAjax = 
					new HashMap<String,String>();
			
			MemberVO user = 
					(MemberVO)session.getAttribute("user");
			NoticeReplyVO db_reply = 
					noticeService.selectReply(
							     noticeReplyVO.getNotice_re_num());
			if(user==null) {//로그인이 되지 않는 경우
				mapAjax.put("result", "logout");
			}else if(user!=null && 
				  user.getMem_num()==db_reply.getMem_num()) {
				//로그인 회원번호와 작성자 회원번호 일치
				
				//ip 등록
				noticeReplyVO.setNotice_re_ip(request.getRemoteAddr());
				
				//댓글 수정
				noticeService.updateReply(noticeReplyVO);
				mapAjax.put("result", "success");
			}else {
				//로그인 회원번호와 작성자 회원번호 불일치
				mapAjax.put("result", "wrongAccess");
			}
			return mapAjax;
		}
		//==========댓글 삭제==========//
		@RequestMapping("/notice/deleteReply.do")
		@ResponseBody
		public Map<String,String> deleteReply(
				            @RequestParam int notice_re_num,
				            HttpSession session){
			
			logger.debug("<<notice_re_num>> : " + notice_re_num);
			
			Map<String,String> mapAjax =
					new HashMap<String,String>();
			
			MemberVO user = 
				(MemberVO)session.getAttribute("user");
			NoticeReplyVO db_reply = 
					noticeService.selectReply(notice_re_num);
			if(user==null) {
				//로그인이 되지 않은 경우
				mapAjax.put("result", "logout");
			}else if(user!=null && 
			  user.getMem_num()==db_reply.getMem_num()) {
				//로그인이 되어 있고 
				//로그인한 회원번호와 작성자 회원번호 일치
				
				//댓글 삭제
				noticeService.deleteReply(notice_re_num);
				
				mapAjax.put("result", "success");
			}else {
				//로그인한 회원번호와 작성자 회원번호 불일치
				mapAjax.put("result", "wrongAccess");
			}
			return mapAjax;
		}

}
