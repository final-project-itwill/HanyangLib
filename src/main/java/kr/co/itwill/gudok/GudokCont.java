package kr.co.itwill.gudok;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.mylib.MylibDTO;

@RequestMapping("/gudok")
@Controller
public class GudokCont {
	
	public GudokCont() {
		System.out.println("-----GudokCont() 객체 생성됨");
	} // end
	
	// 구독 페이지 불러오기
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gudok/index");
		return mav;
	} // index() end
	
	// 구독이 성공하면 맴버테이블의 구독 상태를 Y로 변경하기
	@RequestMapping("/success")
	public ModelAndView success() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gudok/success");
		return mav;
	} // index() end
	
	@RequestMapping("/fail")
	public ModelAndView fail() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gudok/fail");
		return mav;
	} // index() end
	
	
	
} // class end
