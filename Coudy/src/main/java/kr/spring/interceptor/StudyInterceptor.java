package kr.spring.interceptor;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.plan.artgumentResolver.AuthConst;
import kr.spring.study.studygroup.service.StudyGroupService;
import kr.spring.study.studygroup.service.StudyUserService;
import kr.spring.study.studygroup.vo.StudyGroupVO;
import kr.spring.study.studygroup.vo.StudyUserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
public class StudyInterceptor implements HandlerInterceptor {
    private final StudyUserService studyUserService;
    private final StudyGroupService studyGroupService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO) session.getAttribute(AuthConst.MEMBER);
        Integer studyNum = getStudyNum(request);
        StudyUserVO studyUserVO = studyUserService.selectStudyUser(studyNum, memberVO.getMem_num());
        if(studyUserVO==null) return false;
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        Integer study_num = getStudyNum(request);
        if (modelAndView == null) return;
        List<MemberVO> memberVOList = studyUserService.selectMemberByStudyNum(study_num);
        StudyGroupVO studyGroupVO = studyGroupService.selectStudyGroup(study_num);
        modelAndView.addObject("sidebarMembers", memberVOList);
        modelAndView.addObject("sidebarStudyGroup", studyGroupVO);
    }

    private static Integer getStudyNum(HttpServletRequest request) {
        String study_num_str = request.getParameter("study_num");
        if (study_num_str == null ) {
            study_num_str = request.getRequestURI().split("/")[3];
        }
        Integer study_num = Integer.parseInt(study_num_str);
        return study_num;
    }
}
