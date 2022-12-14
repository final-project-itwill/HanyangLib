<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 createForm.jsp -->

<!-- 헤더용 div -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-color: gray; height: 40vh;"></div>

<div style="text-align: center; margin-top: 30px">
    <h2 style="font-weight: bold; margin-bottom: 30px">공지사항 등록하기</h2>

    <div class="container-fluid col-lg-8">
    <form method="post" action="insert">
        <table class="table">
        <tr>
            <th>카테고리 선택</th>
            <td>
                <select name="n_type" class="col-lg-10">
                    <option value="info" selected>기본</option>
                    <option value="book">도서</option>
                    <option value="comm">커뮤니티</option>
                    <option value="payment">결제/환불</option>
                    <option value="event">이벤트</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>제목</th>
            <td><input type="text" name="n_title" id="n_title" class="col-lg-10" required></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea rows="5" name="n_content" id="n_content" class="col-lg-10"></textarea></td>
        </tr>

        </table>
        <div align="center">
            <input type="submit" value="등록">
            <input type="button" value="목록" onclick="location.href='list?pageNum=1'">
        </div>
    </form>
    </div>
</div>


<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>