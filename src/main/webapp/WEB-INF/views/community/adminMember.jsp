<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->

                <!-- 커뮤니티 구성원 목록 시작 -->
                <div class="container-fluid">

                    <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">구성원 관리하기</h1>
                    <p class="mb-4">현재 가입이 승인되어 활동하고 있는 사람들의 목록이에요.</p>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">'${read.c_name}' 승인 명단</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>아이디</th>
                                            <th>닉네임</th>
                                            <th>신청날짜</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="dto" items="${approvedMember}" varStatus="vs">
                                            <tr>
                                                <td>${vs.count}</td>
                                                <td><a href="#">${dto.s_id}</a></td><%--신청서 답변이랑 연결--%>
                                                <td>${dto.s_nick}</td>
                                                <td>${dto.s_rdate}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div><!-- 커뮤니티 구성원 목록 끝 -->

                <br><br>

                <!-- 승인/거절 대기 명단 시작 -->
                <div class="container-fluid">

                    <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">가입 신청</h1>
                    <p class="mb-4">가입의 승인을 기다리고 있는 사람들이에요.</p>


                    <div class="card shadow mb-4">

                        <div class="card-header py-3 row" style="margin: 0 10px 0 10px">
                            <span class="col-md-6">
                                <h6 class="m-0 font-weight-bold text-primary">'${read.c_name}' 가입 대기 명단</h6>
                            </span>
                            <!-- 승인/거절 버튼 -->
                            <span class="col-md-6" style="text-align: right!important">
                                <button class="btn-light border-0"><i class="fas fa-check"></i> 승인</button>
                                <button class="btn-light border-0"><i class="fas fa-trash"></i> 거절</button>
                            </span>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>아이디</th>
                                            <th>닉네임</th>
                                            <th>신청상태</th>
                                            <th>독서진행률</th>
                                            <th>신청날짜</th>
                                            <th>체크</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="dto" items="${waitingMember}" varStatus="vs">
                                            <tr>
                                                <td>${vs.count}</td>
                                                <td><a href="#">${dto.s_id}</a></td><%--신청서 답변이랑 연결--%>
                                                <td>${dto.s_nick}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${dto.s_state == 'i'}">승인 대기</c:when>
                                                        <c:when test="${dto.s_state == 'r'}">가입 거절</c:when>
                                                    </c:choose>
                                                </td>
                                                <td>0</td>
                                                <td>${dto.s_rdate}</td>
                                                <td><input type="checkbox" id="" name=""></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div><!-- 승인/거절 대기 명단 끝 -->



<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>

