<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<!-- 헤더용 div -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-color: #0E2A47; height: 13vh;"></div>

<div class="container" style="padding-top: 100px;">
    <h4 style="font-weight: bold; text-align: center">1:1 문의</h4>
    <h6 style="text-align: center; margin-bottom: 15px">문의를 등록하세요</h6>



    <!-- 문의 form 시작 -->
    <form method="post" action="/inquiry/insert">
        <input type="hidden" name="ask_id" value="${s_id}">
        <table class="table table-borderless" style="text-align: center">
            <tbody>
            <tr>
                <th>문의 유형</th>
                <td>
                    <select name="ask_type" class="col-lg-10 custom-select-sm" required>
                        <option value="book">도서</option>
                        <option value="payment">결제</option>
                        <option value="member">회원정보</option>
                        <option value="subscribe">구독</option>
                        <option value="community">커뮤니티</option>
                        <option value="report">신문고</option>
                        <option value="etc">기타</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" name="ask_title" class="col-lg-10" placeholder="제목을 입력해주세요" required></td>
            </tr>
            <tr>
                <th>문의내용</th>
                <td><textarea name="ask_content" rows="5" class="col-lg-10" placeholder="문의 내용을 입력해주세요" required></textarea></td>
            </tr>
        </table>

        <div class="text-right">
            <button type="submit" class="btn btn-dark">문의 등록</button>
        </div>
    </form><!-- 문의 form 끝 -->

</div>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>