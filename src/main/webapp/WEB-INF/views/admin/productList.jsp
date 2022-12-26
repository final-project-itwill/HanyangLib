<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">등록 도서</h6>
    </div>
        <div class="card-body">
            <div class="table-responsive">
            	<div class = row>
            		<div class="col-sm-12 col-md-4" style="position:right">
            			<div id="dateTable_filter" class="dateTables_filter">
            				<form name="keyword" action="/admin/search" method="get" class="sign-up-form d-flex">
								<input type="text" class="form-control" id="keyword" name="keyword" value="${keyword}" placeholder="책제목 또는 작가" style="width:180px">
								<input type="submit" class="btn-dark" value="검색" style="width: 40px; padding: 0px;">
							</form>
							<br>
            			</div>
            		</div>
            	</div>
            	<div class="row">
                 <table class="table table-bordered" id="dataTable" width="90%" cellspacing="0">
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
                                    <c:forEach var="dto" items="${list_a}">
                                        <tr>
                                            <td>${dto.b_code}</td>
                                            <td><a href="productDetail/${dto.b_code}">${dto.b_name}</a></td>
                                            <td>${dto.b_author}</td>
                                            <td>${dto.b_publish}</td>
                                            <td>${dto.b_rdate}</td>
                                            <td>${dto.b_cdate}</td>
                                            <td>${dto.b_price}</td>
                                            <td>${dto.b_gudok}</td>
                                        </tr>
                                    </c:forEach>
                     				</tbody>
                                </table>
							</div>
							<c:if test="${startPage ne null}">
								<!-- 페이지 리스트 -->
								<c:set var="pageCount" value="${totalPage}"></c:set>
								<c:set var="startPage" value="${startPage}"></c:set>
								<c:set var="endPage" value="${endPage}"></c:set>
								
								
								<div class="container-fluid" style="text-align: center">
									<!-- endPage는 10, 20, 30.. ex)총 페이지가 22일 때 endPage 30이 아닌 22까지 출력해야 함 -->
								        <c:if test="${endPage > pageCount}">
								            <c:set var="endPage" value="${pageCount}"></c:set>
								        </c:if>
								
								        <!-- 이전 : startPage는 10, 20, 30.. 따라서 1보다 크면 이전 페이지 이동 가능 -->
								        <c:if test="${startPage > 1}">
								            <a href="/admin/productlist?pageNum=${startPage-1}">[이전]</a>      <!-- pageNum값을 Controller에 보냄 -->
								        </c:if>
								
								        <!-- 현재페이지 볼드체 / 현재페이지 외 링크 걸기 -->
								        <c:forEach var="i" begin="${startPage}" end="${endPage}">
								            <c:choose>
								                <c:when test="${pageNum == i}"><span style="font-weight: bold">${i}</span></c:when>
								                <c:when test="${pageNum != i}"><a href="/admin/productlist?pageNum=${i}">[${i}]</a></c:when>
								            </c:choose>
								        </c:forEach>
								
								        <!-- 다음 이동 -->
								        <c:if test="${endPage < pageCount}">
								            <a href="/admin/productlist?pageNum=${endPage+1}">[다음]</a>
								        </c:if>
								</div>
							</c:if>
                            </div>
                        </div>
                    </div>

<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>