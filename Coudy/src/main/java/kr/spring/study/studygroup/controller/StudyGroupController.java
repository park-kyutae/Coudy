package kr.spring.study.studygroup.controller;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.studygroup.service.StudyGroupService;
import kr.spring.study.studygroup.vo.StudyGroupVO;
import kr.spring.util.PagingUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /*
    @GetMapping("/study/studygrouplist.do")
    public String form() {
        return "StudyGroupList";
    }*/



    @RequestMapping("/study/studygrouplist.do")
    public ModelAndView process(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
                                @RequestParam(value = "keyfield", defaultValue = "") String keyfield,
                                @RequestParam(value = "keyword", defaultValue = "") String keyword) {

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("keyfield", keyfield);
        map.put("keyword", keyword);

        //글의 총개수(검색된 글의 개수)
        int count = studyGroupService.selectRowCount(map);

        logger.debug("<<count>> : " + count);

        //페이지 처리
        PagingUtil page =
                new PagingUtil(keyfield, keyword, currentPage, count, rowCount, pageCount, "studygrouplist.do");

        List<StudyGroupVO> list = null;
        if (count > 0) {

            map.put("start", page.getStartRow());
            map.put("end", page.getEndRow());

            list = studyGroupService.selectAllStudyGroups(map);
        }

        ModelAndView mav = new ModelAndView();
        mav.setViewName("StudyGroupList");
        mav.addObject("count", count);
        mav.addObject("list", list);
        mav.addObject("page", page.getPage());

        return mav;
    }

    @GetMapping("/study/studygroupcreate.do")
    public String form2() {
        return "CreateStudyGroup";
    }


    @PostMapping("/study/studygroupcreate.do")
    public String submit(@Valid StudyGroupVO studyGroupVO, BindingResult result, HttpServletRequest request,
                         HttpSession session, Model model) {

        logger.debug("<<스터디 그룹 저장>> : " + studyGroupVO);
        //유효성 검사 결과 오류가 있으면 폼 호출
        if (result.hasErrors()) {
            return form2();
        }

        MemberVO user = (MemberVO) session.getAttribute("user");
        //회원번호 셋팅
        studyGroupVO.setMem_num(user.getMem_num());
        //ip셋팅
        //studyGroupVO.setIp(request.getRemoteAddr());

        //글쓰기
        studyGroupService.insertStudyGroup(studyGroupVO);

        //View에 표시할 메시지
        model.addAttribute(
                "message", "글 등록이 완료되었습니다.");
        model.addAttribute(
                "url", request.getContextPath() + "/study/studygrouplist.do");

        return "common/resultView";
    }

}
