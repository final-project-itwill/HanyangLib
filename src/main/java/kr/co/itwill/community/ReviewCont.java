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
@RequestMapping("/review")
public class ReviewCont {
    public ReviewCont(){
        System.out.println("-----ReviewCont() 객체 생성됨");
    }//end

    @Autowired
    ReviewDAO reviewDAO;

    @RequestMapping("/insert")
    @ResponseBody
    public int InsertIntoCommunityActivity(@RequestParam String ac_ccode, @RequestParam String ac_cname,
                            @RequestParam String ac_review, @RequestParam int ac_manjok, @RequestParam String ac_id) throws Exception{
        ReviewDTO dto = new ReviewDTO();
        dto.setAc_ccode(ac_ccode);
        dto.setAc_cname(ac_cname);
        dto.setAc_review(ac_review);
        dto.setAc_manjok(ac_manjok);
        dto.setAc_id(ac_id);
        return reviewDAO.InsertIntoCommunityActivity(dto);
    }//InsertIntoCommunityActivity() end


    @RequestMapping("/list")
    @ResponseBody
    private List<ReviewDTO> listActivity(@RequestParam String ac_ccode, Model model) throws Exception{
        return reviewDAO.listActivity(ac_ccode);
    }//listActivity() end


    @RequestMapping("/delete/{ac_no}")
    @ResponseBody
    public int deleteActivity(@PathVariable int ac_no) throws Exception{
        return reviewDAO.deleteActivity(ac_no);
    }//deleteActivity() end


    @RequestMapping("/update")
    @ResponseBody
    public int updateActivity(@RequestParam int ac_no,
                            @RequestParam String ac_review, @RequestParam int ac_manjok) throws Exception{
        ReviewDTO dto = new ReviewDTO();
        dto.setAc_no(ac_no);
        dto.setAc_review(ac_review);
        dto.setAc_manjok(ac_manjok);
        return reviewDAO.updateActivity(dto);
    }//openActivityUpdatePanel() end


}//class end
