package kr.co.itwill.member;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		//이용약관 불러오기
		@RequestMapping("/agreement")
		public ModelAndView agreement() {
			ModelAndView mav=new ModelAndView();
			mav.setViewName("member/agreement");
			return mav;
		}//agreement() end
		
		//회원가입 폼 불러오기 
		@RequestMapping("/memberform")
		public ModelAndView member() {
				ModelAndView mav=new ModelAndView();
				mav.setViewName("member/memberform");
				return mav;
		}//Member() end
		
		
		
		//아이디 중복확인 페이지 불러오기
		//결과확인
		@RequestMapping("idcheckform.do")
		public String idCheckform() {
			return "memer/idCheck";
		}//idCheckForm()
		
	   @RequestMapping("idcheckproc.do")
	   @ResponseBody
	   public String idCheckProc(HttpServletRequest req) {
	      String userid=req.getParameter("userid").trim();
	      String message="";
	      
	      if(userid.length()<5 || userid.length()>15) {
	         message="<span style='color: red; font-weight: bold'>아이디는 5~15글자 이내 입력해주세요</span>";
	      }else {
	         if(userid.equals("itwill") || userid.equals("webmaster")) {
	            message="<span style='color: red; font-weight: bold'>중복된 아이디 입니다!!</span>";
	         }else {
	            message="<span style='color: green; font-weight: bold'>사용가능한 아이디입니다~~~!</span>";
	         }//if end
	      }//if end
	      return message;
	   }//idCheckProc() end
	   
	   @RequestMapping("emailcheckproc.do")
	   @ResponseBody
	   public String emailCheckProc(HttpServletRequest req) {
	      String useremail=req.getParameter("useremail").trim();
	      String message="";
	      
	      if(useremail.length()<5 || useremail.length()>25) {
	         message="<span style='color: red; font-weight: bold'>이메일은 5~25글자 이내 입력해주세요</span>";
	      }else {
	         if(useremail.equals("hanju1000@naver.com") || useremail.equals("webmaster@naver.com")) {
	            message="<span style='color: red; font-weight: bold'>중복된 이메일 입니다!!</span>";
	         }else {
	            message="<span style='color: green; font-weight: bold'>사용가능한 아메일입니다~~~!</span>";
	         }//if end
	      }//if end
	      return message;
	   }//idCheckProc() end
	   
	   
	   
	   
	   
	   
	   @RequestMapping("idcheckcookieproc.do")
	   @ResponseBody
	   public String idCheckCookieProc(HttpServletRequest req) {
		   String userid = req.getParameter("userid").trim();
		   
		   String cnt="0";
		   
		   if(userid.equals("hanju1004") || userid.equals("webmaster")) {
			   cnt="1";
		   }//if end
			   
			   
			   JSONObject json=new JSONObject();
			   json.put("count", cnt);
			   
			   return json.toString();
					   
		  
		
	   }//idCheckCookieProc() end
	   
	   
	   @RequestMapping(value = "insert.do", method = RequestMethod.POST)
	   public void insert(HttpServletRequest req) {
		   System.out.println("아이디:" + req.getParameter("userid"));
		   System.out.println("비번:" + req.getParameter("passwd"));
		   System.out.println("이름:" + req.getParameter("name"));
		   System.out.println("이메일:" + req.getParameter("이메일"));
		   
	   }//insert() end
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
		
}//class end
