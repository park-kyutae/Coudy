package kr.spring.company.controller;

import kr.spring.company.service.CompanyService;
import kr.spring.company.vo.CompanyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyController {
    @Autowired
    private CompanyService companyService;
    @ModelAttribute
    public CompanyVO initCommand(){ return new CompanyVO();}

    @RequestMapping("/company/comHome.do")
    public String home(){

        return "comHome";
    }

    @GetMapping("/company/insertCom.do")
    public String insert(){

        return "insertCom";
    }
}
