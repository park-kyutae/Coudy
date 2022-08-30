package kr.spring.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//TODO 로그인 기능 완성 시 삭제
public class LoginTestInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("mem_num") == null) {
            session.setAttribute(LoginConst.MEMBER,LoginConst.MEM_NUM);
        }
        return true;


    }
}
