package kr.co.itwill.admin;

import java.io.File;
import java.io.IOException;
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

import kr.co.itwill.book.BookDAO;
import kr.co.itwill.book.BookDTO;

@Controller
@RequestMapping("/admin")
public class AdminProductCont {
	
	@Autowired
	private AdminProductDAO productDao;

    @Autowired
    BookDAO bookDao;
    

    @RequestMapping("/productmain")
    public ModelAndView productDashBoard(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/productDashboard");
        return mav;
    }//dashBoard() end


    @RequestMapping("/productinsert")
    public ModelAndView productinsert() {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("admin/productInsert");
    	return mav;
    }//create() end
    
    
    
    @RequestMapping(value = "/productInsert", method = RequestMethod.POST)
    public ModelAndView insert(@ModelAttribute BookDTO dto, HttpServletRequest req) throws Exception{
    	
    	//파일명 리네임 구현 안함
    	ModelAndView mav = new ModelAndView();
    	
    	//저장 폴더의 실제 경로 가져오기
    	ServletContext application = req.getSession().getServletContext();
    	String path = application.getRealPath("/storage");
    	
    	//<input type="file" name="img">
    	
    	MultipartFile img = dto.getImg();
    	String filename = img.getOriginalFilename();
    	if(img == null || img.isEmpty()) {
    		filename = "none.png";
    	}//if end
    	
    	img.transferTo(new File(path + "/" + filename));	//  /storage 폴더에 파일 저장
    	
    	
    	dto.setB_bookcover(filename);
    	
    	dto.setB_code(dto.getB_code());
    	dto.setB_name(dto.getB_name());
    	dto.setB_author(dto.getB_author());
    	dto.setB_des(dto.getB_des());
    	dto.setB_gudok(dto.getB_gudok());
    	dto.setB_page(dto.getB_page());
    	dto.setB_price(dto.getB_price());
    	dto.setB_publish(dto.getB_publish());
    	dto.setB_rdate(dto.getB_rdate());
    	dto.setB_type(dto.getB_type());
    	System.out.println("컨트롤러에서----"+dto.toString());
    	
    	mav.addObject("book", productDao.insert(dto));
    	mav.setViewName("redirect:/admin/productlist?pageNum=1");
    	
    	return mav;
    }//insert() end
    
    


    
    @RequestMapping("/productlist")
    public ModelAndView productList(@RequestParam String pageNum) throws Exception{
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/productList");
        int totalRowCount = bookDao.totalRowCount();	//총 행 갯수
        
        
        //페이징
        int numPerPage		=	15;		//한 페이지당 행 갯수
        int pagePerBlock	=	10;		//페이지 리스트
        
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
    }//productList() end


    @RequestMapping("/productinquiry")
    public ModelAndView productInquiry(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/productInquiry");
        return mav;
    }//dashBoard() end
    
    
    
    //검색
    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(defaultValue = "") String keyword) {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("admin/productList");
    	mav.addObject("keyword", keyword);
    	mav.addObject("list_a", productDao.search(keyword));
    	System.out.println("컨트롤러에서----"+keyword.toString());
    	return mav;
    }

    
    
	//상세페이지
	@RequestMapping("/productDetail/{b_code}")
	public ModelAndView productdetail(@PathVariable String b_code) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/productDetail");
		mav.addObject("book", productDao.productdetail(b_code));
		return mav;
	}
	
	
	//수정
	@RequestMapping("/update/{b_code}")
	public ModelAndView update(@PathVariable String b_code) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.addObject("update", productDao.productdetail(b_code));
		mav.setViewName("admin/update");
		return mav;
	}//update() end
	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void update(@ModelAttribute BookDTO dto, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		//기존 저장된 정보 가져오기
		BookDTO oldDTO = productDao.productdetail(dto.getB_code());
		
		String filename="";
		
		//파일 수정 예정?
		MultipartFile img = dto.getImg();
		if(img.getSize()>0) {
			filename = img.getOriginalFilename();
			
			try {
				//저장 폴더의 실제 경로 가져오기
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage");
				img.transferTo(new File(path + "/" + filename));
				dto.setB_bookcover(filename);
				
				String oldFilename = oldDTO.getB_bookcover();
				File oldFile = new File(path + "/" + oldFilename);
				if(oldFile.exists()) {
					oldFile.delete();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}//try end
			
		}else {
			filename = oldDTO.getB_bookcover();
			dto.setB_bookcover(oldDTO.getB_bookcover());
		}//if end
		
    	dto.setB_name(dto.getB_name());
    	dto.setB_author(dto.getB_author());
    	dto.setB_des(dto.getB_des());
    	dto.setB_gudok(dto.getB_gudok());
    	dto.setB_page(dto.getB_page());
    	dto.setB_price(dto.getB_price());
    	dto.setB_publish(dto.getB_publish());
    	dto.setB_rdate(dto.getB_rdate());
    	dto.setB_type(dto.getB_type());
    	System.out.println(dto.toString());
    	productDao.update(dto);
    	mav.setViewName("redirect:/admin/productlist?pageNum=1");
				
	}//update() end
	
	@RequestMapping("/delete/{b_code}")
	public String delete(@PathVariable("b_code") String b_code, HttpServletRequest req) {		
		productDao.delete(b_code);
		return "redirect:/admin/productlist?pageNum=1";
	}//delete() end
	
	
}//class end
