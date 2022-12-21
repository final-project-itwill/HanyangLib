package kr.co.itwill.community;

import kr.co.itwill.notice.NoticeDTO;
import kr.co.itwill.survey.SurveyDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/comm")
public class CommunityCont {

    public CommunityCont(){
        System.out.println("-----CommunityCont() 객체 생성됨");
    }//end

    @Autowired
    CommunityDAO commDao;

    @Autowired
    ReviewDAO reviewDAO;
    
    @Autowired
    SurveyDAO surveyDAO;


    @RequestMapping("/index")
    public ModelAndView index(HttpSession session){
        ModelAndView mav = new ModelAndView();
        mav.addObject("newComm", commDao.newComm());             //최신 커뮤니티 3개 출력
        mav.addObject("mdPick", commDao.mdPick());               //MD Pick 3개 출력

        String loginID = (String) session.getAttribute("s_id");           //로그인id
        mav.addObject("listMylib", commDao.listMylib(loginID));  //커뮤니티 생성시 내서재 조회하기
        mav.setViewName("community/commindex");
        return mav;
    }//index() end


    //페이징 없는 목록
/*    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("community/list");
        mav.addObject("list", commDao.list());
        return mav;
    }//list()*/


    //페이징 있는 목록
    @RequestMapping("/list")
    public ModelAndView list(@RequestParam String pageNum){

        ModelAndView mav = new ModelAndView();
        mav.setViewName("community/list");

        int totalRowCount = commDao.totalRowCount();    //총 행 갯수

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

        BookReadDTO rows = new BookReadDTO();
        rows.setStartRow(startRow);
        rows.setEndRow(endRow);

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("rows", rows);
        mav.addObject("list", commDao.list(rows));
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
    public ModelAndView read(@PathVariable String c_code, HttpSession session){
        ModelAndView mav = new ModelAndView();

        String loginID = (String)session.getAttribute("s_id");

        mav.addObject("read", commDao.read(c_code));
        mav.setViewName("community/read");

        //loginID 커뮤니티 가입 상태 확인하기
        CommSignDTO sign = new CommSignDTO();
        sign.setS_id(loginID);
        sign.setS_code(c_code);
        mav.addObject("checkID", commDao.checkID(sign));

        mav.addObject("checkOwner", commDao.checkOwner(c_code));    //커뮤니티장 확인하기
        mav.addObject("checkMember", commDao.checkMember(c_code));  //커뮤니티 구성원 확인
        mav.addObject("memberCnt", commDao.memberCnt(c_code));

        mav.addObject("reviewCnt", commDao.reviewCnt(c_code));
        return mav;
    }//read() end


//    //커뮤니티 가입 신청 (설문지랑 연결해야 함)
//    @RequestMapping("/signupForm")
//    public String signupForm(){
//        return "community/signupForm";
//    }//signupForm() end

    //커뮤니티 생성하기
    @RequestMapping("/createForm/{b_code}")
    public ModelAndView createForm(@PathVariable String b_code){

        ModelAndView mav = new ModelAndView();
        mav.addObject("readBook", commDao.readBook(b_code));
        mav.addObject("createCode", commDao.createCode());
        mav.addObject("list", commDao.list1());
//        List<BookReadDTO> test = commDao.list();
//        for(int i=0; i<test.size(); i++){
//            System.out.println(test);
//        }
        mav.setViewName("community/createForm");
        return mav;
    }//createForm() end


    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public ModelAndView createForm(@ModelAttribute CommunityDTO dto, HttpServletRequest request) throws Exception{
        //파일명 리네임 구현 안 했음.
        ModelAndView mav = new ModelAndView();

        //저장 폴더의 실제 경로 가져오기
        ServletContext application = request.getSession().getServletContext();
        String path = application.getRealPath("/storage");

        //<input type="file" name="poster">
        MultipartFile poster = dto.getPoster();                         //파일 가져오기
        String filename = poster.getOriginalFilename();                 //파일 이름 가져오기
        if(poster == null || poster.isEmpty()){                         //파일 없을 경우 기본 이미지
            filename = "none.jpg";
        }//if end
        poster.transferTo(new File(path + "/" + filename));    // /storage 폴더에 파일 저장

        dto.setC_banner(filename);

        dto.setC_code(dto.getC_code());
        dto.setC_name(dto.getC_name());
        dto.setC_des(dto.getC_des());
        dto.setC_bcode(dto.getC_bcode());
        dto.setC_local(dto.getC_local());
        dto.setC_id(dto.getC_id());
        dto.setC_chat(dto.getC_chat());
        dto.setC_count(dto.getC_count());

        mav.addObject("community", commDao.insert(dto));
        mav.setViewName("redirect:/comm/index");    //메인으로 돌아가기
        return mav;
    }//createForm() end


    @RequestMapping("/delete/{c_code}")
    public String delete(@PathVariable String c_code, HttpServletRequest request){

        String filename = commDao.filename(c_code); //삭제할 파일이름 조회
        if(!filename.equals("none.jpg")){
            ServletContext application = request.getSession().getServletContext();
            String path = application.getRealPath("/storage");
            File file = new File(path + "/" + filename);
            if(file.exists()){
                file.delete();
            }//file() end
        }//if end

        commDao.delete(c_code);
        return "redirect:/comm/index";
    }//delete() end


    @RequestMapping("/update/{c_code}")
    public ModelAndView update(@PathVariable String c_code){
        ModelAndView mav = new ModelAndView();
        mav.addObject("read", commDao.read(c_code));
        mav.setViewName("community/update");

        // 설문지 코드 생성
        mav.addObject("sv_code", surveyDAO.scodeget(c_code));
        return mav;
    }//update() end

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView update(@ModelAttribute CommunityDTO dto, HttpServletRequest request) throws Exception{

        ModelAndView mav = new ModelAndView();


        //기존 저장된 정보 가져오기
        BookReadDTO oldDTO = commDao.read(dto.getC_code());

        String filename = "";
        //파일을 수정할 것인지?
        MultipartFile poster = dto.getPoster();         //파일 가져오기
        if(poster.getSize() > 0){                       //새파일이 업로드 되었다면
             filename = poster.getOriginalFilename();   //새로운 파일명

            try {
                //저장 폴더의 실제 경로 가져오기
                ServletContext application = request.getSession().getServletContext();
                String path = application.getRealPath("/storage");
                poster.transferTo(new File(path + "/" + filename));   //신규로 전송된 파일 저장
                dto.setC_banner(filename);                                     //리네임된 파일명 dto에 담기

                String oldFilename = oldDTO.getC_banner();                     //old파일 /storage에서 삭제하기
                File oldFile = new File(path + "/" + oldFilename);
                if(oldFile.exists()){
                    oldFile.delete();
                }//file() end

            }catch (Exception e){
                e.printStackTrace();
            }//try end

        }else {                                         //파일 수정 안 할 경우
            filename = oldDTO.getC_banner();            //oldDTO에서 파일이름 가져오기
            dto.setC_banner(oldDTO.getC_banner());      //기존파일이름 dto에 담기
        }//if end

        dto.setC_code(dto.getC_code());
        dto.setC_name(dto.getC_name());
        dto.setC_des(dto.getC_des());
        dto.setC_local(dto.getC_local());
        dto.setC_chat(dto.getC_chat());
        dto.setC_count(dto.getC_count());

        mav.addObject("update", commDao.update(dto));
        mav.setViewName("redirect:/comm/admin"); //수정 필요 : 관리자 페이지로 이동
        return mav;
    }//update() end


    /*
    *  review 후기 CRUD (ajax 더보기)
    *
    * */

    @RequestMapping("/reviewinsert")
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


    @RequestMapping("/reviewlist")
    @ResponseBody
    private List<ReviewDTO> listReview(@RequestParam String c_code, @RequestParam int limit) throws Exception{
        ReviewDTO dto = new ReviewDTO();
        dto.setAc_ccode(c_code);
        dto.setLimit(limit);
        return reviewDAO.listReview(dto);
    }//listReview() end


    @RequestMapping("/reviewdelete/{ac_no}")
    @ResponseBody
    public int deleteReview(@PathVariable int ac_no) throws Exception{
        return reviewDAO.deleteReview(ac_no);
    }//deleteReview() end


    @RequestMapping("/reviewupdate")
    @ResponseBody
    public int updateReview(@RequestParam int ac_no,
                            @RequestParam String review, @RequestParam int manjok) throws Exception{
        ReviewDTO dto = new ReviewDTO();
        dto.setAc_no(ac_no);
        dto.setAc_review(review);
        dto.setAc_manjok(manjok);
        return reviewDAO.updateReview(dto);
    }//updateReview() end



    /*
    * 관리자 페이지 관련 컨트롤러
    *
    * */

    @RequestMapping("/admin/{c_code}")
    public ModelAndView admin(@PathVariable String c_code){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("community/adminIndex");
        mav.addObject("read", commDao.read(c_code));
        mav.addObject("star", commDao.star(c_code));
        mav.addObject("reviewCnt", commDao.reviewCnt(c_code));
        mav.addObject("checkOwner", commDao.checkOwner(c_code));
        
        // 설문지 코드 생성
        mav.addObject("sv_code", surveyDAO.scodeget(c_code));
        return mav;
    }//admin() end

    // 1. 구성원 관리 페이지
    @RequestMapping("/adminmember/{c_code}")
    public ModelAndView adminMember(@PathVariable String c_code){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("community/adminMember");

        mav.addObject("read", commDao.read(c_code));
        mav.addObject("approvedMember", commDao.approvedMember(c_code));
        mav.addObject("waitingMember", commDao.waitingMember(c_code));
        mav.addObject("checkOwner", commDao.checkOwner(c_code));
        
        // 설문지 코드 생성
        mav.addObject("c_code", c_code);
        mav.addObject("sv_code", surveyDAO.scodeget(c_code));
        return mav;
    }//adminMember() end

    // 2. 설문지 관련 페이지
    @RequestMapping("/chart/{c_code}")
    public ModelAndView surveyChart(@PathVariable String c_code){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("community/surveyChart");

        mav.addObject("read", commDao.read(c_code));
        mav.addObject("checkOwner", commDao.checkOwner(c_code));
        
        // 설문지 코드 생성
        mav.addObject("sv_code", surveyDAO.scodeget(c_code));
        return mav;
    }//surveyChart() end


    // 3. 가입 승인/거절
    @RequestMapping(value = "/adminupdate/{c_code}", method = RequestMethod.POST)
    public String approveMember(@PathVariable String c_code, HttpServletRequest req){

        String[] chkArray = req.getParameterValues("chkList");

        List<CommSignDTO> updateList = new ArrayList<>();

        for(int i=0; i<chkArray.length; i++){
            //String ac_no = chkArray[i];
            //System.out.println(ac_no);

            CommSignDTO dto = new CommSignDTO();
            dto.setS_id(chkArray[i]);
            dto.setS_code(c_code);
            updateList.add(dto);
        }//for end
        commDao.updateMember(updateList);
        return "redirect:/comm/adminmember/"+c_code;
    }//approveMember() end


    @RequestMapping(value = "/adminreject/{c_code}", method = RequestMethod.POST)
    public String rejectMember(@PathVariable String c_code, HttpServletRequest req){

        String[] chkArray = req.getParameterValues("chkList");

        List<CommSignDTO> updateList = new ArrayList<>();

        for(int i=0; i<chkArray.length; i++){
            CommSignDTO dto = new CommSignDTO();
            dto.setS_id(chkArray[i]);
            dto.setS_code(c_code);
            updateList.add(dto);
        }//for end
        commDao.rejectMember(updateList);
        return "redirect:/comm/adminmember/"+c_code;
    }//approveMember() end

}//class end
