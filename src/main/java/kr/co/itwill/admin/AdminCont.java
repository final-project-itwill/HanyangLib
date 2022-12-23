package kr.co.itwill.admin;

import kr.co.itwill.community.CommunityDAO;
import kr.co.itwill.community.CommunityDTO;
import kr.co.itwill.community.CommunityUnionDTO;
import kr.co.itwill.inquiry.InquiryDAO;
import kr.co.itwill.inquiry.ResponseDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminCont {

    @Autowired
    AdminDAO adminDao;

    @Autowired
    CommunityDAO communityDao;

    @Autowired
    InquiryDAO inquiryDao;

    @RequestMapping("/dashboard")
    public ModelAndView dashboard(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/dashboard");

        mav.addObject("communityCnt", communityDao.totalRowCount());    //커뮤니티 총 갯수
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
        mav.addObject("mdPick", communityDao.mdPick());
        mav.setViewName("admin/communityList");
        return mav;
    }//listCommunity() end


    @RequestMapping("/ajaxlist")
    @ResponseBody
    public List<CommunityUnionDTO> listCommunity(@RequestParam(defaultValue = "all") String c_state) {
        //System.out.println("c_state>>>>>" + c_state);
        return adminDao.listCommunity(c_state);
    }//listCommunity() end


    //MD Pick 칼럼 update
    @RequestMapping(value = "/pickUpdate", method = RequestMethod.POST)
    public String updatePick(HttpServletRequest req){

        adminDao.allNull();

        String[] chkArray = req.getParameterValues("mdList");

        List<CommunityDTO> mdList = new ArrayList<>();

        for(int i=0; i<chkArray.length; i++){
            String c_code = chkArray[i];
            System.out.println(c_code);

            CommunityDTO dto = new CommunityDTO();
            dto.setC_code(chkArray[i]);

            mdList.add(dto);
        }//for end
        adminDao.updatePick(mdList);
        return "admin/communityList";
    }//updatePick() end


    @RequestMapping("/response")
    public ModelAndView listInquiry(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/inquiryList");
        mav.addObject("inquiryList", inquiryDao.listInquiry());
        return mav;
    }//listInquiry()

    @RequestMapping("/insertResponse/{ask_no}")
    public String insertResponse(@PathVariable int ask_no, @RequestParam String ans_content){

        System.out.println(ans_content);
        System.out.println(ask_no);

        ResponseDTO answer = new ResponseDTO();
        answer.setAns_no(ask_no);
        answer.setAns_content(ans_content);
        inquiryDao.insertResponse(answer);
        return "admin/inquiryList";
    }//insertResponse() end



}//class end
