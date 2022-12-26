package kr.co.itwill.book;



import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.community.BookReadDTO;
import kr.co.itwill.member.LoginDAO;
import kr.co.itwill.member.LoginDTO;
import kr.co.itwill.mylib.MylibDTO;


@Controller
@RequestMapping("/book")
public class BookCon {
	
	public BookCon() {
		System.out.println("--------BookCon()객체 생성됨");
	}// end
	
	

	@Autowired
	BookDAO bookDao;
	
	// *****경환 수정*****
	// 회원 정보 확인을 위한 DAO 객체 생성
	@Autowired
	LoginDAO loginDao;
	

	@RequestMapping("/booklist")
		public ModelAndView booklist() {
			ModelAndView mav = new ModelAndView();
			mav.addObject("newbook", bookDao.newbook());		//newBook 출력
			mav.addObject("mdBpick", bookDao.mdBpick());		//md pick 출력
			mav.setViewName("book/booklist");

			
			return mav;	

	}//list() end
	
	
	@RequestMapping("/bookcate_a")
	public ModelAndView bookcate_a(@RequestParam String pageNum) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/bookcate_a");
		int totalRowCount = bookDao.totalRowCount();	//총 행 갯수
		
		//페이징
		int numPerPage   = 15;   //한 페이지당 행 갯수
        int pagePerBlock = 10;  //페이지 리스트(1~10페이지 : 1세트에 10페이지)

        if(pageNum == null){    //페이징 번호의 a태그 명령어 ? 뒤에서 받아옴
            pageNum = "1";      //자료가 없으면 무조건 1페이지
        }

        int currentPage = Integer.parseInt(pageNum);        //현재 2페이지라면,
        int startRow    = (currentPage-1)*numPerPage+1;     //시작 rnum은 21
        int endRow      = currentPage * numPerPage;         //끝 rnum은 30

        //페이지 수
        double totcnt = (double)totalRowCount/numPerPage;   //총 페이지수 = 글갯수/20
        int totalPage = (int)Math.ceil(totcnt);             //올림해서 정수형으로 변환

        //페이지가 10이 넘어가면 11~20 페이지가 나와야 함(2세트)
        double d_page = (double)currentPage/pagePerBlock;   //22페이지라면, 1.2
        int Pages     = (int)Math.ceil(d_page) - 1;         //1
        int startPage = Pages * pagePerBlock + 1;           //11
        int endPage   = startPage + pagePerBlock - 1;       //20

