package kr.spring.study.plan.testUtil;

import kr.spring.study.plan.artgumentResolver.AuthConst;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//TODO 로그인 기능 완성 시 삭제
public class LoginTestInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute(AuthConst.MEMBER) == null) {
            session.setAttribute(AuthConst.MEMBER, 1);
        }
        return true;


    }
}
