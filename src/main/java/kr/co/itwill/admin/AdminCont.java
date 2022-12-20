package kr.co.itwill.admin;

import kr.co.itwill.community.CommunityUnionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

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
    @ResponseBody
    public ModelAndView listCommunity(@RequestParam(defaultValue = "전체보기") String filter) {

        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/communityList");

        System.out.println("filter>>"+filter);

        String c_state = "i, d, e";
        if(filter.equals("전체보기")){
            c_state = "i, d, e";
        }else if(filter.equals("모집중")){
            c_state = "i";
        }else if(filter.equals("모집완료")){
            c_state = "d";
        }else if(filter.equals("활동완료")){
            c_state = "e";
        }//if end

        System.out.println("c_state>>"+c_state);

        mav.addObject("communityList", adminDao.listCommunity(c_state));
        return mav;
    }//listCommunity() end



}//class end
