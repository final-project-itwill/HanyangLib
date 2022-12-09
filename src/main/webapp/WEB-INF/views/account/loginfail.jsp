<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<!-- login.jsp -->
	<h1>로그인 실패</h1>
	1) JSP<br>
	<%=session.getAttribute("grade") %><br>
	아이디(세션) : <%=session.getAttribute("s_id") %><br>
	비번 (세션) : <%=session.getAttribute("s_pw") %><br>
	<hr>
	
	2)EL<br>
	${requestScope.message}<br>
	아이디(세션) : ${sessionScope.s_id}<br>	
	비번(세션) : ${sessionScope.s_pw}<br>	
	
	${user}<br>
	아이디(세션) : ${s_id}<br>
	비번(세션) : ${s_pw}<br>



<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>