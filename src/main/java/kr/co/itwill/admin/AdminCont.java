package kr.co.itwill.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminCont {

    @Autowired
    AdminDAO adminDao;

    @RequestMapping("/dashboard")
    public ModelAndView dashboard(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/dashboard");

        mav.addObject("memberCnt", adminDao.countMemeber());    //한양서재 이용자 수
        mav.addObject("bookCnt", adminDao.countBook());         //총 책 권수
        mav.addObject("totalSales", adminDao.totalSales());     //총매출
        return mav;
    }//dashboard() end

    //이용자 관리
    @RequestMapping("/memberList")
    public ModelAndView listMember(){
        ModelAndView mav = new ModelAndView();
        mav.addObject("memberList", adminDao.listMember());
        mav.setViewName("admin/memberList");
        return mav;
    }//listMember() end

    @RequestMapping("/communityList")
    public ModelAndView listCommunity(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/communityList");
        mav.addObject("list", adminDao.listCommunity());
        return mav;
    }//listCommunity() end


}//class end
