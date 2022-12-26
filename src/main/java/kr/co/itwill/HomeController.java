package kr.co.itwill;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.book.BookDAO;
import kr.co.itwill.cart.CartDAO;

@Controller
public class HomeController {
	
	public HomeController() {
		System.out.println("-----HomeController() 객체 생성됨");
	} // end
	
	@Autowired
	BookDAO book;
	
	@Autowired
	indexDAO index;
	
	@Autowired
	CartDAO cart;
	
	@RequestMapping("/")
	public ModelAndView home() throws Exception {
		ModelAndView mav = new ModelAndView();
		// redirect : 등록한 명령어를 호출할 수 있다
		mav.setViewName("/index");
		mav.addObject("mdBook", book.mdBpick());
		mav.addObject("mdComm", index.mdComm());
		mav.addObject("mdReview", index.mdReview());
		return mav;		
	} // home() end
	
} // class end
