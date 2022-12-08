package kr.co.itwill.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartCont {
	
	public CartCont() {
		System.out.println("-----CartCont() 객체 생성됨");
	}//CartCont() end
	
	@Autowired
	CartDAO cartDao;
	
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		
		
		return mav;
	}//list() end
	
	
	
	
	
}//class end
