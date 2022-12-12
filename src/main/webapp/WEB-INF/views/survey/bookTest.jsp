<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <title>bookTest.jsp</title>
   <script src="../js/jquery-3.5.1.min.js"></script>
   <script src="../js/survey.js"></script>
</head>
<body>

   <h3>질문입니다.</h3>
   <input type="text" name="title">
   <select name="title" id="title">
   	  <option>--선택 --</option>
 	  <option value="0">객관식</option>
  	  <option value="1">주관식</option>
  	  <option value="2">체크박스</option>
  	  <option value="3">시간</option>
  	  <option value="4">날짜</option>
   </select>
   <br>
   <div id="display"></div>
   
<table id="list">
 <caption>
   <button type="button" id="btnclick">
     추가
   </button>
 </caption> 
</table>

   
   <script>
   
   $(function(){
	   $("#btnclick").click(function(){ //btnclick라는 버튼을 눌렀을때 ->이벤트 등록
	      var html = '<tr><td> <input type="text" name="title"> </td>'; //tr, td를 열고 + 문자열로 바꾸고 +td 닫기
	      html += '<td><select name="title" id="title">';
	      html += '		<option>--선택 --</option>';
		  html += '		<option value="0">객관식</option>';
		  html += '		<option value="1">주관식</option>';
		  html += '		<option value="2">체크박스</option>';
		  html += '		<option value="3">시간</option>';
		  html += '		<option value="4">날짜</option>';
		  html += '	</select></td>';
		  html += '<td><div id="display"></div></td>';
	      html += '<td><button type="button" class="btnDel">Del</button>'; //html변수에 삭제버튼을 대입
	      html += '</td></tr>';
	      
	      $("#list").append(html); //list라는 아이디에 html을 추가해라
	   });
	   
	   $("#list").on("click", ".btnDel", function() { //list안의 btnDel을 선택
	     $(this).parent().parent().remove(); //this(btnDel)의 부모(td)의 부모(tr)를 삭제
	     
	   });  //#list end  
	 }) // function() end
   
   
   
   
  	$("#title").change(function(){
   		// alert($(this).val());
   		$.post(
   				 "title.do"
   				,"title=" + $(this).val()
   				, responseProc
   				);
   	}); // change() end
   </script>
</body>
</html>