package kr.spring.study.application.controller;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.application.dao.ApplicationMapper;
import kr.spring.study.application.service.ApplicationService;
import kr.spring.study.application.vo.ApplicationVO;
import kr.spring.study.studygroup.vo.StudyGroupVO;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class ApplicationController {

    private static final Logger logger = LoggerFactory.getLogger(ApplicationController.class);



    @Autowired
    public ApplicationService applicationService;

    @ModelAttribute
    public ApplicationVO init(){return new ApplicationVO();}

    @GetMapping("/study/applicationcreate.do")
    public String ApplicationWriteForm(){return "CreateApplication";}

    @PostMapping("/study/applicationcreate.do")
    public String ApplicationWriteForm(@RequestParam int study_num,@Valid ApplicationVO applicationVO, BindingResult result, HttpServletRequest request,
                                       HttpSession session, Model model){

        logger.debug("<<스터디 그룹 저장>> : " + applicationVO);
        //유효성 검사 결과 오류가 있으면 폼 호출
        if (result.hasErrors()) {
            return ApplicationWriteForm();
        }

        MemberVO user = (MemberVO) session.getAttribute("user");
        //회원번호 셋팅
        applicationVO.setStudy_num(study_num);
        applicationVO.setMem_num(user.getMem_num());
        //ip셋팅
        //studyGroupVO.setIp(request.getRemoteAddr());

        //글쓰기
        applicationService.insertApplication(applicationVO);

        //View에 표시할 메시지
        model.addAttribute(
                "message", "스터디그룹 신청이 완료되었습니다.");
        model.addAttribute(
                "url", request.getContextPath() + "/study/studygrouplist.do");

        return "common/resultView";
    }
}
