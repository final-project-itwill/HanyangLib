<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<!-- 배너 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('/images/libbg.jpg'); height: 40vh;"></div>
<!-- 배너 끝 -->
<div class="container-fluid">
	<div class="row lib-row">
		<!-- 개인정보창 -->
		<div class="lib-info col-12 col-sm-3 col-lg-3">
		<c:forEach items="${libInfo}" var="info">
			<table class="table">
			<tr align="center">
				<td valign="middle" style="line-height: 180%;">
					<span style="font-weight: bold; font-size: 35px;">
						<a href="/mylib/libindex/${lib_id}">${info.m_nick}</a>
					</span><br>
					${lib_id}<br>
				</td>
			</tr>
			<tr>
				<td>
					<div style="background-image: url('/images/heart.png');
								background-position: center;
								background-repeat: no-repeat;
								background-size: 10vh;
								position: relative;
								height: 10vh;">
					<p style="color: white; font-weight: bold; text-align: center; padding-top: 2vh;">${info.m_heat}</p>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					서재에 있는 책은 모두 : ${bookCount}권<br>
					80% 이상 읽은 책은 : ${book80Count}권
				</td>
			</tr>
			<tr>
				<td>
				<button class="btn btn-warning">이번 달 목표 설정하기</button>
				</td>
			</tr>
			<tr>
				<td>
					이번 달은<br>
					<span style="font-weight: bold; font-size: 35px;">4</span> 권 읽기
				</td>
			</tr>
			<tr>
				<td>
					이번 해는<br>
					<span style="font-weight: bold; font-size: 35px;">12</span> 권 읽기
				</td>
			</tr>
			</table>
		</c:forEach>
		</div>
		<!-- 상세페이지 -->
		<!-- 책 목록 시작 -->
		<div class="lib-cont col-12 col-sm-9 col-lg-9">
		  <div class="container pb-5 mb-5 border-bottom">
		    <div class="row">
		      <div class="col-lg-12">
		        <h1 class="mb-3 text-black text-center">보물과도 같은 책들이<br>쌓여있어요</h1>
		      </div>
		      <div class="col-lg-12">
		        <div class="row gutter-1 gallery">
		        <c:forEach items="${libRead}" var="read" varStatus="vs">
		          <div class="col-3">
		            <a href="images/${read.b_bookcover}" class="gal-item" data-fancybox="gal"><img src="images/${read.b_bookcover}" alt="Image" class="img-fluid"></a>
					<a href="detail/${read.b_code}">${read.b_name}</a>
					<br>
					진행도 : <fmt:formatNumber value="${read.lib_proc}" pattern="###"/>%
		          </div>
		        </c:forEach>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 책 목록 끝 -->
	</div>
</div>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>