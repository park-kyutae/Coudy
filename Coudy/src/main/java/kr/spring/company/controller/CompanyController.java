package kr.spring.company.controller;

import kr.spring.company.service.CompanyService;
import kr.spring.company.vo.CompanyVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class CompanyController {
    private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
    @Autowired
    private CompanyService companyService;
    @ModelAttribute
    public CompanyVO initCommand(){ return new CompanyVO();}

    @RequestMapping("/company/comHome.do")
    public String home(){

        return "comHome";
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
        CompanyVO user = (CompanyVO) session.getAttribute("user");
        companyVO.setMem_num(user.getMem_num());
        companyService.insertCompany(companyVO);

        model.addAttribute(companyVO);
        return "comHome";
    }
}
