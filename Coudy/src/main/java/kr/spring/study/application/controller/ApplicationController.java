package kr.spring.study.application.controller;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.application.service.ApplicationService;
import kr.spring.study.application.vo.ApplicationVO;
import kr.spring.study.studygroup.service.StudyGroupService;
import kr.spring.study.studygroup.service.StudyUserService;
import kr.spring.study.studygroup.vo.StudyGroupVO;
import kr.spring.study.studygroup.vo.StudyUserVO;
import kr.spring.util.PagingUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ApplicationController {

    private static final Logger logger = LoggerFactory.getLogger(ApplicationController.class);
    private int rowCount = 20;
    private int pageCount = 10;

    @Autowired
    public StudyGroupService studyGroupService;

    @Autowired
    public StudyUserService studyUserService;

    @Autowired
    public ApplicationService applicationService;

    @ModelAttribute
    public ApplicationVO init(){return new ApplicationVO();}

    @GetMapping("/study/applicationcreate.do")
    public String ApplicationWriteForm(@RequestParam int study_num,
                                       Model model){

        StudyGroupVO studyGroupVO = studyGroupService.selectStudyGroup(study_num);

        model.addAttribute("studygroup", studyGroupVO);

        return "CreateApplication";
    }

    @PostMapping("/study/applicationcreate.do")
    public String ApplicationWriteForm(@RequestParam int study_num, @Valid ApplicationVO applicationVO, @Valid StudyUserVO studyUserVO,
                                       BindingResult result, HttpServletRequest request,
                                       HttpSession session, Model model){

        logger.debug("<<스터디 그룹 저장>> : " + applicationVO);
        logger.debug("<<스터디그룹 번호 조회>> : " + study_num);
        //유효성 검사 결과 오류가 있으면 폼 호출
        if (result.hasErrors()) {
            StudyGroupVO vo = studyGroupService.selectStudyGroup(
                    applicationVO.getStudy_num());
            return "CreateApplication";
        }

        MemberVO user = (MemberVO) session.getAttribute("user");
        //회원번호 셋팅
        applicationVO.setStudy_num(study_num);
        applicationVO.setMem_num(user.getMem_num());
        //ip셋팅
        //studyGroupVO.setIp(request.getRemoteAddr());

        studyUserVO.setStudy_num(study_num);
        studyUserVO.setMem_num(user.getMem_num());

        //글쓰기
        applicationService.insertApplication(applicationVO);
        studyUserService.insertStudyUser(studyUserVO);

        //View에 표시할 메시지
        model.addAttribute(
                "message", "스터디그룹 신청이 완료되었습니다.");
        model.addAttribute(
                "url", request.getContextPath() + "/study/studygrouplist.do");

        return "common/resultView";
    }

    //==나의 스터디 목록==//
    @GetMapping("/study/mystudylist.do")
    public ModelAndView mystudylist(@Valid ApplicationVO applicationVO,
                                    BindingResult result, HttpServletRequest request,
                                    HttpSession session) {

        logger.debug("<<지원 목록>> : " + applicationVO);
        
        MemberVO user = (MemberVO) session.getAttribute("user");

        List<ApplicationVO> list = applicationService.selectMyAllApplications(user.getMem_num());

        ModelAndView model = new ModelAndView();
        model.setViewName("MyStudyList");
        model.addObject("list", list);
        return model;
    }

    //==관리자 스터디 목록==//
    @GetMapping("/study/applicationlist.do")
    public ModelAndView studyApplication(@RequestParam int study_num, HttpSession session) {
        logger.debug("<<스터디 "+ study_num + "번 방 지원서 조회 : >> ");

        MemberVO user = (MemberVO) session.getAttribute("user");
        List<ApplicationVO> list = applicationService.selectMyStudyApplications(study_num);

        ModelAndView model = new ModelAndView();
        model.setViewName("ApplicationList");
        model.addObject("list", list);
        return model;
    }

    //==스터디 권한 수정==//
    @PostMapping("/study/updatestudyauth.do")
    public String submitUpdate(@Valid StudyUserVO studyUserVO,
                               BindingResult result,
                               HttpServletRequest request,
                               Model model) {
        logger.debug("<<권한 수정>> : " + studyUserVO);

        //유효성 체크 결과 오류가 있으면 폼 호출
        
        //ip셋팅
        //boardVO.setIp(request.getRemoteAddr());
        //권한수정
        studyUserService.updateAuth(studyUserVO);

        //View에 표히살 메시지
        model.addAttribute("message", "권한 수정 완료");
        model.addAttribute("url",
                request.getContextPath()+"/study/applicationlist.do?study_num="+studyUserVO.getStudy_num());

        return "common/resultView";
    }
}
