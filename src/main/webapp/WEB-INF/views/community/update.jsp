<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<div style="text-align: center; margin-top: 30px">
    <h2 style="font-weight: bold; margin-bottom: 30px">커뮤니티 수정하기</h2>

    <div class="container-fluid col-lg-8 card shadow">
        <p style="text-align: right"><a href="/comm/admin/${c_code}" style="color: #3b5998; margin-top: 20px">돌아가기</a></p>

        <div class="table-responsive">
        <form name="frm" method="post" action="/comm/update" enctype="multipart/form-data">
            <input type="hidden" name="c_code" value="${c_code}">

            <table class="table table-bordered" style="text-align: center">
                <tr>
                    <th>모집 현황</th>
                    <td> <div class="form-group">
					  <select class="form-control" name="c_state" id="sel1">
					    <option value="i">모집중</option>
					    <option value="d">모집완료</option>
					    <option value="e">활동중</option>
					  </select>
					</div></td>
                </tr>
                <tr>
                    <th>선택한 책</th>
                    <td>${read.b_name}</td>
                </tr>
                <tr>
                    <th>커뮤니티 이름</th>
                    <td><input type="text" name="c_name" value="${read.c_name}" class="col-lg-10" required></td>
                </tr>
                <tr>
                    <th>커뮤니티 설명</th>
                    <td><textarea name="c_des" class="col-lg-10" maxlength="500" rows="6">${read.c_des}</textarea></td>
                </tr>
                <tr>
                    <th>주모임 지역</th>
                    <td><input type="text" name="c_local" value="${read.c_local}" class="col-lg-10"></td>
                </tr>
                <tr>
                    <th>오픈채팅 주소</th>
                    <td><input type="text" name="c_chat" value="${read.c_chat}" class="col-lg-10"></td>
                </tr>
                <tr>
                    <th>커뮤니티 대표사진</th>
                    <td>
                        <br>
                        <img src="/storage/${read.c_banner}" width="300"><br><br>
                        <input type="file" name="poster" class="col-lg-10">
                    </td>
                </tr>
                <tr>
                    <th>최대 인원수</th>
                    <td><input type="number" name="c_count" min="2" value="${read.c_count}" class="col-lg-10"></td>
                </tr>
                <tr>
                    <td colspan="2" style="margin-top: 10px">
                        <button type="submit" class="btn btn-outline-light btn-block text-dark"style="font-weight: bold; color: #3b5998; border-color: #2a96a5;">
                            <i class="fas fa-fw fa-cog"></i>수정</button>
                    </td>
                </tr>
            </table>
        </form>
        </div>
    </div>

</div>

<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>