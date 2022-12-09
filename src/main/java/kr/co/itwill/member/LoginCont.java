package kr.co.itwill.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/account")
public class LoginCont {
	
	public LoginCont() {
		System.out.println("-----LoginCont() 객체 생성");
	} // LoginCont() end
	
	@Autowired
	LoginDAO loginDao;
	
	// 로그인 페이지 불러오기 
	@RequestMapping("/login")
	public ModelAndView member() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/loginForm");
		return mav;
	}//Member() end
	
	// 로그인 결과 확인시키기
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public ModelAndView check(@ModelAttribute LoginDTO dto, HttpSession session) throws Exception {
		String m_id = dto.getM_id();
		String m_pw = dto.getM_pw();
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/member/login"); //
		int cnt = loginDao.loginProc(dto);//1 | 0
		System.out.println("---------------"+cnt);
		
		//System.out.println(cnt);
		
		//mav.addObject("s_uid", uid);
		//mav.addObject("s_password", password);
		//모든 사용자들에게도 출력이 되려면 mav가 아니라 session 함수를 사용해야 한다.
		session.setAttribute("cnt", cnt);		
		session.setAttribute("s_id", m_id);
		session.setAttribute("s_pw", m_pw);
		return mav;		
		
	} // check end
	

} // class end
