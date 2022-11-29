package kr.co.itwill.gudok;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/gudok")
@Controller
public class GudokCont {
	
	public GudokCont() {
		System.out.println("-----GudokCont() 객체 생성됨");
	} // end
	
	@RequestMapping("/detail")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gudok/detail");
		return mav;
	}
	
} // class end
