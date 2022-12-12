<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions" %>   

<script src="../js/jquery-3.5.1.min.js"></script>

<!--이미 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>

   
<!-- 본문작성 시작 -->	
	<div class="container" style="margin-top :70px;"></div>
	<form name="fom1" method="post" enctype="multipart/form-data">

	

	
	
<!-- 객관식  -->
	<div class="container">
		<label for="content"></label>
		<form name="commentInsertForm" id="commentInsertForm">
			<div>
				<input type="hidden" name="pno" id="pno" value="${dsurvey.dsv_no}">
				<input type="text" name="content" id="content" placeholder="내용을 입력해주세요">
				<button type="button" name="commentInsertBtn" id="commentInsertBtn">등</button>
				<select name="type" id="type">
					<option value="gaek">객관식</option>
					<option value="check">체크박스</option>
					<option value="ju">주관식</option>
					<option value="time">시간</option>
					<option value="schedule">날짜</option>
				</select> <br>
				<div id="typetable">
				
				</div>
			</div>
		</form>
	</div>
	<hr>
	<div class="container">
		<div class="commentList"></div>
		
	</div>	

    <div class="buttons">            
       <input type="text" name="txt"> <input type="button" class="btnAdd" value="Add"><br>        
    </div> 

	
	
<!-- 퀵메뉴 -->
<div class="quickmenu">
  <ul>
    <li><button id="btn_1" class="btnAdd">문항 생성</button></li>
    <li><button id="btn_2" type="submit">설문지 생성</button></li>
    <li><button id="btn_3" type="reset">설문지 삭제</button></li>
  </ul>
</div>		

	</form>
		
		
		
  <!-- 퀵메뉴 스크롤 따라 다니기 -->
  <script>
  	$(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
	  });
	});

  /////////////////// AJAX
  
	  $(document).ready (function () {                
	      $('.btnAdd').click (function () {                                        
	          $('.buttons').append (                        
	              '<input type="text" name="txt"> <input type="button" class="btnRemove" value="Remove"><br>'                    
	          ); // end append                            
	          $('.btnRemove').on('click', function () { 
	              $(this).prev().remove (); // remove the textbox
	              $(this).next ().remove (); // remove the <br>
	              $(this).remove (); // remove the button
	          });
	      }); // end click                                            
	  }); // end ready     
	  
	  
	  
	   	$("#type").change(function(){
	   		//alert($(this).val());
	   		$.post(
	   				 "booksend.do"
	   				,"book=" + $(this).val()
	   				, responseProc
	   				);
	   	}); // change() end
	   	
	   	function responseProc(result) {
	   		$("#display").append (
	   				'<input type="text" name="txt"> <input type="button" class="btnRemove1" value="Remove1"><br>'
	   			); // end append
	   			$('.btnRemove1').on('click', function () {
	   				$(this).prev().remove (); // remove the textbox
	   				$(this).next().remove (); // remove the <br>
	   				$(this).remove (); // remove the button
	   			});
	   	}// responseProc() end
  </script>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>