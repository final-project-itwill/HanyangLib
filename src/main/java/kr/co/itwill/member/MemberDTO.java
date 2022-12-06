package kr.co.itwill.member;

import lombok.Data;

@Data
public class MemberDTO {
	
	
	   private String m_id;				//아이디
	   private String m_pw;				//비밀번호
	   private String m_name;			//이름
	   private String m_nick;			//닉네임
	   private int 	  m_birth;			//생년월일
	   private String m_gender;			//성별
	   private int 	  m_zip;			//우편번호
	   private String m_add1;			//집주소1
	   private String m_add2;			//집주소2
	   private String m_tel;			//전화번호
	   private String m_email;			//email
	   private String m_mailcheck;		//메일체크	
	   private String m_smscheck;		//sms수신여부	
	   private String m_grade;			//등급
	   private String m_gudok;			//구독
	   private int	  m_point;			//포인트
	   private String m_heat;			//온도
	   private int	  m_rdate;			//가입일
	
}//class end
