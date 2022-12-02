<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<div class="container">
<form>
    <table border="1" width="400px">
       <tr>
            <th>아이디</th>
            <td>
                <input type="text" name="userid" id="userid">
                <input type="button" value="아이디중복확인" id="btn_userid">
                <br>
                <div id="panel" style="display: none;">
                </div>
            </td>
       </tr> 
    </table>
</form>
</div>

<script>
	
	
	$("#btn_userid").click(function() {
		$.post(
				"idcheckproc.do"
				,"userid=" + $("#userid").val().trim()
				,responseProc		
		)
	}); //click() end
	
	
	function responseProc() {
		$("#panel").empty();
		$("#panel").html(result);
		$("#panel").show();
	}//responseProc() end
	
	
	
	
	
	
	
</script>






<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>