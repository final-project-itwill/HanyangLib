<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->
<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>상품번호</th>
                                            <th>도서명</th>
                                            <th>작가</th>
                                            <th>출판사</th>
                                            <th>출판일</th>
                                            <th>등록일</th>
                                            <th>가격</th>
                                            <th>구독여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="dto" items="${list}">
                                        <tr>
                                            <td>${dto.b_code}</td>
                                            <td>${dto.b_name}</td>
                                            <td>${dto.b_author}</td>
                                            <td>${dto.b_publish}</td>
                                            <td>${dto.b_cdatd}</td>
                                            <td>${dto.b_rdate}</td>
                                            <td>${dto.b_price}</td>
                                            <td>${dto.b_gudok}</td>
                                        </tr>
                                    </c:forEach>
                     				</tbody>
                                </table>
                            </div>
                        </div>
                    </div>


<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>