<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<!-- 본문작성 시작 -->
 <!-- 아이디 입력 폼 -->
 <div class="container">
  <form method="post" class>
    <label for="userId">아이디</label>
    <input type="text" name="m_id" id="m_id"/>
    <button type="submit" id="findpw">확인</button>
  </form>
  </div>
  <script>
  $("#finpw").click(function() {
		$.post(
				"findpw"
				,"m_id=" + $("#m_id").val()
				,findPWProc()		
		);
	}); //click() end
	
	
	function findPWProc(result) {
		$("#idpanel").empty();
		$("#idpanel").html(result);
		$("#idpanel").show();
	}
</script>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>