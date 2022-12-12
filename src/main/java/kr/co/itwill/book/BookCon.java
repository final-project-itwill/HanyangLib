package kr.co.itwill.book;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/book")
public class BookCon {

	public BookCon() {
		System.out.println("----------------------BookCont()객체 생성됨");
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
	public ModelAndView bookcate_n() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/bookcate_n");
		
		mav.addObject("list_n", bookDao.list_n());
		return mav;
    }//bookcate_n() end
	
	

	
	
	/*
	@RequestMapping("/write")
	public String write() {
		return "book/write";
	}//write() end
	
	
	@RequestMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map
						, @RequestParam MultipartFile img
						, HttpServletRequest req) {
		//주의 : 파일 업로드시 리네임 안됨
		
		//업로드된 파일은 /storage폴더에 저장
		String filename="-";
		long filesize=0;
		if(img != null && !img.isEmpty()) {
			filename=img.getOriginalFilename();
			filesize=img.getSize();
			
			try {
				
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage");
				img.transferTo(new File(path + "\\" + filename));
				
			}catch (Exception e) {
				e.printStackTrace();	//System.out.println(e);
			}//try end
		}//if end
		
		map.put("filename", filename);
		map.put("filesize", filesize);
		bookDao.insert(map);
		return "redirect:/booklist";
	}//insert() end
	
	
	@RequestMapping("/search")
	public ModelAndView search(@RequestParam(defaultValue = "") String b_name) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/booklist");
		mav.addObject("booklist",bookDao.search(b_name));
		mav.addObject("b_name", b_name);
		return mav;
	}
	
	@RequestMapping("/detail/{b_code}")
	public ModelAndView detail(@PathVariable String b_code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/detail");
		mav.addObject("book", bookDao.detail(b_code));
		return mav;
	}//detail() end
	
	
	
	@RequestMapping("/bookupdate")
	public String update(@RequestParam Map<String, Object> map
						,@RequestParam MultipartFile img
						,HttpServletRequest req) {
		String filename="-";
		long filesize=0;
		if(img != null && !img.isEmpty()) {
			filename=img.getOriginalFilename();
			filesize=img.getSize();
			
			try {
				ServletContext application=req.getSession().getServletContext();
				String path=application.getRealPath("/storage");
				img.transferTo(new File(path+"\\"+filename));
			}catch (Exception e) {
				e.printStackTrace();
			}//try() end
		}else {
			String b_code=map.get("b_code").toString();
			Map<String, Object> book= bookDao.detail(b_code);
			filename=book.get("FILENAME").toString();
			filesize=(long)book.get("FILESIZE");
		}//if end
		
		map.put("filename", filename);
		map.put("filesize", filesize);
		bookDao.update(map);
		return "redirect:/book/booklist";
	}//update() end
	
	
	
	
	@RequestMapping("/delete")
	public String delete(String b_code, HttpServletRequest req) {
		String filename = bookDao.filename(b_code);	//파일 삭제
		
		if(filename != null && !filename.equals("-")) {
			ServletContext application = req.getSession().getServletContext();
			String path = application.getRealPath("/storage");
			File file = new File(path + "\\" + filename);
			if(file.exists()) {
				file.delete();
			}//if end
		}//if end
		bookDao.delete(b_code);
		return "redirect:/book/booklist";
	}//delete() end
	*/
	
}//class end
