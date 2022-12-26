<%@page import="kr.co.itwill.book.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 본문작성 시작 -->
<body>
	<!-- 상단 시작과 검색창 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5"
		style="background-image: url('../images/essay.jpg'); height: 80vh; margin-bottom: 20px;">
		<div class="container">
				   <div class="row align-items-center justify-content-between">
		     <div class="col-lg-7 intro">
		       <h1 class="text-white font-weight-bold mb-4" data-aos="fade-up" data-aos-delay="0" style="text-shadow: 3px 3px 3px black;">에세이</h1>
		       		<form name="keyword" action="search" method="post" class="sign-up-form d-flex" data-aos="fade-up" data-aos-delay="100">
						<input type="text" class="form-control" id="keyword" name="keyword" value="${keyword}" placeholder="책제목 또는 작가를 검색해보세요">
						<input type="submit" class="btn-dark" value="검색" style="width: 40px; padding: 0px;">
					</form>
		     </div>
		    </div>
		</div>
	</div>

<div class="container border-bottom">


	<table border="0" align = "center" width=70%>
		<tr>
			<td>
			<c:forEach var="dto" items="${list_e}">
				<div class="col-12">
					<div class="post-entry horizontal d-md-flex">
						<div class="media">
							<a href="#">
							<img src="${dto.b_bookcover}"
								style="width: 140px; margin-right: 20px;"></a>
						</div>
						<div class="text">
							<div class="meta">
								<span>출판사 ${dto.b_publish}</span> <span>&bullet;</span> <span>작가 ${dto.b_author}</span>
							</div>
							<h3>
								<a href="/book/bookdetail/${dto.b_code}" style="color: #906D3B">${dto.b_name}</a>
							</h3>
							<p>출판일 ${dto.b_rdate}</p>
							<p>${dto.b_des}</p>
						</div>
					</div>
				</div>
				</c:forEach>
			</td>
		</tr>

	</table>


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
            <a href="/book/bookcate_e?pageNum=${startPage-1}">[이전]</a>      <!-- pageNum값을 Controller에 보냄 -->
        </c:if>

        <!-- 현재페이지 볼드체 / 현재페이지 외 링크 걸기 -->
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${pageNum == i}"><span style="font-weight: bold">${i}</span></c:when>
                <c:when test="${pageNum != i}"><a href="/book/bookcate_e?pageNum=${i}">[${i}]</a></c:when>
            </c:choose>
        </c:forEach>

        <!-- 다음 이동 -->
        <c:if test="${endPage < pageCount}">
            <a href="/book/bookcate_e?pageNum=${endPage+1}">[다음]</a>
        </c:if>
</div>

</div>



  <!-- 퀵메뉴 스크롤 따라 다니기 -->
  <script>
  	$(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
	  });
	});
  </script>
  

</body>


<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>