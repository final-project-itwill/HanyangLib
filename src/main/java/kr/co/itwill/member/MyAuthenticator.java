package kr.co.itwill.member;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator {
	//사용하고자 하는 메일서버(POP3, SMTP)에서 인증받은 계정 + 비번 등록
	
	private PasswordAuthentication pa;
	
	public MyAuthenticator() {
		pa=new PasswordAuthentication("soldesk@pretyimo.cafe24.com", "soldesk6901");
	}//end
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}//end
	
	
	
}//class end
