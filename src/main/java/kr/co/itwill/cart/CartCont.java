package kr.co.itwill.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/cart")
@Controller
public class CartCont {
	
	public CartCont() {
		System.out.println("-----CartCont() 객체 생성됨");
	}//CartCont() end
	
	@Autowired
	CartDAO cartDao;
	
	@RequestMapping("/cartview")
	public ModelAndView cartview() {
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("cart/cart");
		return mav;
	}//list() end
	
	
	
	
	
	
}//class end
