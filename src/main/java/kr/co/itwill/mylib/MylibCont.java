package kr.co.itwill.mylib;

import java.util.Collections;
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
	
	@Autowired
	BrcommentDAO commentDao;
	
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
	
	// 서평 목록
	@SuppressWarnings("unchecked")
	@RequestMapping("/myReview")
	public ModelAndView myReview(@RequestParam String lib_id, @RequestParam String pageNum) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mylib/myReview");
		mav.addObject("libRead", mylibDao.getLibRead(lib_id));
		mav.addObject("bookCount", mylibDao.getCount(lib_id));
		mav.addObject("book80Count", mylibDao.get80Count(lib_id));
		mav.addObject("libInfo", mylibDao.getLibInfo(lib_id));
		mav.addObject("review", mylibDao.getReviewList(lib_id));		
		mav.addObject("lib_id", lib_id);
		
		// 페이징
		int totalRowCount = mylibDao.rvTotal(lib_id); // 총 글개수
		int numPerPage = 5; // 한 페이지당 레코드 개수를 계산하기 위한 변수
		int pagePerBlock = 10; // 페이지 리스트를 출력하기 위한 변수

		if(pageNum==null) {
			pageNum="1"; // 받아온 페이지 번호가 없다면(목록에 처음 들어왔다면) 1페이지 저장
		} // if end
		
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지의 번호가 담긴 문자열을 정수형으로 변환
		// 페이지에 담길 글의 수를 조정함
		// 예) 내가 지금 1페이지라면 글번호가 1번부터 5번까지인 게시글을 가져와야함		2페이지의 경우 6~10까지
		//		startRow	= ((1-0)*5)+1	= 1											= ((2-1)*5)+1	= 6
		//		endRow		= 1*5			= 5											= 2*5			= 10
		//	startRow 변수와 endRow변수를 활용하여 SQL문에서 rownum으로 접근
		int startRow	= (currentPage-1)*numPerPage+1; // 시작 행번호
		int endRow		= currentPage*numPerPage;		// 끝 행번호
		
		// 2. 페이지 목록
		// 총 글 개수에 맞춰서 페이징으로 페이지를 어디까지 띄울 지 조정한다.(pagePerBlock 변수 활용)
		//
		// 1)
		// 우선 총 글개수를 미리 정해둔 페이지당 출력되는 레코드 수로 나누어준다.
		//	- 내 글은 총 6개이다. 한 페이지에는 5개의 글만 들어갈 수 있다. 내 글은 어디까지 들어갈까? 2페이지 일 것이다.
		//	- 내 글 개수 / 한 페이지에 들어갈 수 있는 글 개수 -> 6/5 = 1.2 -> 올림을 통해 2페이지까지 담아짐을 변수화
		//	- 만약 5/6의 결과값을 정수형으로 담으면 1만 출력된다. 그럼 내 글은 1페이지까지만 들어가기 때문에 double로 자료형을 선언해준다.
		double totcnt = (double)totalRowCount/numPerPage;	// 게시판의 글이 들어갈 페이지 수 계산(올림을 위해 소수점을 담음)
		int totalpage = (int)Math.ceil(totcnt);				// 소수점 올림을 통해 실제 게시판의 글들이 들어가있는 페이지 수를 변수로 담음 
		
		// 2)
		// 이번에는 총 글 개수를 미리 정해둔 페이지의 목록 수로 나누어준다.
		//	- 내 글은 총 6개이다. 페이지의 목록은 10페이지이다.
		//	- 만약 내 글이 50개가 넘어가면 
		//									내 글이 6개일 때			내 글이 12개일 때
		//	- 내 글 개수 / 페이지의 목록 수 -> 6/10 = 0.6					12/10 = 1.2
		//	- 올림을 한 후 1을 빼줌			-> 1-1 = 0						2-1 = 1
		//	- 시작 페이지를 설정해줌		-> 0*10 = 0						1*10 = 10
		//	- 페이지의 끝을 설정해줌		-> 0+10+1 = 11					10+10+1 = 21
		double d_page = (double)totalRowCount/pagePerBlock;
		int pages	  = (int)Math.ceil(d_page)-1;
		
		// 페이지의 시작 지점, 현재 페이지가 1일 때 0 | 2일 때 1 | 3일 때 2 이렇게 되어야 하지 않나?
		int start = currentPage-1;
		int startPage = 0;
		if(start<5) {
			startPage = 0;
		} else {
			startPage = currentPage-5;				
		}
		
		// 페이지의 끝 지점, 현재 페이지가 5일 때까지는 11, 그 이후로 부터는 1씩 더해짐
		int endPage = 0;
		if(currentPage<6) {
			endPage = 11;
		} else {
			endPage = currentPage+(pagePerBlock/2);
		}
		
		List<BookReviewDTO> list = null;
		if(totalRowCount>0) {
			BookReviewDTO dto = new BookReviewDTO();
			dto.setBr_id(lib_id);
			dto.setStartRow(startRow);
			dto.setEndRow(endRow);
			list = mylibDao.getReviewList2(dto); // 시작 행번호와 끝 행번호 저장
		} else {
			list = Collections.EMPTY_LIST; // 넘어온 값이 없다면 list를 비워주기
		} // if end
		
		int number = 0;
		number = totalRowCount-(currentPage-1)*numPerPage; // 
		
		mav.addObject("number", number);
		mav.addObject("pageNum", pageNum);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("pages", pages);
		mav.addObject("pagePerBlock", pagePerBlock);
		mav.addObject("totalPage", totalpage);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("list", list);
		mav.addObject("count", totalRowCount);			// 전체 글 개수
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
		mav.addObject("cmCount", commentDao.getCmCount(br_no));
		//System.out.println(mylibDao.getReviewRead(br_no));
		
		
		// 서평 조회수 1씩 늘리기
		mylibDao.rvCount(br_no);
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
	
	// 서평 댓글 로직 구현
	@ResponseBody
	@RequestMapping("/cminsert")
	private int cmInsert(@RequestParam int brc_pno, @RequestParam String brc_id, @RequestParam String brc_content, HttpServletRequest req) throws Exception {
		//System.out.println("00000000");
		BrcommentDTO comment = new BrcommentDTO();
		comment.setBrc_content(brc_content);
		comment.setBrc_id(brc_id);
		comment.setBrc_pno(brc_pno);
	    return commentDao.cmInsert(comment);
	} // cmInsert() end
	
	
	@RequestMapping("/cmlist")
	@ResponseBody
	private List<BrcommentDTO> cmList(@RequestParam int brc_pno, @RequestParam int limit) throws Exception {
		
		//System.out.println("11111");
		
		BrcommentDTO dto = new BrcommentDTO();
		dto.setBrc_pno(brc_pno);
		dto.setLimit(limit);
		
		//System.out.println(commentDao.commentList(dto).size());
		
	    return commentDao.commentList(dto);
	} // cmList() end
		
	@ResponseBody
	@RequestMapping("/cmupdate")
	private int cmUpdate(@RequestParam int brc_no, @RequestParam String brc_content) throws Exception {
		BrcommentDTO comment = new BrcommentDTO();
	    comment.setBrc_no(brc_no);
	    comment.setBrc_content(brc_content);
	    return commentDao.cmUpdate(comment);
	} // cmUpdate() end
	
	@RequestMapping("/cmDelete/{brc_no}")
	@ResponseBody
	private int cmDelete(@PathVariable int brc_no) throws Exception {
	    return commentDao.cmDelete(brc_no);
	} // cmDelete() end


} // class end