package kr.co.itwill.mylib;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/mylib")
@Controller
public class MylibCont {

	public MylibCont() {
		System.out.println("-----MylibCont() 객체 생성됨");
	} // end
	
	@Autowired
	MylibDAO mylibDao;
	
	@RequestMapping("/libindex")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mylib/libindex");
		return mav;
	}
	
	
} // class end
