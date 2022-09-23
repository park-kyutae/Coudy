package kr.spring.teamblog.controller;

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
import kr.spring.notice.vo.NoticeReplyVO;
import kr.spring.teamblog.service.TeamblogService;
import kr.spring.teamblog.vo.TeamblogFavVO;
import kr.spring.teamblog.vo.TeamblogReplyVO;
import kr.spring.util.PagingUtil;

@Controller
public class TeamblogAjaxController {
	private static final Logger logger = 
			LoggerFactory.getLogger(TeamblogAjaxController.class);
	
	private int rowCount=10;
	private int pageCount=20;
	
	@Autowired
	private TeamblogService teamblogService;
	
	//=====부모글 업로드 파일 삭제========//
	@RequestMapping("/teamblog/deleteFile.do")
	@ResponseBody
	public Map<String,String> processFile(
			@RequestParam int team_num,HttpSession session){
		Map<String,String> mapJson=
				new HashMap<String,String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			teamblogService.deleteFile(team_num);
			mapJson.put("result","success");
		}
		
		return mapJson;
	}
	
	//========팀브롤그 부모글 좋아요========//
	//좋아요 등록
	@RequestMapping("/teamblog/writeFav.do")
	@ResponseBody
	public Map<String,Object> writeFav(TeamblogFavVO fav, HttpSession session){
		
		logger.debug("<<팀블로그 좋아요 등록>> : "+fav);
		
		Map<String,Object> mapJson=
				new HashMap<String,Object>();
		
		MemberVO user=
				(MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result" , "logout");
		}else {
			//로그인된 회원번호 셋팅
			fav.setMem_num(user.getMem_num());
			
			//기존에 등록된 좋아요 확인
			TeamblogFavVO teamblogFav = 
					teamblogService.selectFav(fav);
			
			if(teamblogFav!=null) {
				teamblogService.deleteFav(teamblogFav.getTeam_fav_num());
				
				mapJson.put("result", "success");
				mapJson.put("status", "noFav");
				mapJson.put("count", teamblogService.selectFavCount(fav.getTeam_num()));
				
			}else {
				teamblogService.insertFav(fav);
				
				mapJson.put("result", "success");
				mapJson.put("status", "yesFav");
				mapJson.put("count", teamblogService.selectFavCount(fav.getTeam_num()));
			}
		}
		
		return mapJson;
	}
	//좋아요 읽기
	@RequestMapping("/teamblog/getFav.do")
	@ResponseBody
	public Map<String,Object> getFav(
			TeamblogFavVO fav, HttpSession session){
		
		logger.debug("<<팀블로그 좋아요 읽기>> : "+fav);
		
		Map<String,Object> mapJson=
				new HashMap<String,Object>();
		
		MemberVO user=
				(MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("status", "noFav");
			mapJson.put("count", teamblogService.selectFavCount(fav.getTeam_num()));
		}else {
			fav.setMem_num(user.getMem_num());
			
			TeamblogFavVO teamblogFav = teamblogService.selectFav(fav);
			
			if(teamblogFav!=null) {//좋아요 등록
				mapJson.put("status", "yesFav");
				mapJson.put("count", teamblogService.selectFavCount(
						                     fav.getTeam_num()));
			}else {//좋아요 미등록
				mapJson.put("status", "noFav");
				mapJson.put("count", teamblogService.selectFavCount(
						                     fav.getTeam_num()));
			}
		}
		
		return mapJson;
	}
	
	//==========댓글 등록=============//
	@RequestMapping("/teamblog/writeReply.do")
	@ResponseBody
	public Map<String,String> writeReply(TeamblogReplyVO teamblogReplyVO, HttpSession session, HttpServletRequest request){
		
		logger.debug("<<블로그 댓글 등록>> : "+teamblogReplyVO);
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapAjax.put("result", "logout");
		}else {
			teamblogReplyVO.setMem_num(user.getMem_num());
			teamblogReplyVO.setTeam_re_ip(request.getRemoteAddr());
			teamblogService.insertReply(teamblogReplyVO);
			mapAjax.put("result", "success");
		}
		
		return mapAjax;
	}
	
	//-===========블로그 댓글 목록==========//
	@RequestMapping("/teamblog/listReply.do")
	@ResponseBody
	public Map<String,Object> getList(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam int team_num,
			HttpSession session){
		logger.debug("<<currentPage>> : "+currentPage);
		logger.debug("<<team_num>> : "+team_num);
		
		Map<String,Object> map = 
				new HashMap<String,Object>();
		map.put("team_num", team_num);
		
		//총 글의 개수
		int count = 
				teamblogService.selectRowCountReply(map);
		
		PagingUtil page = 
				new PagingUtil(currentPage,count,rowCount,pageCount,null);
		
		map.put("start", page.getStartRow());
		map.put("end", page.getEndRow());
		
		List<TeamblogReplyVO> list = null;
		if(count>0) {
			list=teamblogService.selectListReply(map);
		}else {
			list = Collections.emptyList();
		}
		
		Map<String,Object> mapAjax=
				new HashMap<String,Object>();
		mapAjax.put("count",count);
		mapAjax.put("rowCount",rowCount);
		mapAjax.put("list",list);
		
		//로그인 한 회원정보 셋팅
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user!=null) {
			mapAjax.put("user_num", user.getMem_num());
		}
		
		return mapAjax;
	}
	
	//===========댓글 수정==========//
	@RequestMapping("/teamblog/updateReply.do")
	@ResponseBody
	public Map<String,String> modifyReply(
			      TeamblogReplyVO teamblogReplyVO,
			      HttpSession session,
			      HttpServletRequest request){
		
		logger.debug("<<댓글 수정>> : " + teamblogReplyVO);
		
		Map<String,String> mapAjax = 
				new HashMap<String,String>();
		
		MemberVO user = 
				(MemberVO)session.getAttribute("user");
		TeamblogReplyVO db_reply = 
				teamblogService.selectReply(
						     teamblogReplyVO.getTeam_re_num());
		if(user==null) {//로그인이 되지 않는 경우
			mapAjax.put("result", "logout");
		}else if(user!=null && 
			  user.getMem_num()==db_reply.getMem_num()) {
			//로그인 회원번호와 작성자 회원번호 일치
			
			//ip 등록
			teamblogReplyVO.setTeam_re_ip(request.getRemoteAddr());
			
			//댓글 수정
			teamblogService.updateReply(teamblogReplyVO);
			mapAjax.put("result", "success");
		}else {
			//로그인 회원번호와 작성자 회원번호 불일치
			mapAjax.put("result", "wrongAccess");
		}
		return mapAjax;
	}
	
	//==========댓글 삭제==========//
	@RequestMapping("/teamblog/deleteReply.do")
	@ResponseBody
	public Map<String,String> deleteReply(
			@RequestParam int team_re_num,
			HttpSession session){

		logger.debug("<<team_re_num>> : " + team_re_num);

		Map<String,String> mapAjax =
				new HashMap<String,String>();

		MemberVO user = 
				(MemberVO)session.getAttribute("user");
		TeamblogReplyVO db_reply = 
				teamblogService.selectReply(team_re_num);
		if(user==null) {
			//로그인이 되지 않은 경우
			mapAjax.put("result", "logout");
		}else if(user!=null && 
				user.getMem_num()==db_reply.getMem_num()) {
			//로그인이 되어 있고 
			//로그인한 회원번호와 작성자 회원번호 일치

			//댓글 삭제
			teamblogService.deleteReply(team_re_num);

			mapAjax.put("result", "success");
		}else {
			//로그인한 회원번호와 작성자 회원번호 불일치
			mapAjax.put("result", "wrongAccess");
		}
		return mapAjax;
	}
}
























