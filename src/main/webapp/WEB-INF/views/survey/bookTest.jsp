<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <title>bookTest.jsp</title>
   <script src="../js/jquery-3.5.1.min.js"></script>
</head>
<body>
   <h3>교재선택</h3>
   
   <select name="book" id="book">
   	  <option>--선택 --</option>
 	  <option value="0">book_1</option>
  	  <option value="1">book_2</option>
  	  <option value="2">book_3</option>
  	  <option value="3">book_4</option>
   </select>
   <br>
   <div id="display"></div>
   
   <script>
   
   	$("#book").change(function(){
   		//alert($(this).val());
   		$.post(
   				 "booksend.do"
   				,"book=" + $(this).val()
   				, responseProc
   				);
   	}); // change() end
   	
   	function responseProc(result) {
   		$("#display").html("<img src='../images/" + result + "'>")
   	}// responseProc() end
   	
   </script>
</body>
</html>