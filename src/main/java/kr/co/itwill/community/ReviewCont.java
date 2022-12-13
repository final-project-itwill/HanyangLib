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
    public int InsertIntoCommunityActivity(@RequestParam String c_code, @RequestParam String cname,
                            @RequestParam String review, @RequestParam int manjok, @RequestParam String loginID) throws Exception{
        ReviewDTO dto = new ReviewDTO();
        dto.setAc_ccode(c_code);
        dto.setAc_cname(cname);
        dto.setAc_review(review);
        dto.setAc_manjok(manjok);
        dto.setAc_id(loginID);
        return reviewDAO.insertReview(dto);
    }//InsertIntoCommunityActivity() end


    @RequestMapping("/list")
    @ResponseBody
    private List<ReviewDTO> listReview(@RequestParam String c_code, Model model) throws Exception{
        return reviewDAO.listReview(c_code);
    }//listReview() end


    @RequestMapping("/delete/{ac_no}")
    @ResponseBody
    public int deleteReview(@PathVariable int ac_no) throws Exception{
        return reviewDAO.deleteReview(ac_no);
    }//deleteReview() end


    @RequestMapping("/update")
    @ResponseBody
    public int updateReview(@RequestParam int ac_no,
                            @RequestParam String review, @RequestParam int manjok) throws Exception{
        ReviewDTO dto = new ReviewDTO();
        dto.setAc_no(ac_no);
        dto.setAc_review(review);
        dto.setAc_manjok(manjok);
        return reviewDAO.updateReview(dto);
    }//updateReview() end


}//class end
