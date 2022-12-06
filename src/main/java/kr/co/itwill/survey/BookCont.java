package kr.co.itwill.survey;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/survey")
public class BookCont {

	public BookCont() {
		System.out.println("------BookCont() 객체생성됨 ");
	}//end
	
	@RequestMapping("/bookTest")
	public String bookTest() {
		return "survey/bookTest";
	}// bookTest() end
	
	@RequestMapping("/title.do")
	@ResponseBody
	public String bookSend(HttpServletRequest req) {
		// 요청한 정보 가져오기
		int titleIndex=Integer.parseInt(req.getParameter("title"));

		String title[] = {"gaek", "ju", "check", "time", "date"};
		return title[titleIndex]; // 응답메세
	}// bookSend() end
	
	
}// class end
