package kr.spring.company.controller;

import kr.spring.company.service.CompanyService;
import kr.spring.company.vo.CompanyScrapVO;
import kr.spring.company.vo.CompanyVO;
import kr.spring.member.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
    public Map<String,Object> scrap(HttpSession session,HttpServletRequest request, CompanyScrapVO companyScrapVO){

        Map<String,Object> map = new HashMap<String,Object>();

        MemberVO user = (MemberVO) session.getAttribute("user");
        if(user == null){
            map.put("result","logout");
        }else {
            int com_num = Integer.parseInt(request.getParameter("com_num"));
            companyScrapVO.setCom_num(com_num);
            companyScrapVO.setMem_num(user.getMem_num());

            int count= companyService.selectScrapCount(com_num, user.getMem_num());
            CompanyScrapVO scrapVO = companyService.selectScrap(companyScrapVO);

            logger.debug("<<젱랴부자우람ㄴ위ㅏㄹㅇ>>"+count);
            logger.debug("<<scrapVO 뺴온정보 scrapnum 잘있나?>>"+scrapVO);
            if (scrapVO == null) {
                companyService.insertScrap(companyScrapVO);
                map.put("result","success");
                map.put("status","yesScrap");
            }else{
                companyService.deleteScrap(scrapVO.getScrap_num());
                map.put("result","success");
                map.put("status","noScrap");
            }

        }
        return map;
    }

    @RequestMapping("/company/getScrap.do")
    @ResponseBody
    public Map<String,Object> getScrap(CompanyScrapVO companyScrapVO,HttpSession session){

        Map<String,Object> map = new HashMap<String, Object>();
        MemberVO user = (MemberVO) session.getAttribute("user");
        if(user == null){
            map.put("status","noScrap");
        }else{
            companyScrapVO.setMem_num(user.getMem_num());

            CompanyScrapVO scrapVO = companyService.selectScrap(companyScrapVO);

            if(scrapVO != null){//스크랩 등록 불가능

            }else {//스크랩등록 가능

            }

        }



        return map;
    }

}
