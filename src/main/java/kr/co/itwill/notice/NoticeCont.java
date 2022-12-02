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
    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("notice/list");
        mav.addObject("list", noticeDao.list());
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
        notice.setN_writer("webmaster"); //향후 session변수를 이용해 어떤 관리자가 작성했는지 DB에 저장 필요!

        noticeDao.insert(notice);

        return "redirect:/notice/list";
    }//insert() end


    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(defaultValue = "") String keyword){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("notice/list");
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
        return "redirect:/notice/list";
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

        return "redirect:/notice/list";     //행 수정 후 목록으로 이동
    }//update() end

}//class end
