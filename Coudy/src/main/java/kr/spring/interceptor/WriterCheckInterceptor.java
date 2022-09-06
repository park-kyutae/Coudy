package kr.spring.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.spring.member.vo.MemberVO;
import kr.spring.techblog.service.TechblogService;
import kr.spring.techblog.vo.TechblogVO;

public class WriterCheckInterceptor 
                        implements HandlerInterceptor{
	private static final Logger logger =
			LoggerFactory.getLogger(WriterCheckInterceptor.class);
	
	@Autowired
	private TechblogService techblogService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			           HttpServletResponse response,
			           Object handler)throws Exception {
		logger.debug("<<로그인 회원번호와 작성자 회원번호 일치 여부 체크>>");
		
		//작성자의 회원번호 구하기
		int tech_num = Integer.parseInt(
				request.getParameter("tech_num")); 
		TechblogVO techblogVO = 
				techblogService.selectTechblog(tech_num);
		
		//로그인 회원번호 구하기
		HttpSession session = request.getSession();
		MemberVO user = 
			 (MemberVO)session.getAttribute("user");
		
		logger.debug("<<로그인 회원번호>> : " + user.getMem_num());
		logger.debug("<<작성자 회원번호>> : " + techblogVO.getMem_num());
		
		//로그인 회원번호와 작성자 회원번호 일치 여부 체크
		if(user==null || 
			user.getMem_num()!= techblogVO.getMem_num()) {
			logger.debug("<<로그인 회원번호와 작성자 회원번호 불일치>>");
		
			//UI에 보여질 정보 저장
			request.setAttribute(
					"accessMsg", "로그인 아이디와 작성자 아이디 불일치");
			request.setAttribute(
					"accessBtn", "게시판 목록");
			request.setAttribute(
					"accessUrl", request.getContextPath()+"/techblog/techblogList.do");
			
			//포워드 방식으로 화면 호출
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(
							"/WEB-INF/views/common/notice.jsp");
			dispatcher.forward(request, response);
			
			return false;
		}
		
		logger.debug("<<로그인 회원번호와 작성자 회원번호 일치>>");
		
		return true;
	}
	
}



