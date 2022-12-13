<%@page import="kr.co.itwill.book.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 대부분의 검색엔진 웹 크롤러 차단 -->
    <meta name="robots" content="noindex">
    <!-- 구글 검색엔진 웹 크롤러만 차단 -->
    <meta name="googlebot" content="noindex">
    <link rel="shortcut icon" href="favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/fonts/feather/style.css">
    <link rel="stylesheet" href="/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
   	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <script src="/js/jquery.cookie.js"></script>
    <title>&#128218 한양서재</title>
    <style>
    	* {
        font-size: 16px;
        font-family: Consolas, sans-serif;
      }
    </style>
</head>
<!-- 본문작성 시작 -->
<body>
<h3>상품 등록</h3>

<p>
	<button type = "button" onclick="location.href='#'">상품전체목록</button>
</p>


<form name="form1" method="post" action="insert" enctype="multipart/form-data">
<table border ="1">
	<tr>
		<td>도서코드(ISBN)</td>
		<td><input type="text" name="b_code"></td>
	</tr>

	<tr>
		<td>도서명</td>
		<td><input type="text" name="b_name"></td>
	</tr>
	<tr>
		<td>도서카테고리</td>
		<td>
			<div class="container">
			  <form>
			    <div class="form-check-inline">
			      <label class="form-check-label" for="check1">
			        <input type="checkbox" class="form-check-input" id="check1" value="novel" onclick=>소설/시
			      </label>
			    </div>
			    <div class="form-check-inline">
			      <label class="form-check-label" for="check2">
			        <input type="checkbox" class="form-check-input" id="check2" value="essay" onclick=>에세이
			      </label>
			    </div>
			    <div class="form-check-inline">
			      <label class="form-check-label" for="check3">
			        <input type="checkbox" class="form-check-input" id="check3" value="humanity" onclick=>인문
			      </label>
			    </div>
			    <div class="form-check-inline">
			      <label class="form-check-label" for="check4">
			        <input type="checkbox" class="form-check-input" id="check4" value="science" onclick=>자연과학
			      </label>
			    </div>
			  </form>
			</div>		
		</td>
	</tr>	
	<tr>
		<td>출판사</td>
		<td><input type="text" name="b_publish"></td>
	</tr>
	<tr>
		<td>작가</td>
		<td><input type="text" name="b_author"></td>
	</tr>
	 <tr>
        <td>구독서비스 제공</td>
        <td> 
        	<div class="container">
				<form>
					<div class="form-check-inline">
						<label class="form-check-label" for="radio1"> 
						<input type="radio" class="form-check-input" id="radio1"
								name="optradio" value="option1" > Y
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label" for="radio2"> 
						<input type="radio" class="form-check-input" id="radio2"
								name="optradio" value="option2" checked> N
						</label>
					</div>
				</form>
				</div>

				</td>
    </tr>
     <tr>
        <td>페이지수</td>
        <td> <input type="number" name="pages"> </td>
    </tr>   	
    <tr>
        <td>상품가격</td>
        <td> <input type="number" name="price"> </td>
    </tr>
    <tr>
		<td>출판일</td>
        <td> <input type="date" name="rdate"> </td>    
    </tr>
	<tr>
		<td>상품설명</td>
		<td><textarea rows="5" cols="60" name="b_des"></textarea></td>
	</tr>
 	<tr>
        <td>상품사진</td>
        <td> <input type="file" name="img"> </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <input type="submit" value="상품등록"> 
            <input type="button" value="등록취소" onclick="location.href='/book/booklist'"> 
        </td>
    </tr>	
	

</table>

</form>




</body>
</html>