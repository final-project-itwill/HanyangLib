package kr.co.itwill.gudok;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.cart.CartDAO;
import kr.co.itwill.mylib.MylibDTO;

@RequestMapping("/gudok")
@Controller
public class GudokCont {
	
	public GudokCont() {
		System.out.println("-----GudokCont() 객체 생성됨");
	} // end
	
	@Autowired
	CartDAO cart;
	
	// 구독 페이지 불러오기
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gudok/index");
		return mav;
	} // index() end
	
	// 구독이 성공하면 맴버테이블의 구독 상태를 Y로 변경하기
	@RequestMapping("/success")
	public ModelAndView success(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gudok/success");
		String s_id = session.getAttribute("s_id").toString();
		cart.gudokY(s_id);
		return mav;
	} // index() end
	
	@RequestMapping("/fail")
	public ModelAndView fail() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gudok/fail");
		return mav;
	} // index() end
	
	
	
} // class end
