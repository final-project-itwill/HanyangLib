package kr.co.itwill.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/member")
@Controller
public class MemberCont {
		//객체 생성 생성자 함수
		public MemberCont() {
			System.out.println("-----MemberCont()객체 생성됨");
		}//MemberCont() end
		
		//MemberDAO 연결
		@Autowired
		MemberDAO memberDao;
		
		//회원가입 폼 불러오기 
		@RequestMapping("/memberform")
		public ModelAndView member() {
				ModelAndView mav=new ModelAndView();
				mav.setViewName("member/memberform");
				return mav;
		}//Member() end
		
		
		
		
		
		
		
		
		
}//class end
