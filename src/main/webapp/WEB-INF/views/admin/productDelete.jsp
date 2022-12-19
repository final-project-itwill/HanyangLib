<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 관리</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">	
</head>
<body>

	<div class="title">도서 삭제</div>
	<form method="post" action="delete">
		<input type="hidden" name="b_code" value="${requestScope.b_code}">
		<div class = "content">
			<p>선택한 도서를 삭제하시겠습니까?</p>
			<p> *모든 도서 정보가 삭제됩니다* </p>
		</div>
		<div class='bottom'>
	        <input type='submit' value='삭제진행'>
	        <input type='button' value='도서목록' onclick="location.href=''">		
		</div>
	</form>
	
	
</body>
</html>