        BookDTO rows = new BookDTO();
        rows.setStartRow(startRow);
        rows.setEndRow(endRow);

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("rows", rows);
        mav.addObject("list_a", bookDao.list_a(rows));
		return mav;
    }//bookcate_a() end
	
	
	@RequestMapping("/bookcate_n")
	public ModelAndView bookcate_n(@RequestParam String pageNum)throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/bookcate_n");
		
		int totalRowCount_n = bookDao.totalRowCount_n();	//총 행 갯수
		
		//페이징
		int numPerPage   = 15;   //한 페이지당 행 갯수
        int pagePerBlock = 10;  //페이지 리스트(1~10페이지 : 1세트에 10페이지)

        if(pageNum == null){    //페이징 번호의 a태그 명령어 ? 뒤에서 받아옴
            pageNum = "1";      //자료가 없으면 무조건 1페이지
        }

        int currentPage = Integer.parseInt(pageNum);        //현재 2페이지라면,
        int startRow    = (currentPage-1)*numPerPage+1;     //시작 rnum은 21
        int endRow      = currentPage * numPerPage;         //끝 rnum은 30

        //페이지 수
        double totcnt = (double)totalRowCount_n/numPerPage;   //총 페이지수 = 글갯수/20
        int totalPage = (int)Math.ceil(totcnt);             //올림해서 정수형으로 변환

        //페이지가 10이 넘어가면 11~20 페이지가 나와야 함(2세트)
        double d_page = (double)currentPage/pagePerBlock;   //22페이지라면, 1.2
        int Pages     = (int)Math.ceil(d_page) - 1;         //1
        int startPage = Pages * pagePerBlock + 1;           //11
        int endPage   = startPage + pagePerBlock - 1;       //20

        BookDTO rows = new BookDTO();
        rows.setStartRow(startRow);
        rows.setEndRow(endRow);

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount_n);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("rows", rows);
        mav.addObject("list_n", bookDao.list_n(rows));


		return mav;
		
    }//bookcate_n() end
	
	
	@RequestMapping("/bookcate_e")
	public ModelAndView bookcate_e(@RequestParam String pageNum) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/bookcate_e");
		int totalRowCount_e = bookDao.totalRowCount_e();	//총 행 갯수
		
		//페이징
		int numPerPage   = 15;   //한 페이지당 행 갯수
        int pagePerBlock = 10;  //페이지 리스트(1~10페이지 : 1세트에 10페이지)

        if(pageNum == null){    //페이징 번호의 a태그 명령어 ? 뒤에서 받아옴
            pageNum = "1";      //자료가 없으면 무조건 1페이지
        }

        int currentPage = Integer.parseInt(pageNum);        //현재 2페이지라면,
        int startRow    = (currentPage-1)*numPerPage+1;     //시작 rnum은 21
        int endRow      = currentPage * numPerPage;         //끝 rnum은 30

        //페이지 수
        double totcnt = (double)totalRowCount_e/numPerPage;   //총 페이지수 = 글갯수/20
        int totalPage = (int)Math.ceil(totcnt);             //올림해서 정수형으로 변환

        //페이지가 10이 넘어가면 11~20 페이지가 나와야 함(2세트)
        double d_page = (double)currentPage/pagePerBlock;   //22페이지라면, 1.2
        int Pages     = (int)Math.ceil(d_page) - 1;         //1
        int startPage = Pages * pagePerBlock + 1;           //11
        int endPage   = startPage + pagePerBlock - 1;       //20

        BookDTO rows = new BookDTO();
        rows.setStartRow(startRow);
        rows.setEndRow(endRow);

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount_e);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("rows", rows);
        mav.addObject("list_e", bookDao.list_e(rows));
		return mav;
    }//bookcate_e() end
	
	
	
		
	@RequestMapping("/bookcate_h")
	public ModelAndView bookcate_h(@RequestParam String pageNum) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/bookcate_h");
		int totalRowCount_h = bookDao.totalRowCount_h();	//총 행 갯수
		
		//페이징
		int numPerPage   = 15;   //한 페이지당 행 갯수
        int pagePerBlock = 10;  //페이지 리스트(1~10페이지 : 1세트에 10페이지)

        if(pageNum == null){    //페이징 번호의 a태그 명령어 ? 뒤에서 받아옴
            pageNum = "1";      //자료가 없으면 무조건 1페이지
        }

        int currentPage = Integer.parseInt(pageNum);        //현재 2페이지라면,
        int startRow    = (currentPage-1)*numPerPage+1;     //시작 rnum은 21
        int endRow      = currentPage * numPerPage;         //끝 rnum은 30

        //페이지 수
        double totcnt = (double)totalRowCount_h/numPerPage;   //총 페이지수 = 글갯수/20
        int totalPage = (int)Math.ceil(totcnt);             //올림해서 정수형으로 변환

        //페이지가 10이 넘어가면 11~20 페이지가 나와야 함(2세트)
        double d_page = (double)currentPage/pagePerBlock;   //22페이지라면, 1.2
        int Pages     = (int)Math.ceil(d_page) - 1;         //1
        int startPage = Pages * pagePerBlock + 1;           //11
        int endPage   = startPage + pagePerBlock - 1;       //20

        BookDTO rows = new BookDTO();
        rows.setStartRow(startRow);
        rows.setEndRow(endRow);

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount_h);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("rows", rows);
        mav.addObject("list_h", bookDao.list_h(rows));
		return mav;		
    }//bookcate_h() end
	
	
	@RequestMapping("/bookcate_s")
	public ModelAndView bookcate_s(@RequestParam String pageNum) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/bookcate_s");
		int totalRowCount_s = bookDao.totalRowCount_s();	//총 행 갯수
		
		//페이징
		int numPerPage   = 15;   //한 페이지당 행 갯수
        int pagePerBlock = 10;  //페이지 리스트(1~10페이지 : 1세트에 10페이지)

        if(pageNum == null){    //페이징 번호의 a태그 명령어 ? 뒤에서 받아옴
            pageNum = "1";      //자료가 없으면 무조건 1페이지
        }

        int currentPage = Integer.parseInt(pageNum);        //현재 2페이지라면,
        int startRow    = (currentPage-1)*numPerPage+1;     //시작 rnum은 21
        int endRow      = currentPage * numPerPage;         //끝 rnum은 30

        //페이지 수
        double totcnt = (double)totalRowCount_s/numPerPage;   //총 페이지수 = 글갯수/20
        int totalPage = (int)Math.ceil(totcnt);             //올림해서 정수형으로 변환

        //페이지가 10이 넘어가면 11~20 페이지가 나와야 함(2세트)
        double d_page = (double)currentPage/pagePerBlock;   //22페이지라면, 1.2
        int Pages     = (int)Math.ceil(d_page) - 1;         //1
        int startPage = Pages * pagePerBlock + 1;           //11
        int endPage   = startPage + pagePerBlock - 1;       //20

        BookDTO rows = new BookDTO();
        rows.setStartRow(startRow);
        rows.setEndRow(endRow);

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount_s);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("rows", rows);
        mav.addObject("list_s", bookDao.list_s(rows));
		return mav;		
    }//bookcate_h() end
	
	// ***경환수정***
	// 로그인 했을 때도 페이지를 불러오기 위한 명령어	
	@RequestMapping("/bookdetail/{b_code}")
	public ModelAndView bookdetail(@PathVariable String b_code, HttpSession session) throws Exception {
		String s_id = (String)session.getAttribute("s_id");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/bookdetail");
		mav.addObject("book", bookDao.bookdetail(b_code));
		
		// *****경환수정*****
		// 구독 여부를 확인하기(Y이면 구독, N이면 구독 안함)
		mav.addObject("subs", loginDao.subCheck(s_id));
		
		// 선택한 책을 보유하고 있는지 확인하기
		// DTO에 저장한 뒤 haveBook의 결과가 1이면 보유, 0이면 미보유
		MylibDTO dto = new MylibDTO();
		dto.setLib_bcode(b_code);
		dto.setLib_id(s_id);
		mav.addObject("haveBook", loginDao.haveBook(dto));
		
		// 정보가 잘 들어오는 지 확인
		// System.out.println("아이디 : "+s_id);
		// System.out.println("책 보유 여부 : " + loginDao.haveBook(dto));
		// System.out.println("구독여부 : " + loginDao.subCheck(s_id));
		
		
		//커뮤니티 추가
		mav.addObject("commu", bookDao.commu());
		
			//List<BookReadDTO> test = new ArrayList<>();
			//for(int i=0; i<test.size(); i++) {
			//	System.out.println(test.get(i));
			//}
		
		
		//서평 추가
		mav.addObject("review", bookDao.review());
		
		
		
		return mav;		
	}
	
	
	@RequestMapping("/search")
	public ModelAndView search(@RequestParam(defaultValue = "") String keyword) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/bookcate_a");
		mav.addObject("keyword", keyword);
		mav.addObject("list_a", bookDao.search(keyword));	//제발.. 변수명 확인하고 일치 좀,... 방미연.... 이건...list_a
		return mav;
	}//search() end


	
}//class end
