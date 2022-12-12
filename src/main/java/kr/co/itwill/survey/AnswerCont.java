package kr.co.itwill.survey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/answers")
public class AnswerCont {
	
	public AnswerCont() {
		System.out.println("------AnswerCont() 객체 생성");
	}// end
	
	@Autowired
	AnswerDAO answerDAO;

}// class end
