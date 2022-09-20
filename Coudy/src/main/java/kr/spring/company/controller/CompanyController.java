package kr.spring.company.controller;

import kr.spring.company.service.CompanyService;
import kr.spring.company.vo.CompanyResumeVO;
import kr.spring.company.vo.CompanyVO;
import kr.spring.member.vo.MemberVO;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class CompanyController {
    private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
    @Autowired
    private CompanyService companyService;
    @ModelAttribute
    public CompanyVO initCommand(){ return new CompanyVO();}

    @RequestMapping("/company/comHome.do")
    public ModelAndView home(HttpSession session){
        ModelAndView mav = new ModelAndView();

        MemberVO user = (MemberVO) session.getAttribute("user");

        Map<String,Object> map = new HashMap<String, Object>();
        int count = companyService.selectListCount();
        logger.debug("<<count : >>"+ count);

        List<CompanyVO> list = null;
        if(count>0){
            list = companyService.selectList(map);
        }
        mav.addObject("user",user);
        logger.debug("<<user>>"+user);
        mav.addObject("list",list);
        mav.addObject("count",count);
        mav.setViewName("comHome");
        return mav;
    }
    //=========이미지 출력=========//
    @RequestMapping("/company/imageView.do")
    public ModelAndView viewImage(
            @RequestParam int com_num,
            @RequestParam int com_type) {

        CompanyVO company = companyService.selectCompany(com_num);

        ModelAndView mav = new ModelAndView();
        //뷰 이름
        mav.setViewName("imageView");

        if(com_type==1) {//
            mav.addObject("imageFile", company.getCom_photo());
            mav.addObject("filename", company.getCom_filename());
        }else if(com_type==2) {//업로드된 이미지
            mav.addObject("imageFile", company.getCom_photo());
            mav.addObject("filename", company.getCom_filename());
        }
        return mav;
    }

    @GetMapping("/company/insertCom.do")
    public String form(){
        return "insertCom";
    }

    @PostMapping("/company/insertCom.do")
    public String submit(@Valid CompanyVO companyVO, HttpSession session,HttpServletRequest request, BindingResult result, Model model){
        logger.debug("<<companyVO>> : "+companyVO);

        if(result.hasErrors()){
            return form();
        }
        MemberVO user = (MemberVO) session.getAttribute("user");
        logger.debug("<<user>>"+user);
        companyVO.setMem_num(user.getMem_num());
        companyService.insertCompany(companyVO);
        logger.debug("<<user>>성공성곳엄라우니ㅏ룸ㄴ이ㅏㅜ리ㅏㅜㄴㅁㅇ룽"+user);
        model.addAttribute(companyVO);
        model.addAttribute("message","추가가 완료되었습니다.");
        model.addAttribute("url",request.getContextPath() + "/company/comHome.do");
        return "/common/resultView";
    }

    @RequestMapping("/company/comDetail.do")
    public ModelAndView detail(@RequestParam int com_num, HttpSession session){
        logger.debug("<<companyNum : >>"+com_num);

        companyService.updateHit(com_num);
//        ModelAndView mav = new ModelAndView();

        CompanyVO companyVO = companyService.selectCompany(com_num);
        companyVO.setCom_title(StringUtil.useNoHtml(companyVO.getCom_title()));

        session.setAttribute("company",companyVO);

        return new ModelAndView ("comView","companyVO",companyVO);
    }

    @GetMapping("/company/resume.do")
    public String resumeForm(Model model, HttpSession session, HttpServletRequest request){

        MemberVO user = (MemberVO) session.getAttribute("user");
        CompanyVO company = (CompanyVO) session.getAttribute("company");


        model.addAttribute("companyVO",company);
        return "resumeForm";
    }
    @PostMapping("/company/resume.do")
    public String resumeSubmit(@Valid CompanyResumeVO companyResumeVO,HttpSession session,Model model,HttpServletRequest request){

        MemberVO user = (MemberVO) session.getAttribute("user");
        CompanyVO company = (CompanyVO) session.getAttribute("company");
        companyResumeVO.setMem_num(user.getMem_num());
        companyResumeVO.setMem_name(user.getName());
        companyResumeVO.setCom_num(company.getCom_num());


        companyService.insertResume(companyResumeVO);
        logger.debug("<<이력서 첨부 파일>>"+companyResumeVO);
        model.addAttribute("message","추가가 완료되었습니다.");

        return "/company/resultCompany";
    }

    @RequestMapping("/company/managerHome.do")
    public ModelAndView managerList(HttpSession session,Model model){
        ModelAndView mav = new ModelAndView();
        MemberVO user = (MemberVO) session.getAttribute("user");

        List<CompanyResumeVO> list = null;
        list = companyService.resumeList(user.getMem_num());

        mav.setViewName("managerList");
        mav.addObject("list",list);

        return mav;
    }
    @RequestMapping("/company/file.do")
    public ModelAndView download(
            @RequestParam int resume_num) {

        CompanyResumeVO companyResumeVO = companyService.selectResume(resume_num);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("downloadView");
        mav.addObject("downloadFile",
                companyResumeVO.getUploadfile());
        mav.addObject("filename",
                companyResumeVO.getFilename());

        return mav;
    }

    @RequestMapping("/company/myResume.do")
    public ModelAndView myResume(HttpSession session,Model model){
        ModelAndView mav = new ModelAndView();
        MemberVO user = (MemberVO) session.getAttribute("user");
        List<CompanyResumeVO> list = null;
        list = companyService.myResumeList(user.getMem_num());
        mav.addObject("list",list);
        mav.setViewName("myResume");


        return mav;
    }
}
