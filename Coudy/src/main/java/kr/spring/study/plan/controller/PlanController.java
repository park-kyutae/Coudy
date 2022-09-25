package kr.spring.study.plan.controller;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.study.plan.artgumentResolver.Login;
import kr.spring.study.plan.testUtil.MemberTest;
import kr.spring.study.plan.testUtil.StudyTest;
import kr.spring.study.studygroup.service.StudyGroupService;
import kr.spring.study.studygroup.service.StudyUserService;
import kr.spring.study.studygroup.vo.StudyGroupVO;
import kr.spring.study.studygroup.vo.StudyUserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.awt.image.ImageProducer;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("study/plan")
@Slf4j
@RequiredArgsConstructor
public class PlanController {
    private final StudyUserService studyUserService;

    @GetMapping("/{studyNum}")
    public String planMain(@Login MemberVO member, Model model,@PathVariable Integer studyNum) {

        //member가 스터디에 속해 있는지 검사
        //현재 접속한 스터디 유저 정보(팀장인지)
        //해당 스터디에 있는 사람 조회
        List<StudyUserForm> studyUserForms = StudyTest.findStudyUsers().stream()
                .map(x -> new StudyUserForm(x, MemberTest.getMemberName(x)))
                .collect(Collectors.toList());

        StudyUserVO studyUser = studyUserService.selectStudyUser(studyNum, member.getMem_num());

        model.addAttribute("studyUser", studyUser);
        model.addAttribute("studyUserForms", studyUserForms);

        log.info("studyUser = {}", studyUser);
        return "plan";
    }


}
