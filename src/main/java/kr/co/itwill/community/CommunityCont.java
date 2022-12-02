package kr.co.itwill.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comm")
public class CommunityCont {

    public CommunityCont(){
        System.out.println("-----CommunityCont() 객체 생성됨");
    }//end

    @Autowired
    CommunityDAO commDao;


    @RequestMapping("/index")
    public String index(){
        return "community/commindex";
    }//index() end


    @RequestMapping("/list")
    public String list(){
        return "community/list";
    }//list() end


    @RequestMapping("/read")
    public String read(){
        return "community/read";
    }//read() end

}//class end
