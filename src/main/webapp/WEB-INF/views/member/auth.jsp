<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- auth.jsp -->
<!-- 로그인 상태 정보 확인 -->

<%
	String s_id="";     //session id
	String s_passwd=""; //session passwd
	String s_mlevel=""; //session mlevel
	
	if(session.getAttribute("s_id")==null || session.getAttribute("s_passwd")==null || session.getAttribute("s_mlevel")==null){
		//로그인 하지 않았다면
		s_id="guest"; 
		s_passwd="guest";
		s_mlevel="guest";
		
	}else{
		
		//로그인 성공했다면
		s_id	=(String)session.getAttribute("s_id");
		s_passwd=(String)session.getAttribute("s_passwd");
		s_mlevel=(String)session.getAttribute("s_mlevel");
	}//if end 

%>