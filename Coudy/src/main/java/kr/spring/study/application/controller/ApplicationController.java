package kr.spring.study.application.controller;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.application.dao.ApplicationMapper;
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

        logger.debug("<<????????? ?????? ??????>> : " + applicationVO);
        logger.debug("<<??????????????? ?????? ??????>> : " + study_num);
        //????????? ?????? ?????? ????????? ????????? ??? ??????
        if (result.hasErrors()) {
            StudyGroupVO vo = studyGroupService.selectStudyGroup(
                    applicationVO.getStudy_num());
            return "CreateApplication";
        }

        MemberVO user = (MemberVO) session.getAttribute("user");
        //???????????? ??????
        applicationVO.setStudy_num(study_num);
        applicationVO.setMem_num(user.getMem_num());
        //ip??????
        //studyGroupVO.setIp(request.getRemoteAddr());

        studyUserVO.setStudy_num(study_num);
        studyUserVO.setMem_num(user.getMem_num());

        //?????????
        applicationService.insertApplication(applicationVO);
        studyUserService.insertStudyUser(studyUserVO);

        //View??? ????????? ?????????
        model.addAttribute(
                "message", "??????????????? ????????? ?????????????????????.");
        model.addAttribute(
                "url", request.getContextPath() + "/study/studygrouplist.do");

        return "common/resultView";
    }

    //==?????? ????????? ??????==//
    @GetMapping("/study/mystudylist.do")
    public ModelAndView mystudylist(@Valid ApplicationVO applicationVO,
                                    BindingResult result, HttpServletRequest request,
                                    HttpSession session) {

        logger.debug("<<?????? ??????>> : " + applicationVO);
        
        MemberVO user = (MemberVO) session.getAttribute("user");

        List<ApplicationVO> list = applicationService.selectMyAllApplications(user.getMem_num());

        ModelAndView model = new ModelAndView();
        model.setViewName("MyStudyList");
        model.addObject("list", list);
        return model;
    }

    //==????????? ????????? ??????==//
    @GetMapping("/study/applicationlist.do")
    public ModelAndView studyApplication(@RequestParam int study_num, HttpSession session) {
        logger.debug("<<????????? "+ study_num + "??? ??? ????????? ?????? : >> ");

        MemberVO user = (MemberVO) session.getAttribute("user");
        List<ApplicationVO> list = applicationService.selectMyStudyApplications(study_num);

        StudyGroupVO studyGroupVO = studyGroupService.selectStudyGroup(study_num);
        int userTotal = studyUserService.selectApplicants(study_num);

        ModelAndView model = new ModelAndView();
        model.setViewName("ApplicationList");
        model.addObject("list", list);
        model.addObject("studygroup", studyGroupVO);
        model.addObject("total", userTotal);

        return model;

    }

    //==????????? ?????? ??????==//
    @PostMapping("/study/updatestudyauth.do")
    public String submitUpdate(@Valid StudyUserVO studyUserVO,
                               BindingResult result,
                               HttpServletRequest request,
                               Model model) {
        logger.debug("<<?????? ??????>> : " + studyUserVO);

        //????????? ?????? ?????? ????????? ????????? ??? ??????
        
        //ip??????
        //boardVO.setIp(request.getRemoteAddr());
        //????????????
        studyUserService.updateAuth(studyUserVO);

        //View??? ????????? ?????????
        model.addAttribute("message", "?????? ?????? ??????");
        model.addAttribute("url",
                request.getContextPath()+"/study/applicationlist.do?study_num="+studyUserVO.getStudy_num());

        return "common/resultView";
    }
    //==????????? ?????? ????????? ??????==//
    @PostMapping("/study/updaterejectauth.do")
    public String submitUpdateforReject(@Valid StudyUserVO studyUserVO,
                               BindingResult result,
                               HttpServletRequest request,
                               Model model) {
        logger.debug("<<?????? ??????>> : " + studyUserVO);

        //????????? ?????? ?????? ????????? ????????? ??? ??????

        //ip??????
        //boardVO.setIp(request.getRemoteAddr());
        //????????????
        studyUserService.updateRejectAuth(studyUserVO);

        //View??? ????????? ?????????
        model.addAttribute("message", "?????? ?????? ??????");
        model.addAttribute("url",
                request.getContextPath()+"/study/applicationlist.do?study_num="+studyUserVO.getStudy_num());

        return "common/resultView";
    }
}
