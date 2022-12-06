<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ssi.jsp 공통코드 --%>

<%@ page import="kr.co.itwill.member.*"%>

<jsp:useBean id="dao" class="kr.co.itwill.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="dto" class="kr.co.itwill.member.MemberDTO"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8");%>