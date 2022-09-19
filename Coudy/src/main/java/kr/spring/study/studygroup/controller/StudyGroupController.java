package kr.spring.study.studygroup.controller;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.studygroup.service.StudyGroupService;
import kr.spring.study.studygroup.service.StudyUserService;
import kr.spring.study.studygroup.vo.StudyGroupVO;
import kr.spring.study.studygroup.vo.StudyUserVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;
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

    @Autowired
    private StudyUserService studyUserService;

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

    @GetMapping("/study/studymain.do")
    public String mainForm() {
        return "StudyMain";
    }

    //========스터디방 메인===========//
    @RequestMapping("/study/studymain.do")
    public ModelAndView mainForm(
            @RequestParam int study_num,HttpSession session) {

        logger.debug("<<study_num>> : " + study_num);

        StudyGroupVO studyGroupVO =
                studyGroupService.selectStudyGroup(study_num);

        MemberVO user = (MemberVO) session.getAttribute("user");
        StudyUserVO studyUserVO = studyUserService.selectStudyUser(study_num, user.getMem_num());
        //제목에 태그를 허용하지 않음
        //studyGroupVO.setName(
        //       StringUtil.useNoHtml(studyGroupVO.getName()));
        //내용에 줄바꿈 처리하면서 태그를 허용하지 않음
        //ckeditor 사용시 아래 코드 주석 처리
		/*
		board.setContent(
		 StringUtil.useBrNoHtml(board.getContent()));
		*/
        //뷰 이름    속성명   속성값
        logger.debug("<<vo>> : " + studyUserVO);

        ModelAndView model = new ModelAndView();
        model.setViewName("StudyMain");
        model.addObject("studygroup", studyGroupVO);
        model.addObject("studyuser", studyUserVO);

        return model;
    }


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
    public String submit(@Valid StudyGroupVO studyGroupVO, @Valid StudyUserVO studyUserVO,
                         BindingResult result, HttpServletRequest request,
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

    //========상세===========//
    @RequestMapping("/study/studydetail.do")
    public ModelAndView detail(
            @RequestParam int study_num,HttpSession session) {

        logger.debug("<<study_num>> : " + study_num);



        StudyGroupVO studyGroupVO =
                studyGroupService.selectStudyGroup(study_num);

        MemberVO user = (MemberVO) session.getAttribute("user");
        StudyUserVO studyUserVO = studyUserService.selectStudyUser(study_num, user.getMem_num());
        //제목에 태그를 허용하지 않음
        //studyGroupVO.setName(
        //       StringUtil.useNoHtml(studyGroupVO.getName()));
        //내용에 줄바꿈 처리하면서 태그를 허용하지 않음
        //ckeditor 사용시 아래 코드 주석 처리
		/*
		board.setContent(
		 StringUtil.useBrNoHtml(board.getContent()));
		*/
        //뷰 이름    속성명   속성값
        logger.debug("<<vo>> : " + studyUserVO);

        ModelAndView model = new ModelAndView();
        model.setViewName("DetailStudyGroup");
        model.addObject("studygroup", studyGroupVO);
        model.addObject("studyuser", studyUserVO);

        return model;
    }

    //===========수정===========//
    //수정 폼
    @GetMapping("/study/updatestudygroup.do")
    public String formUpdate(
            @RequestParam int study_num,
            Model model) {
        StudyGroupVO studyGroupVO =
                studyGroupService.selectStudyGroup(study_num);

        model.addAttribute("studygroup", studyGroupVO);

        return "ModifyStudyGroup";
    }
    //수정 폼에서 전송된 데이터 처리
    @PostMapping("/study/updatestudygroup.do")
    public String submitUpdate(@Valid StudyGroupVO studyGroupVO,
                               BindingResult result,
                               HttpServletRequest request,
                               Model model) {
        logger.debug("<<글수정>> : " + studyGroupVO);

        //유효성 체크 결과 오류가 있으면 폼 호출
        if(result.hasErrors()) {
            //title 또는 content가 입력되지 않아 유효성 체크에
            //걸리면 파일 정보를 잃어버리기 때문에 품을
            //호출할 때 다시 셋팅해주어야 함.
            StudyGroupVO vo = studyGroupService.selectStudyGroup(
                    studyGroupVO.getStudy_num());
            //studyGroupVO.setFilename(vo.getFilename());
            return "ModifyStudyGroup";
        }

        //ip셋팅
        //boardVO.setIp(request.getRemoteAddr());
        //글수정
        studyGroupService.updateStudyGroup(studyGroupVO);

        //View에 표히살 메시지
        model.addAttribute("message", "수정 완료");
        model.addAttribute("url",
                request.getContextPath()+"/study/studydetail.do?study_num="+studyGroupVO.getStudy_num());

        return "common/resultView";
    }

    //==========스터디 방 삭제==========//
    @RequestMapping("/study/deletestudygroup.do")
    public String submitDelete(
            @RequestParam int study_num,
            Model model,
            HttpServletRequest request) {

        logger.debug("<<스터디 방 삭제>> : " + study_num);

        //글삭제
        studyGroupService.deleteStudyGroup(study_num);

        //View에 표시할 메시지
        model.addAttribute("message", "삭제 완료");
        model.addAttribute("url",
                request.getContextPath()+"/study/studygrouplist.do");

        return "common/resultView";
    }

}
