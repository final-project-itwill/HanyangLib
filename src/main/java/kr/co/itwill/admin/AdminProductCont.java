package kr.co.itwill.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminProductCont {

    @RequestMapping("/productmain")
    public ModelAndView productDashBoard(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/productDashboard");
        return mav;
    }//dashBoard() end


    @RequestMapping("/productinsert")
    public ModelAndView productInsert(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/productInsert");
        return mav;
    }//dashBoard() end


    @RequestMapping("/productlist")
    public ModelAndView productList(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/productList");
        return mav;
    }//dashBoard() end


    @RequestMapping("/productinquiry")
    public ModelAndView productInquiry(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/productInquiry");
        return mav;
    }//dashBoard() end

}//class end
