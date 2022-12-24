package kr.co.itwill.admin;

import kr.co.itwill.community.CommunityDAO;
import kr.co.itwill.community.CommunityDTO;
import kr.co.itwill.community.CommunityUnionDTO;
import kr.co.itwill.inquiry.InquiryDAO;
import kr.co.itwill.inquiry.ResponseDTO;
import kr.co.itwill.notice.NoticeDAO;
import kr.co.itwill.notice.NoticeDTO;
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

    @Autowired
    NoticeDAO noticeDao;

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


    //1:1문의 답변 대기중인 목록
    @RequestMapping("/response")
    public ModelAndView listInquiry(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/inquiryList");
        mav.addObject("inquiryList", inquiryDao.listInquiry());
        return mav;
    }//listInquiry()

    //1:1문의 답변 insert
    @RequestMapping("/insertResponse/{ask_no}")
    public String insertResponse(@PathVariable int ask_no, @RequestParam String ans_content){

//        System.out.println(ans_content);
//        System.out.println(ask_no);

        ResponseDTO answer = new ResponseDTO();
        answer.setAns_no(ask_no);
        answer.setAns_content(ans_content);
        inquiryDao.insertResponse(answer);
        return "redirect:/admin/response";
    }//insertResponse() end

    //1:1 문의 답변 수정페이지
    @RequestMapping("/listResponse")
    public ModelAndView listResponse(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/responseList");
        mav.addObject("responseList", inquiryDao.listResponse());
        return mav;
    }//listResponse() end


    //공지사항 insert
    @RequestMapping("/insertNotice")
    public String insertNotice(){
        return "admin/noticeInsert";
    }//insertNotice() end

    //공지사항 list
    @RequestMapping("/listNotice")
    public ModelAndView list(@RequestParam String pageNum)throws Exception{

        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/noticeList");

        int totalRowCount = noticeDao.totalRowCount();  //총 행 갯수

        //페이징
        int numPerPage   = 5;   //한 페이지당 행 갯수
        int pagePerBlock = 10;  //페이지 리스트(1~10페이지 : 1세트에 10페이지)

        if(pageNum == null){    //페이징 번호의 a태그 명령어 ? 뒤에서 받아옴
            pageNum = "1";      //자료가 없으면 무조건 1페이지
        }

        int currentPage = Integer.parseInt(pageNum);        //현재 2페이지라면,
        int startRow    = (currentPage-1)*numPerPage+1;     //시작 rnum은 6
        int endRow      = currentPage * numPerPage;         //끝 rnum은 10

        //페이지 수
        double totcnt = (double)totalRowCount/numPerPage;   //총 페이지수 = 글갯수/5
        int totalPage = (int)Math.ceil(totcnt);             //올림해서 정수형으로 변환

        //페이지가 10이 넘어가면 11~20 페이지가 나와야 함(2세트)
        double d_page = (double)currentPage/pagePerBlock;   //12페이지라면, 1.2
        int Pages     = (int)Math.ceil(d_page) - 1;         //1
        int startPage = Pages * pagePerBlock + 1;           //11
        int endPage   = startPage + pagePerBlock - 1;       //20

        NoticeDTO rows = new NoticeDTO();
        rows.setStartRow(startRow);
        rows.setEndRow(endRow);

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("rows", rows);
        mav.addObject("list", noticeDao.list(rows));

        return mav;
    }//list() end

    //공지사항 read
    @RequestMapping("/readNotice/{n_no}")
    public ModelAndView readNotice(@PathVariable int n_no){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/noticeRead");
        mav.addObject("read", noticeDao.read(n_no));
        return mav;
    }//readNotice() end

}//class end
