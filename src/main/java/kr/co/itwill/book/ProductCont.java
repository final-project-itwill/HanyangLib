package kr.co.itwill.book;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.admin.AdminProductDAO;

@Controller
public class ProductCont {
	
	@Autowired
	private AdminProductDAO productDao;
	
	public ProductCont() {
		System.out.println("---------ProductCont() 객체 생성됨");
	}// end
	
	
	
	@RequestMapping("/productWrite")
	public ModelAndView productWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/productWrite");
		
		return mav;	

	}//prodcutWrite() end
	
	
	@RequestMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map
						,@RequestParam MultipartFile img
						, HttpServletRequest req) {
		
		//파일 업로드시 리네임 되지 않음
		
		//업로드된 파일 /storage 폴더에 저장
		String b_bookcover = "-";
		long b_coversize = 0;
		if(img != null && img.isEmpty()) {
			b_bookcover = img.getOriginalFilename();
			b_coversize = img.getSize();
			
			try {
				
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage");	//실제 물리적인 경로
				img.transferTo(new File(path+"/"+b_bookcover));
				
			}catch (Exception e) {
				e.printStackTrace();
			}//try end
		}//if end
		
		map.put("filename", b_bookcover);
		map.put("filisize", b_coversize);
		productDao.insert(map);
		return "redirext:";	
	}//insert() end
	
	
	@RequestMapping("/delete")
	public String delete(String b_code, HttpServletRequest req) {
		
		String filename = productDao.filename(b_code);	//파일 삭제
		
		if(filename != null && !filename.equals("-")) {
			ServletContext application = req.getSession().getServletContext();
			String path = application.getRealPath("/storage");
			File file = new File(path + "/" + filename);
			if(file.exists()) {
				file.delete();
			}//if end
		}//if end
		
		productDao.delete(b_code);	//행삭제
		return "redirect:-";
	}//delete() end
	
	
	
	@RequestMapping("/update")
	public String update(@RequestParam Map<String, Object> map
						, @RequestParam MultipartFile img
						, HttpServletRequest req) {
		
		String b_bookcover = "-";
		long b_coversize = 0;
		
		if(img != null && !img.isEmpty()) {
			b_bookcover = img.getOriginalFilename();
			b_coversize = img.getSize();
			
			try {
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage");
				img.transferTo(new File(path + "/" + b_bookcover));
			}catch (Exception e) {
				e.printStackTrace();
			}//try end
		}else {
			String b_code=map.get("b_code").toString();
			Map<String, Object> product = productDao.detail(b_code);
			b_bookcover = product.get("B_BOOKCOVER").toString();
			b_coversize = (long)product.get("B_COVERSIZE");
		}//if end
		
		map.put("b_bookcover", b_bookcover);
		map.put("b_coversize", b_coversize);
		productDao.update(map);
		
		return "redirect:-";
	}//update() end
	

}//class end
