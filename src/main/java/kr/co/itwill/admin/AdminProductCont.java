package kr.co.itwill.admin;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	

    @RequestMapping("/productmain")
    public ModelAndView productDashBoard(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/productDashboard");
        return mav;
    }//dashBoard() end


    @RequestMapping("/productinsert")
    public ModelAndView productInsert(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/productInsert");
        return mav;
    }//dashBoard() end
    
    //파일 작성 
    @RequestMapping("/insert")
    public String insert(@RequestParam Map<String, Object> map
    					,@RequestParam MultipartFile img
    					,HttpServletRequest req) {
    	
    	//파일 업로드 시 리네임 되지 않음 주의
    	
    	//업로드된 파일 /storage 폴더에 저장
    	String b_bookcover="../storage/book.jpg";
    	long b_coversize = 0;
    	
    	if(img != null && img.isEmpty()) {
    		b_bookcover = img.getOriginalFilename();
    		b_coversize = img.getSize();
    		
    		try {
    			ServletContext application = req.getSession().getServletContext();
    			String path = application.getRealPath("/srorage");
    			img.transferTo(new File(path + "/" + b_bookcover));
    		}catch (Exception e) {
				e.printStackTrace();
			}//try end
    	}//if end
    	
    	map.put("filename", b_bookcover);
    	map.put("filesize", b_coversize);
    	productDao.insert(map);
    	return "redirext:/admin/productlist";
    }


    @RequestMapping("/productlist")
    public ModelAndView productList(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/productList");
        return mav;
    }//productList() end


    @RequestMapping("/productinquiry")
    public ModelAndView productInquiry(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/productInquiry");
        return mav;
    }//dashBoard() end

}//class end
