package kr.spring.study.studygroup.controller;

import kr.spring.study.studygroup.service.StudyGroupService;
import kr.spring.study.studygroup.vo.StudyGroupVO;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
}
