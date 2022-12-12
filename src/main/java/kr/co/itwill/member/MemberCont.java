package kr.co.itwill.member;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		//회원가입을 성공했을때 회원가입성공 페이지 불러오기
		@RequestMapping("welcomeform")
		public ModelAndView welcomform() {
				ModelAndView mav=new ModelAndView();
				
				mav.setViewName("member/welcomeform");
				
				return mav;
		}//welcomform() end
		
		
		//아이디 중복확인 페이지 불러오기
		@RequestMapping("idcheckform.do")
		public String idCheckform() {
			return "memer/idCheck";
		}//idCheckForm()
		
		//아이디 중복확인 버튼을 눌렀을때 버튼옆에 출력하기
	   @RequestMapping("idcheckproc.do")
	   @ResponseBody
	   public String idCheckProc(HttpServletRequest req) {
	      String userid=req.getParameter("m_id").trim();
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
	   
	 //이메일 중복확인 버튼을 눌렀을때 버튼옆에 출력하기
	   @RequestMapping("emailcheckproc.do")
	   @ResponseBody
	   public String emailCheckProc(HttpServletRequest req) {
	      String useremail=req.getParameter("m_email").trim();
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
		   String userid = req.getParameter("m_id").trim();
		   
		   String cnt="0";
		   
		   if(userid.equals("hanju1004") || userid.equals("webmaster")) {
			   cnt="1";
		   }//if end
			   
			   JSONObject json=new JSONObject();
			   json.put("count", cnt);
			   
			   return json.toString();
		
	   }//idCheckCookieProc() end
	   
	   //회원가입을 했을때 member테이블에 insert하기
	   @RequestMapping(value = "/insert", method = RequestMethod.POST)
	   @ResponseBody
	   public String insert(@ModelAttribute MemberDTO dto) throws Exception{
		   
		   /*
		   System.out.println("아이디:" + req.getParameter("m_id"));
		   System.out.println("비번:" + req.getParameter("passwd"));
		   System.out.println("이름:" + req.getParameter("mname"));
		   System.out.println("이메일:" + req.getParameter("m_mail"));
		   System.out.println("닉네임:" + req.getParameter("nickname"));
		   System.out.println("생년:" + req.getParameter("my_year"));
		   System.out.println("월:" + req.getParameter("month"));
		   System.out.println("일:" + req.getParameter("day"));
		   System.out.println("주소:" + req.getParameter("address1"));
		   System.out.println("주소2:" + req.getParameter("address2"));
		   System.out.println("직업:" + req.getParameter("job"));
		   System.out.println("전화번호:" + req.getParameter("tel"));
		  */
		  
		   
		   MemberDTO member=new MemberDTO();
		   member.setM_id(dto.getM_id());
		   member.setM_pw(dto.getM_pw());
		   member.setM_name(dto.getM_name());
		   member.setM_nick(dto.getM_nick());
		   member.setM_birth(dto.getM_birth());
		   member.setM_gender(dto.getM_gender());
		   member.setM_zip(dto.getM_zip());
		   member.setM_add1(dto.getM_add1());
		   member.setM_add2(dto.getM_add2());
		   member.setM_tel(dto.getM_tel());
		   member.setM_email(dto.getM_email());
		   member.setM_mailcheck(dto.getM_mailcheck());
		   member.setM_smscheck(dto.getM_smscheck());
		   member.setM_gudok(dto.getM_gudok());
		   member.setM_rdate(dto.getM_rdate());
		   
		   memberDao.memberinsert(member);
		   
		   return "redirect:/login/loginForm";
		   
		   
	   }//insert() end
	   
	   
	   
	   
	   
	   
}//class end
