<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <title>bookTest.jsp</title>
   <script src="../js/jquery-3.5.1.min.js"></script>
</head>
<body>

   <h3>질문입니다.</h3>

<form name="surveyInsertForm" id="surveyInserForm">   

   <button type="button" id="btnclick">추가</button>
   <div id="lists"></div>

</form>

   
   <script>
   let q_tag = `
		<table id="list">
   			<tr><td> <input type="text" name="subject">
   			<select name="type" id="type" class="type">
	   			<option>--선택 --</option>
	   			<option value="gaek">객관식</option>
	   			<option value="ju">주관식</option>
	   			<option value="check">체크박스</option>
	   			<option value="time">시간</option>
	   			<option value="schedule">날짜</option>
   			</select>
   			<br><div id="display"></div></td>
   			<td><button type="button" class="btnDel">Del</button>
   			</td></tr>
   			</table>
   			`;
	
   	let C_tag = `
   		<input type="radio" name="radio" readonly>
   		<input type="text" name="txt">
   		<input type="button" class="btnRemove" value="Remove"><br>
   			`;
   
	   $(document).on('click', '#btnclick', function(){ //btnclick라는 버튼을 눌렀을때 ->이벤트 등록
			$(this).before(q_tag);
	      	alert("질문추가");
	   }) // function() end
	   
	   
	   $(document).on("click", ".btnDel", function() { //list안의 btnDel을 선택
	     $(this).parent().parent().remove(); //this(btnDel)의 부모(td)의 부모(tr)를 삭제
	     
	   });  //#list end  
	 
   
   
	  	$(document).on("change", ".type", function() {
	   		let A = $(this).find('option:selected').val();

	   		console.log('type: ' + A);
	   		if(A=="gaek"){
		   		$("#display").html("<div class='buttons'>"
		   							+"<input type='radio' name='radio' readonly><input type='text' name='buttons'> <input type='button' class='btnAdd' value='Add'><br>"
		   							+"</div>"
		   							)// #display end
			   		$('.btnAdd').click (function () {
			   			$('.buttons').after (
			   						'<input type="radio" name="radio" readonly><input type="text" name="txt"><input type="button" class="btnRemove" value="Remove"><br>'
			   						); // end append	
			   			$('.btnRemove').on('click', function () { 
				              $(this).prev().remove (); // remove the textbox
				              $(this).prev().remove (); // remove the textbox
				              $(this).next ().remove (); // remove the <br>
				              $(this).remove (); // remove the button
				         			 }); // btnRemove end
			   		}) // btnAdd.click end
		   	// 주관식 
	   		} else if (A=="ju") {
	   			$("#display").html("<div class='buttons'>"
									+"<input type='text' name='ju' readonly>"
									+"</div>"
									)// #display end
				
			// 체크박스 
	   		}if(A=="check"){
		   		$("#display").html("<div class='buttons'>"
		   							+"<input type='checkbox' name='check'readonly><input type='text' name='buttons'> <input type='button' class='btnAdd' value='Add'><br>"
		   							+"</div>"
		   							)// #display end
		  	 		$('.btnAdd').click (function () {
		   				$('.buttons').after (
		   							'<input type="checkbox" name="txt"readonly><input type="text" name="txt"><input type="button" class="btnRemove" value="Remove"><br>'
		   							); // end append	
		   			$('.btnRemove').on('click', function () { 
			              $(this).prev().remove (); // remove the textbox
			              $(this).prev().remove (); // remove the textbox
			              $(this).next ().remove (); // remove the <br>
			              $(this).remove (); // remove the button
			        	  }); // btnRemove end
		   			}) // btnAdd.click end		
		   			
			// 시간 
	   		} else if (A=="time") {
	   			$("#display").html("<div class='buttons'>"
									+"<input type='time' name='time' readonly>"
									+"</div>"
	   								)// #display end 		
	   								
	   		// 날짜
	   		} else if (A=="schedule") {			
	   			$("#display").html("<div class='buttons'>"
									+"<input type='date' name='date' readonly>"
									+"</div>"   		
	   								)// #display end
	   		};// if end
	   	};// responseProc() end
	   		   
	    </script>
</body>
</html>