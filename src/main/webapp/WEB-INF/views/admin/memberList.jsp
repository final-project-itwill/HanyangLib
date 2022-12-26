<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->

    <!-- 회원list 시작 -->
    <div class="container-fluid">

        <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">한양서재 이용자 목록</h1>
        <p class="mb-4">이용자의 회원 등급과 온도를 변경할 수 있어요.</p>


        <div class="card shadow mb-4">

            <form name="frm" method="post">

                <div class="card-header py-3 row" style="margin: 0 10px 0 10px">

                </div>

                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr align="center">
                                <th>No.</th>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>구독여부</th>
                                <th>회원등급</th>
                                <th>온도</th>
                                <th>가입일</th>
                                <th>등급변경</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="list" items="${memberList}" varStatus="vs">
                                <form action="/admin/updateMember" method="post">
                                    <input type="hidden" name="m_id" value="${list.m_id}">
                                    <tr align="center">
                                        <td>${vs.count}</td>
                                        <td>${list.m_id}</td>
                                        <td>${list.m_name}</td>
                                        <td>${list.m_gudok}</td>
                                        <td>
                                            <select name="m_grade" class="btn btn-sm btn-outline-dark">
                                                <option value="A" <c:if test="${list.m_grade == 'A'}">selected</c:if>>관리자</option>
                                                <option value="B" <c:if test="${list.m_grade == 'B'}">selected</c:if>>커뮤니티장</option>
                                                <option value="C" <c:if test="${list.m_grade == 'C'}">selected</c:if>>일반회원</option>
                                                <option value="F" <c:if test="${list.m_grade == 'F'}">selected</c:if>>탈퇴회원</option>
                                            </select>
                                        </td>
                                        <td><input type="number" step="0.1" name="m_heat" value="${list.m_heat}" class="btn-outline-dark" style="width: 80px"></td>
                                        <td>${list.m_rdate}</td>
                                        <td>
                                            <button type="submit" class="btn btn-info"><i class="fas fa-fw fa-wrench"></i>변경</button>
                                        </td>
                                    </tr>
                                </form>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </form>
        </div>

    </div><!-- 회원 list 끝 -->


<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>