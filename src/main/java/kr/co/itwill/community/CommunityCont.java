package kr.co.itwill.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/comm")
public class CommunityCont {

    public CommunityCont(){
        System.out.println("-----CommunityCont() 객체 생성됨");
    }//end

    @Autowired
    CommunityDAO commDao;


    @RequestMapping("/index")
    public ModelAndView index(@RequestParam String loginID){
        ModelAndView mav = new ModelAndView();
        mav.addObject("newComm", commDao.newComm());
        //mav.addObject("listMylib", commDao.listMylib(loginID));    //커뮤니티 생성시 내서재 조회하기
        mav.setViewName("community/commindex");
        return mav;
    }//index() end


    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("community/list");
        mav.addObject("list", commDao.list());
        return mav;
    }//list() end

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(defaultValue = "") String keyword){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("community/list");
        mav.addObject("keyword", keyword);
        mav.addObject("list", commDao.search(keyword));
        return mav;
    }//search() end


    @RequestMapping("/read")
    public ModelAndView read(@RequestParam String c_code, @RequestParam String loginID){
        ModelAndView mav = new ModelAndView();
        mav.addObject("loginID", loginID);
        //mav.addObject("c_code", c_code);
        mav.addObject("read", commDao.read(c_code));
        mav.addObject("acList", commDao.acList(c_code));
        mav.addObject("commCheck", commDao.commCheck(c_code));
        CommSignDTO sign = new CommSignDTO();
        sign.setS_code(c_code);
        sign.setS_id(loginID);
        mav.addObject("sign", sign);
        mav.addObject("idCheck", commDao.idCheck(sign));
        mav.setViewName("community/read");
        return mav;
    }//read() end


    //커뮤니티 가입 신청 (설문지랑 연결해야 함)
    @RequestMapping("/signupForm")
    public String signupForm(){
        return "community/signupForm";
    }//signupForm() end

    //커뮤니티 생성하기
    @RequestMapping("/createForm")
    public String createForm(){
        return "community/createForm";
    }//createForm() end


}//class end
