package kr.co.itwill.mylib;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.itwill.book.BookDAO;
import kr.co.itwill.member.MemberDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.notice.NoticeDTO;

@RequestMapping("/mylib")
@Controller
public class MylibCont {

	public MylibCont() {
		System.out.println("-----MylibCont() 객체 생성됨");
	} // end
	
	@Autowired
	MylibDAO mylibDao;
	
	@Autowired
	VisitorDAO visitorDao;

	@Autowired
	BookDAO bookDao;
	
	@RequestMapping("/libindex/{lib_id}")
	public ModelAndView read(@PathVariable String lib_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mylib/libindex");
		mav.addObject("bookCount", mylibDao.getCount(lib_id));
		mav.addObject("book80Count", mylibDao.get80Count(lib_id));
		mav.addObject("libInfo", mylibDao.getLibInfo(lib_id));
		mav.addObject("libRead", mylibDao.getLibRead(lib_id));
		mav.addObject("libThree", mylibDao.getLibThree(lib_id));
		mav.addObject("commuRead", mylibDao.getCommuRead(lib_id));
		mav.addObject("review", mylibDao.getReviewList(lib_id));
		mav.addObject("review5", mylibDao.getReviewList5(lib_id));
		mav.addObject("vsCount", visitorDao.getVsCount(lib_id));
		mav.addObject("lib_id", lib_id);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/vsinsert")
	private int vsInsert(@RequestParam String vis_pid, @RequestParam String vis_myid, @RequestParam String content, HttpServletRequest req) throws Exception {
		VisitorDTO visitor = new VisitorDTO();
	    visitor.setVis_pid(vis_pid);
	    visitor.setVis_content(content);
	    visitor.setVis_myid(vis_myid);
	    return visitorDao.visitorInsert(visitor);
	} // vsInsert() end
	
	@RequestMapping("/vslist")
	@ResponseBody
	private List<VisitorDTO> vsList(@RequestParam String vis_pid, @RequestParam int limit) throws Exception {
		VisitorDTO dto = new VisitorDTO();
		dto.setVis_pid(vis_pid);
		dto.setLimit(limit);
	    return visitorDao.visitorList(dto);
	} // vsList() end
		
	@ResponseBody
	@RequestMapping("/vsupdate")
	private int vsUpdate(@RequestParam int vis_no, @RequestParam String content) throws Exception {
	    VisitorDTO visitor = new VisitorDTO();
	    visitor.setVis_no(vis_no);
	    visitor.setVis_content(content);
	    return visitorDao.visitorUpdate(visitor);
	} // mCommentServiceInsert() end
	
	@RequestMapping("/delete/{vis_no}")
	@ResponseBody
	private int vsDelete(@PathVariable int vis_no) throws Exception {
	    return visitorDao.visitorDelete(vis_no);
	} // mCommentServiceDelete() end
	
	@RequestMapping("/myBooks/{lib_id}")
	public ModelAndView myBooks(@PathVariable String lib_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mylib/myBooks");
		mav.addObject("libRead", mylibDao.getLibRead(lib_id));
		mav.addObject("bookCount", mylibDao.getCount(lib_id));
		mav.addObject("book80Count", mylibDao.get80Count(lib_id));
		mav.addObject("libInfo", mylibDao.getLibInfo(lib_id));
		mav.addObject("lib_id", lib_id);
		return mav;
	}
	
	@RequestMapping("/myComm/{lib_id}")
	public ModelAndView myComm(@PathVariable String lib_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mylib/myComm");
		mav.addObject("libRead", mylibDao.getLibRead(lib_id));
		mav.addObject("bookCount", mylibDao.getCount(lib_id));
		mav.addObject("book80Count", mylibDao.get80Count(lib_id));
		mav.addObject("libInfo", mylibDao.getLibInfo(lib_id));
		mav.addObject("commuRead", mylibDao.getCommuRead(lib_id));
		mav.addObject("lib_id", lib_id);
		return mav;
	}
	
	@RequestMapping("/myReview/{lib_id}")
	public ModelAndView myReview(@PathVariable String lib_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mylib/myReview");
		mav.addObject("libRead", mylibDao.getLibRead(lib_id));
		mav.addObject("bookCount", mylibDao.getCount(lib_id));
		mav.addObject("book80Count", mylibDao.get80Count(lib_id));
		mav.addObject("libInfo", mylibDao.getLibInfo(lib_id));
		mav.addObject("review", mylibDao.getReviewList(lib_id));		
		mav.addObject("lib_id", lib_id);
		// 서평 조회수 1씩 늘리기
		mylibDao.rvCount(lib_id);
		return mav;
	}
	
	// 서평 insert 페이지 호출
	@RequestMapping("/rvInsert")
	public ModelAndView create(@RequestParam String br_id) throws Exception {
		String lib_id = br_id;
		ModelAndView mav = new ModelAndView();
		mav.addObject("libRead", mylibDao.getLibRead(lib_id));
		mav.setViewName("mylib/rvCreateForm");
		return mav;
	} // rvInsert() end
	
	// 서평 등록
	@RequestMapping(value = "/rvInsert", method = RequestMethod.POST)
	public String rvInsert(@ModelAttribute BookReviewDTO dto) throws Exception {
		String id = dto.getBr_id();
		BookReviewDTO review = new BookReviewDTO();
		review.setBr_bcode(dto.getBr_bcode());
		review.setBr_id(id);
		review.setBr_title(dto.getBr_title());
		review.setBr_content(dto.getBr_content());
		review.setBr_star(dto.getBr_star());		
		mylibDao.insertRv(review);
		
		return "redirect:libindex/" + id;
	} // rvInsert() end	
	
	// 서평 상세 읽기
	@RequestMapping("/reviewRead")
	public ModelAndView reviewRead(@RequestParam int br_no, String loginId, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mylib/reviewRead");
		mav.addObject("rvRead", mylibDao.getReviewRead(br_no));
		// 서평 조회수 1씩 늘리기
		mylibDao.rvCount(loginId);
		return mav;
	} // reviewRead() end
	
	// 서평 삭제
    @RequestMapping("/rvDelete")
    public String delete(int br_no, String br_id){
        mylibDao.delete(br_no);
        return "redirect:/mylib/myReview/"+br_id;
    }//delete() end
        
    // 서평 update 페이지 호출
    @RequestMapping("/rvUpdate")
 	public ModelAndView update(@RequestParam int br_no, @RequestParam String br_id) throws Exception {
    	String lib_id = br_id;
    	ModelAndView mav = new ModelAndView();
 		mav.addObject("br_id", br_id);
 		mav.addObject("br_no", br_no);
 		mav.addObject("read", mylibDao.getReviewRead(br_no));
 		mav.addObject("libRead", mylibDao.getLibRead(lib_id));
 		mav.setViewName("mylib/rvUpdateForm");
    	return mav;
 	} // rvInsert() end

	// 서평 UpdateProc
    @RequestMapping(value = "/rvUpdate", method = RequestMethod.POST)
    public String update(@RequestParam int br_no, @RequestParam String br_id, @ModelAttribute BookReviewDTO dto){
        BookReviewDTO rv = new BookReviewDTO();
        rv.setBr_id(br_id);
        rv.setBr_no(br_no);
        rv.setBr_bcode(dto.getBr_bcode());
        rv.setBr_title(dto.getBr_title());
        rv.setBr_content(dto.getBr_content());
        rv.setBr_star(dto.getBr_star());

        mylibDao.update(rv);

        return "redirect:/mylib/reviewRead?br_no="+br_no;     //행 수정 후 목록으로 이동
    }//update() end
    
	// 나만의 서재에 책 insert
	@RequestMapping({"/libInsert/{b_code}/{s_id}"})
	public ModelAndView list(@PathVariable("b_code") String b_code, @PathVariable("s_id") String s_id) throws Exception {
		MylibDTO lib = new MylibDTO();
		lib.setLib_bcode(b_code);
		lib.setLib_id(s_id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("insert", mylibDao.getBook(lib));
		mav.setViewName("redirect:/mylib/libindex/"+s_id);
		return mav;
	}

	//나의 서재 책 클릭 > eBookRead에서 진행률 체크 가능
	@RequestMapping("/eBookRead/{b_code}")
	public ModelAndView eBookRead(@PathVariable String b_code, HttpSession session)throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mylib/eBookRead");

		mav.addObject("bookdetail", bookDao.bookdetail(b_code));

		String lib_id = (String) session.getAttribute("s_id");
		MylibDTO dto = new MylibDTO();
		dto.setLib_id(lib_id);
		dto.setLib_bcode(b_code);
		mav.addObject("readMylib", mylibDao.readMylib(dto));

		return mav;
	}//eBookRead() end

	@RequestMapping("/updateProc")
	public ModelAndView updateProc(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
//		System.out.println("GOOOOOD?");
		int lib_no = Integer.parseInt(req.getParameter("lib_no"));
		int lib_proc = Integer.parseInt(req.getParameter("lib_proc"));
//		System.out.println("!!!!!!!!!!!!!!!!!"+lib_no);
//		System.out.println("!!!!!!!!!!!!!!!!!"+lib_proc);

		MylibDTO dto = new MylibDTO();
		dto.setLib_no(lib_no);
		dto.setLib_proc(lib_proc);
		mav.addObject("updateProc", mylibDao.updateProc(dto));

		return mav;
	}//updateProc() end
	
	// 나만의 서재 달, 연별 목표 설정
	@RequestMapping("/setGoal")
	public String setGoal(@RequestParam int m_month, @RequestParam int m_year, @RequestParam String m_id) {
		MemberDTO dto = new MemberDTO();
		dto.setM_month(m_month);
		dto.setM_year(m_year);
		dto.setM_id(m_id);
		mylibDao.setGoal(dto);
		return "redirect:/mylib/libindex/"+m_id;
	}
	

} // class end