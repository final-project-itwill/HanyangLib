package kr.co.itwill.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/member")
@Controller
public class LoginFormCont {

	public LoginFormCont() {
		System.out.println("-----LoginFormCont() 객체 생성됨");
	}//LoginFormCont() end
	
	
	@Autowired
	MemberDAO memberDao;
	
	@RequestMapping("/loginForm")
	public ModelAndView login() {
			ModelAndView mav=new ModelAndView();
			mav.setViewName("member/loginForm");
			return mav;
	}//Member() end
	
	
	
	
}//class end
