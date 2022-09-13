package kr.spring.company.controller;

import kr.spring.company.service.CompanyService;
import kr.spring.company.vo.CompanyScrapVO;
import kr.spring.company.vo.CompanyVO;
import kr.spring.member.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CompanyAjaxController {
    private static final Logger logger = LoggerFactory.getLogger(CompanyAjaxController.class);

    @Autowired
    private CompanyService companyService;

    @RequestMapping("/company/scrap.do")
    @ResponseBody
    public Map<String,Object> scrap(HttpSession session, CompanyScrapVO companyScrapVO){
        logger.debug("<<scrap>> : "+companyScrapVO);

        Map<String,Object> map = new HashMap<String,Object>();

        MemberVO user = (MemberVO) session.getAttribute("user");
        if(user == null){
            map.put("result","logout");
        }else {
            companyScrapVO.setMem_num(user.getMem_num());
            companyService.insertScrap(companyScrapVO);

            map.put("result","success");
        }
        return map;
    }


}
