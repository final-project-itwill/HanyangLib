<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('/images/libbg.jpg'); height: 40vh;"></div>
<div class="container">
	<h3>* 회원탈퇴 *</h3>
	<form method="post" name="deleteform">
	  <input type="hidden" name="id" value="">
	  <table class="table" class="table table-hover">
	    <tr>
	      <th class="success">비밀번호</th>
	      <td><input type="password" name="m_pw" id="m_pw" value="" placeholder="비밀번호를 입력해주세요~!"  required></td>
	    </tr>
	    <tr>
	      <td colspan="2" align="center">
	            <input type="submit" value="회원탈퇴" class="btn btn-danger">
	       </td>
	    </tr>
	  </table>
	</form>
</div>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>