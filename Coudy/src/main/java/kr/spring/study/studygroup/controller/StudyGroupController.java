package kr.spring.study.studygroup.controller;

import kr.spring.study.studygroup.service.StudyGroupService;
import kr.spring.study.studygroup.service.StudyGroupServiceImpl;
import kr.spring.study.studygroup.vo.StudyGroupVO;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class StudyGroupController {

    private static final Logger logger = LoggerFactory.getLogger(StudyGroupController.class);
    private int rowCount = 20;
    private int pageCount = 10;

    @Autowired
    private StudyGroupService studyGroupService;

    //자바빈초기화
    @ModelAttribute
    public StudyGroupVO initCommand() {
        return new StudyGroupVO();
    }

    @GetMapping("/study/studygrouplist.do")
    public String form(){
        return "StudyGroupList";
    }

    @GetMapping("/study/studygroupcreate.do")
    public String form2(){
        return "CreateStudyGroup";
    }

    /*
    @PostMapping("/study/studygroupcreate.do")
    public String submit(@Valid StudyGroupVO studyGroupVO, BindingResult result, HttpServletRequest request,
                         HttpSession httpSession, Model model){
        logger.debug(" << 스터디 그룹 저장 >> : " + studyGroupVO);
        //유효성 검사 결과 오류가 있으면 폼 호출
        if(result.hasErrors()) {
            return form();
        }

        MemberVO user = (MemberVO)session.getAttribute("user");
        //회원번호 셋팅
        studyGroupVO.setMem_num(user.getMem_num());
        //ip셋팅
        studyGroupVO.setIp(request.getRemoteAddr());

        //글쓰기
        studyGroupService.insertStudyGroup(studyGroupVO);

        //View에 표시할 메시지
        model.addAttribute(
                "message", "글 등록이 완료되었습니다.");
        model.addAttribute(
                "url", request.getContextPath()+"/board/list.do");

        return "common/resultView";
    }*/
}
