package kr.co.itwill.book;



import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/book")
public class BookCon {
	
	public BookCon() {
		System.out.println("--------BookCon()객체 생성됨");
	}// end
	
	

	@Autowired
	BookDAO bookDao;
	

	@RequestMapping("/booklist")
		public ModelAndView booklist() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("book/booklist");
			
			return mav;	

	}//list() end
	
	
	
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
	
	
	
	@RequestMapping("/bookdetail/{b_code}")
	public ModelAndView bookdetail(@PathVariable String b_code) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/bookdetail");
		mav.addObject("book", bookDao.bookdetail(b_code));
		
		return mav;
	}
	
	
	
	
	@RequestMapping("/productWrite")
	public ModelAndView productWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/productWrite");
		
		return mav;	

	}//prodcutWrite() end
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView productWrite (@ModelAttribute BookDTO dto, HttpServletRequest req) throws Exception{
		
		//파일 업로드시 리네임 되지 않음
		ModelAndView mav = new ModelAndView();
		
		//업로드된 파일을 /storage폴더에 저장
		String b_bookcover="-";
		long b_coversize=0;
		
		ServletContext application = req.getSession().getServletContext();
		String path = application.getRealPath("/storage");//실제물리적인 경로
		
		MultipartFile img = dto.getImg();
		String filename = img.getOriginalFilename();
		if(img == null || img.isEmpty()) {
			filename = "-";
		}//if end
		
		
		img.transferTo(new File(path + "/" + filename)); 
		
		
		dto.setB_bookcover(filename);
		
		
		dto.setB_code(dto.getB_code());
		dto.setB_name(dto.getB_name());
		dto.setB_type(dto.getB_type());
		dto.setB_gudok(dto.getB_gudok());
		dto.setB_author(dto.getB_author());
		dto.setB_publish(dto.getB_publish());
		dto.setB_page(dto.getB_page());
		dto.setB_cdate(dto.getB_cdate());
		dto.setB_rdate(dto.getB_rdate());
		dto.setB_coversize(dto.getB_coversize());
		dto.setB_des(dto.getB_des());
		
		mav.addObject("book", bookDao.insert(dto));
		mav.setViewName("redirect:/book/booklist"); 		//메인으로 돌아가기
		
		return mav;
	}//insert() end
	
	
}//class end
