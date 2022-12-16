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
	
	// 구독한 사람의 경우 나만의 서재에 책 insert
	@RequestMapping({"/libInsert/{b_code}/{s_id}"})
	public ModelAndView list(@PathVariable("b_code") String b_code, @PathVariable("s_id") String s_id) {
		MylibDTO lib = new MylibDTO();
		lib.setLib_bcode(b_code);
		lib.setLib_id(s_id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("insert", "");
		mav.setViewName("redirect:/mylib/libindex/"+s_id);
		return mav;
	}
	
} // class end
