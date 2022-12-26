<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->
<br>

<div class="container-fluid">
    <h3 class="h3 mb-2 text-gray-800" style="font-weight: bold">공지사항</h3>
    <p class="mb-4"> 한양서재의 새로운 공지사항을 작성하는 공간이에요. </p>

    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">

                <!--공지사항 update form 시작-->
                <form method="post" action="/notice/update">
                    <input type="hidden" name="n_no" value="${read.n_no}">
                    <table class="table">
                        <tr>
                            <th>카테고리 선택</th>
                            <td>
                                <select name="n_type" class="col-lg-10">
                                    <option value="info" <c:if test="${read.n_type == 'info'}">selected</c:if>>기본</option>
                                    <option value="book" <c:if test="${read.n_type == 'book'}">selected</c:if>>도서</option>
                                    <option value="comm" <c:if test="${read.n_type == 'comm'}">selected</c:if>>커뮤니티</option>
                                    <option value="payment" <c:if test="${read.n_type == 'payment'}">selected</c:if>>결제/환불</option>
                                    <option value="event" <c:if test="${read.n_type == 'event'}">selected</c:if>>이벤트</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="n_title" id="n_title" value="${read.n_title}" class="col-lg-10" required></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td><textarea rows="5" name="n_content" id="n_content" class="col-lg-10">${read.n_content}</textarea></td>
                        </tr>
                    </table>
                    <div align="center">
                        <input type="submit" class="btn btn-outline-primary" value="수정하기">
                    </div>
                </form><!--공지사항 update form 끝 -->

            </div>
        </div>

        </form>
    </div>

</div>

<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>