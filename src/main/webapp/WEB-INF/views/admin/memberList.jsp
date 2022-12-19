<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->

    <!-- 회원list 시작 -->
    <div class="container-fluid">

        <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">한양서재 이용자 목록</h1>
        <p class="mb-4">아이디를 클릭하면 세부정보를 볼 수 있어요.</p>


        <div class="card shadow mb-4">

            <form name="frm" method="post">

                <div class="card-header py-3 row" style="margin: 0 10px 0 10px">
                    <span class="col-md-6">
                        <h6 class="m-0 font-weight-bold text-primary">회원등급별</h6>
                    </span>
                </div>

                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>No.</th>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>구독여부</th>
                                <th>회원등급</th>
                                <th>온도</th>
                                <th>가입일</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="list" items="${memberList}" varStatus="vs">
                                <tr>
                                    <td>${vs.count}</td>
                                    <td>${list.m_id}</td>
                                    <td>${list.m_name}</td>
                                    <td>${list.m_gudok}</td>
                                    <td>${list.m_grade}</td>
                                    <td>${list.m_heat}</td>
                                    <td>${list.m_rdate}</td>
                                </tr>
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