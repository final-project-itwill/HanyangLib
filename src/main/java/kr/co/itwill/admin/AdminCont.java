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

        return mav;
    }//dashboard() end


}//class end
