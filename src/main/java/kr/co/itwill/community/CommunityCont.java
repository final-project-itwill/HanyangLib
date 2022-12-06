package kr.co.itwill.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView();
        mav.addObject("newComm", commDao.newComm());
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


    @RequestMapping("/read/{c_code}")
    public ModelAndView read(@PathVariable String c_code){
        ModelAndView mav = new ModelAndView();
        mav.addObject("read", commDao.read(c_code));
        mav.addObject("acList", commDao.acList(c_code));
        mav.setViewName("community/read");
        return mav;
    }//read() end



}//class end
