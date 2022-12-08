package kr.co.itwill.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/commac")
public class CommacCont {
    public CommacCont(){
        System.out.println("-----CommacCont() 객체 생성됨");
    }//end

    @Autowired
    CommacDAO commacDao;

    @RequestMapping("/insert")
    @ResponseBody
    public int commacInsert(@RequestParam String ac_ccode, @RequestParam String ac_cname,
                            @RequestParam String ac_review, @RequestParam int ac_manjok) throws Exception{
        CommacDTO commac = new CommacDTO();
        commac.setAc_ccode(ac_ccode);
        commac.setAc_cname(ac_cname);
        commac.setAc_review(ac_review);
        commac.setAc_manjok(ac_manjok);
        commac.setAc_id("hanyihanyi");  //session으로 id 갖고오기
        return commacDao.commacInsert(commac);
    }//commacInsert() end


    @RequestMapping("/list")
    @ResponseBody
    private List<CommacDTO> commacList(@RequestParam String ac_ccode, Model model) throws Exception{
        return commacDao.commacList(ac_ccode);
    }//commacList() end


    @RequestMapping("/delete/{ac_no}")
    @ResponseBody
    public int commacDelete(@PathVariable int ac_no) throws Exception{
        return commacDao.commacDelete(ac_no);
    }//commacDelete() end


    @RequestMapping("/update")
    @ResponseBody
    public int commacUpdate(@RequestParam int ac_no,
                            @RequestParam String ac_review, @RequestParam int ac_manjok) throws Exception{
        CommacDTO commac = new CommacDTO();
        commac.setAc_no(ac_no);
        commac.setAc_review(ac_review);
        commac.setAc_manjok(ac_manjok);
        return commacDao.commacUpdate(commac);
    }//commacUpdate() end


}//class end
