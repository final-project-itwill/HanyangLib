package kr.co.itwill.notice;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/notice")
public class NoticeCont {

    public NoticeCont(){
        System.out.println("-----NoticeCont()객체 생성됨");
    }//end

    @Autowired
    NoticeDAO noticeDao;


    //공지사항 목록
/*    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("notice/list");
        mav.addObject("list", noticeDao.list());
        return mav;
    }//list() end*/

    //페이징 있는 목록
    @RequestMapping("/list")
    public ModelAndView list(@RequestParam String pageNum)throws Exception{

        ModelAndView mav = new ModelAndView();
        mav.setViewName("notice/list");

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

    //공지사항 쓰기 페이지 호출
    @RequestMapping("/insert")
    public String create(){
        return "notice/createForm";
    }//create() end

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@ModelAttribute NoticeDTO dto){
        NoticeDTO notice = new NoticeDTO();
        notice.setN_type(dto.getN_type());
        notice.setN_title(dto.getN_title());
        notice.setN_content(dto.getN_content());
        notice.setN_writer(dto.getN_writer());

        noticeDao.insert(notice);

        return "redirect:/notice/list?pageNum=1";
    }//insert() end


    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(defaultValue = "") String keyword){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("notice/list");
        mav.addObject("keyword", keyword);
        mav.addObject("list", noticeDao.search(keyword));
        return mav;
    }//search() end


    @RequestMapping("/read")
    public ModelAndView read(@RequestParam int n_no){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("notice/read");
        mav.addObject("read", noticeDao.read(n_no));
        return mav;
    }//read() end


    @RequestMapping("/delete")
    public String delete(int n_no){
        noticeDao.delete(n_no);
        return "redirect:/notice/list?pageNum=1";
    }//delete() end


    @RequestMapping("/update")
    public ModelAndView update(@RequestParam int n_no){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("notice/update");
        mav.addObject("read", noticeDao.read(n_no));
        return mav;
    }//update() end


    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam int n_no, @ModelAttribute NoticeDTO dto){
        NoticeDTO notice = new NoticeDTO();

        notice.setN_no(n_no);
        notice.setN_type(dto.getN_type());
        notice.setN_title(dto.getN_title());
        notice.setN_content(dto.getN_content());

        noticeDao.update(notice);

        return "redirect:/notice/list?pageNum=1";     //행 수정 후 목록으로 이동
    }//update() end
       

}//class end
