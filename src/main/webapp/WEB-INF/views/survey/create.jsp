<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions" %>   



<!--이미 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>

   
<!-- 본문작성 시작 -->	
<style>
	.survey {
		
	}
</style>
	
	
<!-- 설문 소개. -->	
<div class="site-section bg-light" id="blog-section">
  <div class="container">
	<h1>설문조사 ${dsv_code}</h1><br>
	<!-- <form name="frm1" method="post" action="/survey/create/insert" enctype="multipart/form-dat"> -->
	<div>
		<p class="survey">
			<input type="hidden" class="sv_comcode" name="sv_comcode" value=""> <!-- 커뮤니티 코드 받아오기 -->
			<input type="hidden" class="sv_code" name="sv_code" value="${dsv_code}">
		제목 : <input type="text" class="sv_title" name="sv_title" placeholder="해당 설문지의 제목을 입력하세요.">
		</p>
	</div>
	<div>
		<p class="survey">
		설명 : <input type="text" class="sv_des" name="sv_des" placeholder="해당 설문지의 설명을 입력하세요.">
		</p>
	</div>
	<br><hr><br>
	
<!-- 설문지 작 -->	

	<div class="q_div">
		<input type="text" name="q_title" placeholder="질문의 제목을 입력하세요."></input>

		<select name="q_type" class="q_type">
			<option value="0" selected>유형을 선택하여주세요</option>
			<option value="gaek">객관식</option>
			<option value="ju">주관식</option>
			<option value="check">체크박스</option>
			<option value="time">시간</option>
			<option value="schedule">날짜</option>

		</select>

		<div class="layer1" style="display: none">
			<br>
			<div>
				<div class="i_div">
					<label><input type='radio' name='radio' readonly>
					<input type='text' name="i_content" placeholder="객관식 답변을 입력"></input>
					</label>
				</div>
			</div>
			<button class="btn_answer">답안 추가</button>	
			<hr>
		</div>
		<div class="layer2" style="display: none">
			<div>
				<div class="i_div">
				<input type="text" name="i_content" readonly></input>
				</div>
			</div>
			<hr>
		</div>
		<div class="layer3" style="display: none">
			<div>
				<div class="i_div">
					<label><input type="checkbox" name='checkbox' readonly>
					<input type='text' name="i_content" placeholder="체크박스 답변을 입력"></input>
					</label>
				</div>
			</div>
			<button class="btn_checkans">답안 추가</button>
			<hr>
		</div>
		<div class="layer4" style="display: none">
			<div>
				<div class="i_div">
				<input type="time" name="i_content" readonly></input>
				</div>
			</div>
			<hr>
		</div>
		<div class="layer5" style="display: none">
			<div>
				<div class="i_div">
				<input type="date" name="i_content" readonly></input>
				</div>	
			</div>
			<hr>
		</div>		
	</div>

	<div>
		<button id="btn_add">질문추가</button>
	</div>
	<div>
		<button type="button" id="btn_survey">작성완료</button>
	</div>
	<!-- </form> -->
  </div> <!-- contaioner end -->
