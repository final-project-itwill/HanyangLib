<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Session"%>
<%@page import="kr.co.itwill.member.Utility"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="kr.co.itwill.member.MyAuthenticator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<%
	
try{
    //1)사용하고자 하는 메일서버에서 계정과 비번 등록하기
    //->MyAuthenticator클래스 생성
    
    //2)메일서버(POP3, SMTP) 저장하기
    String mailServer="mw-002.cafe24.com"; //cafe24 메일서버
    Properties props=new Properties();
    props.put("mail.smtp.host", mailServer);
    props.put("mail.smtp.auth", true);
    
    //3)메일서버에서 인증받은 계정+비번
    Authenticator myAuth=new MyAuthenticator(); //다형성
    
    //4) 2)와 3)이 유효한지 검증
    Session sess=Session.getInstance(props, myAuth);
    //out.print("메일 서버 인증 성공!!!");
    
    //5)메일 보내기
    request.setCharacterEncoding("UTF-8");
    String to     =request.getParameter("to").trim();
    String from     =request.getParameter("from").trim();
    String subject=request.getParameter("subject").trim();
    String content=request.getParameter("content").trim();
    
    //엔터 및 특수문자 변경
    content=Utility.convertChar(content);
    
    //content+="     ";
    content+="	<h1></h1>";
    content+="		";
    content+="      ";
    content+="      ";
    content+="      ";
    content+="      ";
    content+="      ";
   
    
    //받는 사람 이메일 주소
    InternetAddress[] address={ new InternetAddress(to) };
    /*
       수신인이 여러명인 경우
       InternetAddress[] address={ new InternetAddress(to1) 
                            new InternetAddress(to2), 
                            new InternetAddress(to3), 
                            new InternetAddress(to4), ~~~ };
    
    */   
    //메일 관련 정보 작성
    Message msg=new MimeMessage(sess);
    
    //받는사람
    msg.setRecipients(Message.RecipientType.TO, address);
    //참조     Message.RecipientType.CC
    //숨은참조  Message.RecipientType.BCC
    
    //보내는 사람
    msg.setFrom(new InternetAddress(from));
    
    //메일 제목
    msg.setSubject(subject);
    
    //메일 내용
    msg.setContent(content, "text/html; charset=UTF-8");
    //메일 보낸날짜
    msg.setSentDate(new Date());
    
    //메일 전송
    Transport.send(msg);
    
    out.print(to+"님에게 메일이 발송되었습니다");
    
 }catch(Exception e){
    out.println("<p>메일전송 실패!!"+ e + "</p>");
    out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
 }//end

%>





<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>