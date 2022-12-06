<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<%

	Cookie cookie = new Cookie("cookieName", "cookieValue");
	response.addCookie(cookie);

    String id = request.getParameter("id");
    String password = request.getParameter("password");

    if(id.equals(password)){
        // ID와 암호가 같으면 로그인에 성공한 것으로 판단
        // response.addCookie(Cookie.createCookie("AUTH", id, "/", -1));
%>

로그인에 성공했습니다.


<%
    }else { // 로그인 실패시
%>
<script>
alert("로그인에 실패하였습니다.");
history.go(-1);
</script>
<%
    }
%>



<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>