</div> <!-- site-section end -->

	<script>
    let q_tag = `
    <div class="q_div">
		<input type="text" name="q_title" placeholder="질문의 제목을 입력하세요."></input>

		<select name="q_type" class="q_type">
			<option value="0" selected>유형을 선택하여주세요</option>
			<option value="gaek">객관식</option>
			<option value="ju">주관식</option>
			<option value="check">체크박스</option>
			<option value="time">시간</option>
			<option value="schedule">날짜</option>
		</select>
		<div class="layer1" style="display: none">
				<div class="i_div">
					<label><input type='radio' name='radio' readonly>
					<input type='text' name="i_content"placeholder="객관식 답변을 입력"></input>
					</label>
				</div>
			<button class="btn_answer">답안 추가</button>		
			<hr>
		</div>
		<div class="layer2" style="display: none">
				<div class="i_div">
				<input type="text" name="i_content" readonly></input>
				</div>
			<hr>
		</div>
		<div class="layer3" style="display: none">
				<div class="i_div">
					<label><input type="checkbox" name='checkbox' readonly>
					<input type='text' name="i_content" placeholder="체크박스 답변을 입력"></input>
					</label>
				</div>
			<button class="btn_checkans">답안 추가</button>
			<hr>
		</div>
		<div class="layer4" style="display: none">
				<div class="i_div">
				<input type="time" name="i_content" readonly></input>	<hr>
				</div>
		</div>
		<div class="layer5" style="display: none">
				<div class="i_div">
				<input type="date" name="i_content" readonly></input>	
				</div>	
		</div>		
	</div>
	<button id="btn_Del">질문삭제</button><br>
	`; // add end
    
	//btn_add 클릭 질문 생성
    $(document).on('click', '#btn_add', function () {
     	$(this).before(q_tag);
    }); // #btn_add end
	
	//btn-Del 클릭 질문 삭제
	$(document).on('click', '#btn_Del', function (){
        $(this).prev().remove (); // remove the input date
        $(this).remove();		  // remove the button
	}); // #btn_Del end
    
 
	let a_tag =`
	<div class = "i_div">
		<input type='radio' name='radio' readonly>
		<input type='text' name="i_content" placeholder="객관식 답변을 입력"></input>
		<input type="button" class="Remove" value="답변삭제">
	</div>
	`; // radio end
	
	let c_tag =`
	<div class = "i_div">
		<input type='checkbox' name='checkbox' readonly>
		<input type='text' name="i_content" placeholder="체크박스 답변을 입력"></input>
		<input type="button" class="Remove" value="답변삭제">
	</div>
	`; // checkbox end
			
	$(document).on('click', '.btn_answer', function(){
		$(this).before(a_tag);
	}); // btn_answer.click end
	
	$(document).on('click', '.btn_checkans', function(){
		$(this).before(c_tag);
	}); // btb_checkans.click end
	
	$(document).on('click', '.Remove', function(){
        $(this).prev().remove (); // remove the textbox
        $(this).prev().remove (); // remove the textbox
        $(this).remove (); // remove the button
	}); // radioRemove.click end
	
	$(document).on('change', '.q_type', function() {
		let qs = $(this).find('option:selected').val();
	
		//let qs = $(this).val();
		//let qs =$("#question option:selected").val();
		
		console.log('type: ' + qs);
		if(qs == 'gaek'){ //객관식
 			$(this).next('.layer1').show();
 			$(this).next().next().hide();
 			$(this).next().next().next().hide();
 			$(this).next().next().next().next().hide();
 			$(this).next().next().next().next().next().hide();
 			
		}else if(qs == 'ju'){ //주관식
			$(this).next().hide();
 			$(this).next().next('.layer2').show();
 			$(this).next().next().next().hide();
 			$(this).next().next().next().next().hide();
 			$(this).next().next().next().next().next().hide();

		}else if(qs == 'check'){ //체크박스
			$(this).next().hide();
 			$(this).next().next().hide();
 			$(this).next().next().next('.layer3').show();
 			$(this).next().next().next().next().hide();
 			$(this).next().next().next().next().next().hide();

		}else if(qs == 'time'){ //시간
			$(this).next().hide();
 			$(this).next().next().hide();
 			$(this).next().next().next().hide();
 			$(this).next().next().next().next('.layer4').show();
 			$(this).next().next().next().next().next().hide();

		}else if(qs == 'schedule'){ //날짜
			$(this).next().hide();
 			$(this).next().next().hide();
 			$(this).next().next().next().hide();
 			$(this).next().next().next().next().hide();
 			$(this).next().next().next().next().next('.layer5').show();

		}
	}); // change q_type end
	
	$(document).on('click','#btn_survey',function(){
		let sv_code = $('p.survey').find('input.sv_code').val();
		let sv_title = $('p.survey').find('input.sv_title').val();
		let sv_des = $('p.survey').find('input.sv_des').val();
		
		
		let questions = [];
		$(".q_div").each(function (i) {
			let q_title = $(this).find('input[name="q_title"]').val();
			//let q_content = $(this).find('input[name="q_content"]:eq(1)').val();
			let q_type = $(this).find('option:selected').val();
		
			let items = [];
			$(this).find(".i_div").each(function (i) {
				//console.log($(this));
				
					let i_content = $(this).find('input[name="i_content"]').val();
					let item = {
						i_content: i_content
						};
					items.push(item);
				
			}); // i)div, functoin() end
			
			let question = {
				q_title: q_title,
				q_type: q_type,
				items: items
			}
			questions.push(question);
		
		}); //q_div, function() end
		
		let survey = {
			sv_code : sv_code,
			sv_title : sv_title,
			sv_des : sv_des,
			questions : questions
		};

		
		console.log(survey);
		$.ajax({
			type: "post",
			url:"/survey/create/insert",
			contentType: "application/json",
			data: JSON.stringify(survey),
			success:function(data){
			}
		})
		.done(function (data) {
			alert("성공");
			console.log('success');
		});
	});



  /////////////////// AJAX

  </script>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>