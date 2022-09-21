package kr.spring.study.application.controller;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.application.service.ApplicationService;
import kr.spring.study.application.vo.ApplicationVO;
import kr.spring.study.studygroup.service.StudyGroupService;
import kr.spring.study.studygroup.service.StudyUserService;
import kr.spring.study.studygroup.vo.StudyGroupVO;
import kr.spring.study.studygroup.vo.StudyUserVO;
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
import java.util.List;

@Controller
public class ApplicationController {

    private static final Logger logger = LoggerFactory.getLogger(ApplicationController.class);

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
    public ModelAndView mystudylist(@RequestParam int study_num, @Valid ApplicationVO applicationVO,
                                    BindingResult result, HttpServletRequest request,
                                    HttpSession session) {

        MemberVO user = (MemberVO) session.getAttribute("user");
        StudyUserVO studyUserVO = studyUserService.selectStudyUser(study_num, user.getMem_num());

        StudyGroupVO studyGroupVO =
                studyGroupService.selectStudyGroup(study_num);
        List<StudyUserVO> list = null;

        ModelAndView model = new ModelAndView();
        model.setViewName("MyStudyList");
        model.addObject("studygroup", studyGroupVO);
        model.addObject("studyuser", studyUserVO);

        return model;
    }

    //==관리자 스터디 목록==//
    @GetMapping("/study/studyuserlist.do")
    public ModelAndView studyApplication(@Valid ApplicationVO applicationVO,
                       BindingResult result, HttpServletRequest request,
                       HttpSession session) {

        MemberVO user = (MemberVO) session.getAttribute("user");
        StudyUserVO studyUserVO = studyUserService.selectUser(user.getMem_num());

        StudyGroupVO studyGroupVO =
                studyGroupService.selectStudyGroup(studyUserVO.getStudy_num());

        List<StudyUserVO> list = null;

        ModelAndView model = new ModelAndView();
        model.setViewName("StudyUserList");
        model.addObject("studygroup", studyGroupVO);
        model.addObject("list", list);
        model.addObject("studyuser", studyUserVO);
        model.addObject("user", user);

        return model;
    }
}