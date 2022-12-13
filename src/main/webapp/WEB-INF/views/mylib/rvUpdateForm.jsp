<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<!-- 헤더용 div -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-color: gray; height: 40vh;"></div>

<div style="text-align: center; margin-top: 30px">
    <h2 style="font-weight: bold; margin-bottom: 30px">서평 쓰기</h2>

    <div class="container-fluid col-lg-8">
    <form method="post" action="update">
    	<input type="hidden" id="br_id" name="br_id" value="${s_id}">
        <table class="table">
        <tr>
            <th>제목</th>
            <td><input type="text" name="br_title" id="br_title" class="col-lg-10" required></td>
        </tr>
        <tr>
            <th>서평할 책을 골라주세요</th>
            <td><input type="text" name="br_bcode" id="br_bcode" class="col-lg-10" required></td>
        </tr>
        <tr>
            <th>서평 내용을 작성해주세요</th>
            <td><textarea rows="5" name="br_content" id="br_content" class="col-lg-10" required></textarea></td>
        </tr>
        <tr>
        	<th>당신의 별점은!?</th>
        	<td><input type="range" name="br_star" id="br_star" min="1" max="5" required></td>
        </tr>

        </table>
        <div align="center">
            <input type="submit" value="등록">
            <input type="button" value="목록" onclick="location.href='list'">
        </div>
    </form>
    </div>
</div>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>