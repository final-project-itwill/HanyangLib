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
		style="background-image: url('../images/human.jpg'); height: 80vh; margin-bottom: 20px;">
		<div class="container">
			<div class="row align-items-center justify-content-between"
				style="display: flex; flex-direction: row-reverse;">
				<div class="col-lg-12 intro">
					<h1 class="text-white text-left font-weight-bold mb-4"
						data-aos="fade-up" data-aos-delay="0"
						style="text-shadow: 3px 3px 3px black;">
						인문
					</h1>
					<form action="read" class="sign-up-form d-flex" data-aos="fade-up"
						data-aos-delay="100">
						<input type="text" class="form-control"
							placeholder="책제목 또는 작가를 검색해보세요">
						<button type="submit" class="btn-dark"
							style="width: 40px; padding: 0px;">
							<i class="fa-solid fa-magnifying-glass text-center"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>


<!-- 오늘 본 책 시작 -->
	<div class="quickmenu">
	  <ul>
	    <li><a>최근 본 서책</a></li>
	    <li><a href="#">최근책사진</a></li>
	    <li><a href="#">1:1문의</a></li>
	    <li><a href="#">후기</a></li>
	  </ul>
	</div>
<!-- 오늘 본 책 끝-->




	<table border="0" align = "center">
		<tr>
			<td>
			<c:forEach var="dto" items="${list_h}">
				<div class="col-12">
					<div class="post-entry horizontal d-md-flex">
						<div class="media">
							<a href="#">
							<img src="/images/${dto.b_bookcover}"
								style="width: 140px; margin-right: 20px;"></a>
						</div>
						<div class="text">
							<div class="meta">
								<span>출판사 ${dto.b_publish}</span> <span>&bullet;</span> <span>작가 ${dto.b_author}</span>
							</div>
							<h2>
								<a href="#" style="color: #906D3B">${dto.b_name}</a>
							</h2>
							<p>출판일 ${dto.b_rdate}</p>
							<p>${dto.b_des}</p>

						</div>
					</div>
				</div>
				</c:forEach>
			</td>
		</tr>

	</table>


<div style = "display : inliine-block; color : black; float : left; padding : 8px 16px; text-decoration: none; text-align:center;">
  <a href="#">&laquo;</a>
  <a href="#">1</a>
  <a class="active" href="#">2</a>
  <a href="#">3</a>
  <a href="#">4</a>
  <a href="#">5</a>
  <a href="#">6</a>
  <a href="#">&raquo;</a>
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