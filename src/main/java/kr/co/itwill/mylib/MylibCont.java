package kr.co.itwill.mylib;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mylib")
@Controller
public class MylibCont {

	public MylibCont() {
		System.out.println("-----MylibCont() 객체 생성됨");
	} // end
	
} // class end
