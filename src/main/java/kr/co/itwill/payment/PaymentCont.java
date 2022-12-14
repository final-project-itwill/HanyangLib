package kr.co.itwill.payment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/payment")
@Controller
public class PaymentCont {
	
	public PaymentCont() {
		System.out.println("-----PaymentCont() 객체 생성됨");
	}//end
	
	@RequestMapping("/paymentview")
	public ModelAndView paymentview() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("payment/payment");
		return mav;
	}//paymentview() end
	
	
	
	
}//class end
