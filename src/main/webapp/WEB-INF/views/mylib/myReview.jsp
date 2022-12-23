<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp"%>
<!-- 나만의 서재 관련 link, style 시작 -->
<link rel="stylesheet" href="/css/libtable.css">
<!-- Custom fonts for this template-->
<link href="/adminBootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/adminBootstrap/css/sb-admin-2.min.css" rel="stylesheet">

<style>
.site-nav .site-navigation .site-menu > li > a {
	color : black;
}
.site-nav .site-navigation .site-menu > li.active > a {
	color : black;
}
.lib-cont * {
	font-family: "KyoboHandwriting2020A";
}
.lib-cont  a, .lib-cont a:hover {
	color : black !important;
}
</style>
<!-- 나만의 서재 관련 link, style 끝 -->
<!-- 본문작성 시작 -->
<!-- 배너와 커뮤니티장 사진이 들어가는 곳 -->
	<div class="hero-slant" data-stellar-background-ratio="0.5" style="background-image: url('../../images/topbg.jpg'); height: 60vh;">
	</div>
<!-- 배너 끝 -->
<div class="container-fluid">
	<!-- 서평 목록 시작 -->
	<div class="lib-cont col-12">
	<div class="container pb-5 mb-5">
    <div class="row">
    	<div class="col-lg-12">
			<h1 class="text-black text-center" style="padding-top: 50px;">
				- 당신의 서평 -
			</h1>
			<h4 class="text-center" style="padding-bottom: 50px;">기록의 힘을 믿어요</h4>
		</div>
      <div class="col-lg-12">
        <div class="custom-accordion" id="accordion_1">
          <div class="accordion-item">
            <h2 class="mb-0">
              <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">서평은 개인의 의견입니다</button>
            </h2>

            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion_1">
              <div class="accordion-body">
                누군가의 자유로운 생각을 존중하는 태도로 비난보단 애정 듬뿍 담은 조언을 부탁드려요
              </div>
            </div>
          </div> <!-- .accordion-item -->

          <div class="accordion-item">
            <h2 class="mb-0">
              <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">서평이 맘에 드신다고요?</button>
            </h2>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion_1">
              <div class="accordion-body">
                여러분도 멋진 서평을 남길 수 있어요, 지금 당신의 서재에 가셔서 서평을 작성해보세요
              </div>
            </div>
          </div> <!-- .accordion-item -->
          <div class="accordion-item">
            <h2 class="mb-0">
              <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">기록하는 힘에 대하여</button>
            </h2>

            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion_1">
              <div class="accordion-body">
                끈기가 없는 사람은 꾸준하게 기록할 수 없어요, 여러분의 기록은 분명 시간이 지날 수록 더 빛을 발하는 보물이 되어줄 거예요 
              </div>
            </div>

          </div> <!-- .accordion-item -->

	      </div>
	    </div>
	  </div>
	</div>

	<table class="table">
	<c:if test="${lib_id eq s_id}">
	<tr>
		<td colspan="6" class="text-right">
		<div class="btn" onclick="location.href='/mylib/rvInsert?br_id=${lib_id}'" style="background-image: url('../../images/hy_btn_l.png'); background-repeat: no-repeat; background-size: contain; padding-right: 50px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서평 쓰러 가기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		</td>
	</tr>
	</c:if>
	<tr style="text-align: center;">
		<td colspan="3">제목</td>
		<td>책 이름</td>
		<td>별점</td>
		<td>조회수</td>
	</tr>
	<c:forEach items="${list}" var="rv">
	<tr style="text-align: center;">
		<td colspan="3"><a href="/mylib/reviewRead?br_no=${rv.br_no}">${rv.br_title}</a></td>
		<td>${rv.b_name}</td>
		<td>
		<c:forEach var="cnt" begin="1" end="${rv.br_star}" step="1">
			<img src="/images/star.png" width="15px">
		</c:forEach>	
		</td>
		<td>${rv.br_count}</td>
	</tr>
	</c:forEach>
	<tr><td colspan="6"><div class="col-lg-12" style="margin-right: 0">
	</div></td></tr>
	<tr><td colspan="6" class="text-center">
	<!-- 페이지 리스트 시작 -->
	<!-- 1-10 / 2-11 / 이런 식으로 출력하게 하고 싶어서 구현 -->
	<c:if test="${count>0}"> <!-- 글이 1개 이상 있다면 페이징 출력 -->
		<!-- 변수 지정 -->
		<!-- 내 글이 45개가 있다고 생각하고 변수값 예시를 들었다 -->
		<c:set var="pageCount" value="${totalPage}"/> <!-- 9, 글이 들어있는 총 페이지(글은 45개, 9페이지까지 글이 있음) -->
		<c:set var="startpage" value="${startPage}"/> <!-- 0, 페이지의 시작 지점 -->
		<c:set var="endPage" value="${endPage}"/> <!-- 11, 페이지의 끝 지점 -->
		
		<div class="content">
			<!-- 글이 있는 페이지의 끝지점보다 글이 들어있는 총 페이지가 작다면, 즉 10개의 페이지 안에 글이 다 들어갔다면 -->
			<c:if test="${endPage>pageCount}">
				<!-- 끝페이지 변수에 담긴 값을 글이 들어있는 총 페이지에서 1을 더해준 값으로 바꿔줌 -->
				<!-- 글이 있는 페이지까지만 출력을 시켜준다. 예를 들어 글이 9페이지 까지 있다면, endPage 변수는 10이 담기고 아래 반복문에서 출력에 쓰인다. -->
				<!-- 글이 들어있는 페이지가 10페이지 이상이라면 10페이지까지만 출력됨 -->
				<c:set var="endPage" value="${pageCount+1}"/>
			</c:if>

			<!-- 이전 버튼 띄우기 -->
			<!-- 내가 현재 1페이지라면 startPage는 0이다, 이전 버튼이 출력되지 않는다 -->
			<!-- 내가 현재 2페이지라면 startPage는 1이다, 이전 버튼이 출력된다 -->
			<c:if test="${pageNum>1}">
				<a href = "/mylib/myReview?lib_id=${lib_id}&pageNum=${pageNum-1}">[이전]</a>
			</c:if>
			
			<!-- 반복문 -->
			<!-- i라는 변수에 값을 담음 -->
			<!-- 페이지의 시작 지점부터 끝지점까지, 내가 1페이지라면 1부터 10까지 -->
			<c:forEach var="i" begin="${startpage+1}" end="${endPage-1}">
				<c:choose>
					<%-- i가 현재 페이지와 일치한다면 현재 페이지를 굵게 출력 --%>
					<c:when test="${pageNum==i}"><span style="font-weight: bold;">${i}</span></c:when>
					<%-- i가 현재 페이지와 일치하지 않는다면 해당 번호의 페이지로 이동하는 버튼을 출력 --%>
					<c:when test="${pageNum!=i}"><a href="/mylib/myReview?lib_id=${lib_id}&pageNum=${i}">${i}</a></c:when>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 버튼 띄우기 -->
			<!-- 내가 있는 곳이 마지막 페이지라면 다음 페이지를 띄우지 말아야 한다 -->
			<!-- 글이 있는 마지막 페이지보다 현재 페이지가 작아야지 다음을 띄움 -->
			<c:if test="${endPage>pageNum}">
				<a href = "/mylib/myReview?lib_id=${lib_id}&pageNum=${pageNum+1}">[다음]</a>
			</c:if>			
		</div>
	</c:if>
	<!-- 페이지 리스트 끝 -->
	</td></tr>
	</table>
	</div>
	<!-- 서평 목록 끝 -->
</div>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>