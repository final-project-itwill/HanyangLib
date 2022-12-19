package kr.co.itwill.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/login")
public class LoginCont {
	
	public LoginCont() {
		System.out.println("-----LoginCont() 객체 생성");
	} // LoginCont() end
	
	@Autowired
	LoginDAO loginDao;
	
	// 로그인 페이지 불러오기 
	@RequestMapping("/index")
	public ModelAndView member(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		String page = "";
		if (req.getHeader("Referer") != null) {
		    page = "redirect:" + req.getHeader("Referer");
		} else {
			page = "redirect:/";
		} // if end
		mav.addObject("page", page);
		mav.setViewName("account/loginForm");
		return mav;
	}//Member() end
	
	// 로그인 process
	@RequestMapping(value = "/loginproc", method = RequestMethod.POST)
	public ModelAndView check(@ModelAttribute LoginDTO dto, HttpSession session, @RequestParam String prevPage, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String m_id = dto.getM_id();
		String m_pw = dto.getM_pw();
		String c_id = Utility.checkNull(req.getParameter("c_id"));
		Cookie cookie = null;
		
		ModelAndView mav=new ModelAndView();
		// 회원등급이 A,B,C인 사람들만 회원등급 불러오기
		String grade = loginDao.loginProc(dto);
		/* System.out.println("---------------"+grade); */
		
		// System.out.println(prevPage); // 이전 페이지 확인
		
		// 회원등급이 비어있다면(가입을 안했거나, F등급-탈퇴 회원이라면) 로그인 실패 처리
		if(grade!=null) {
			mav.setViewName(prevPage);
			session.setAttribute("grade", grade);		
			session.setAttribute("s_id", m_id);
			session.setAttribute("s_pw", m_pw);
			if(c_id.equals("remember")) {
				cookie = new Cookie("c_id", m_id);
				cookie.setMaxAge(60*60*24*30);
			} else {
				cookie = new Cookie("c_id", "");
				cookie.setMaxAge(0);
			} // if end
			resp.addCookie(cookie);
		} else {
			mav.setViewName("/account/loginfail");
		} // if end
		return mav;		
		
	} // check end
	
	
	// 로그아웃
	@RequestMapping("/logout")
	 public ModelAndView logout(HttpSession session) {
		 session.removeAttribute("s_id");
		 session.removeAttribute("grade");
		 session.removeAttribute("s_pw");
		 
		 ModelAndView mav=new ModelAndView();
		 mav.setViewName("account/loginForm");
		 return mav;
	}//logout() end
	

} // class end
