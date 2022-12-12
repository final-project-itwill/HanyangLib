<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<div class="container">
    <h3>회원상세보기 / 회원수정 / 회원삭제</h3>
    <form name="memberdetail" method="get" enctype="multipart/form-data">
    <table border="1" class="table table-hover">
        <tr>
            <td class="info">닉네임</td>
            <td><input type="text" name="m_nick" id="m_nick" value=""></td>
        </tr>
         <tr>
            <td class="info">비밀번호</td>
            <td><input type="password" name="m_pw" id="m_pw" value=""></td>
        </tr>
        <tr>
		    <th>*비밀번호 확인</th>
		    <td style="text-align: left"><input type="password" name="m_pw" id="m_pw" size="15" required></td>
		</tr>
        <tr>
        	<th>이메일</th>
            <td>
            	<input type="email" name="m_email" id="m_id">
            </td>
            
        </tr>
        <tr>
   		 <th>이메일 수신여부</th>
    		<td>
       			 <input type="checkbox" name="m_mailcheck" id="m_mailcheck" value="Y">
    		</td>
		</tr>
		<tr>
		    <th>sms 수신여부</th>
		    <td>
		        <input type="checkbox" name="m_smscheck" id="m_smscheck" value="Y">
		    </td>
		</tr>
        <tr>
            <td colspan="2" align="center">
                <input type="hidden" name="product_code" value="">
                <input type="button" class="btn btn-success" value="회원수정" onclick="">
                <input type="button" class="btn btn-danger" value="회원탈퇴" onclick="">
            </td>
        </tr>
      </table>
    </form>
   </div>
    <hr>
  

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>