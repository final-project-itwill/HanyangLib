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
	
	@RequestMapping("/booksend.do")
	@ResponseBody
	public String bookSend(HttpServletRequest req) {
		// 요청한 정보 가져오기
		int bookIndex=Integer.parseInt(req.getParameter("book"));

		String img[] = {"book_1.jpg", "book_2.jpg", "book_2.jpg", "book_3.jpg", "book_4.jpg"};
		
		return img[bookIndex]; // 응답메세
	}// bookSend() end
	
	
}// class end
