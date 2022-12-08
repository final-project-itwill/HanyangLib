package kr.co.itwill.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/login")
@Controller
public class LoginFormCont {

	public LoginFormCont() {
		System.out.println("-----LoginFormCont() 객체 생성됨");
	}//LoginFormCont() end
	
	
	@Autowired
	MemberDAO memberDao;
	
	// 로그인 폼 띄우기
	@RequestMapping("/loginForm")
	public ModelAndView login() {
			ModelAndView mav=new ModelAndView();
			mav.setViewName("member/loginForm");
			return mav;
	}//Member() end
	
	// 로그인 실행시키기
	
	
	
	
}//class end
