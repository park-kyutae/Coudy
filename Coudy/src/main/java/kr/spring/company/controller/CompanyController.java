package kr.spring.company.controller;

import kr.spring.company.service.CompanyService;
import kr.spring.company.vo.CompanyVO;
import kr.spring.member.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public String submit(@Valid CompanyVO companyVO, HttpSession session, BindingResult result, Model model){
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
        return "comHome";
    }
}
