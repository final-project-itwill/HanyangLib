<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../community/admin_header.jsp"%>

<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions" %>   


   
<!-- 본문작성 시작 -->	
<div style="text-align: center; margin-top: 30px">
    <h2 style="font-weight: bold; margin-bottom: 30px">커뮤니티 수정하기</h2>

    <div class="container-fluid col-lg-8 card shadow">
        <p style="text-align: right"><a href="/comm/admin/${c_code}" style="color: #3b5998; margin-top: 20px">돌아가기</a></p>

        <div class="table-responsive">	
<div class="site-section bg-light" id="blog-section">
  <div class="container">
	<h1>설문조사 ${dsv_code} ${s_id}</h1><br>

	<input type="hidden" id="ans_code" name="ans_code" class="ans_code" value="${dsv_code}"> <!-- dsv_code -->
	<input type="hidden" id="ans_id" name="ans_id" class="ans_id" value="${s_id}"> <!-- dsv_code --> 

>
	<c:forEach items="${title}" var="title" varStatus="tvs">		
	<div class="q_div">	
	
			<input type="text" name="q_title" value="${title.dsv_subject}" placeholder="질문의 제목을 입력하세요." required></input>
			<c:choose>
	
				<c:when test="${title.dsv_type eq 'ju'}">
					<select name="q_type" class="q_type">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek">객관식</option>
						<option value="ju"selected>주관식</option>
						<option value="check">체크박스</option>
						<option value="time">시간</option>
						<option value="schedule">날짜</option>
					</select>
					<c:forEach items="${choice}" var="choice">
						<c:choose>
						<c:when test="${title.dsv_order eq choice.ch_order}">
						<div class="layer1" style="display: none"> 
							<div>
								<div class="gaek">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content" placeholder="객관식 답변을 입력" required></input>
									<input type="button" class="rRemove" value="답변삭제">
									</label>
								</div>
							</div>
							<button class="btn_answer">답안 추가</button>	
							<hr>
						</div> <!-- layer1 end -->
						<div class="layer2" >
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer2 end -->
						<div class="layer3" style="display: none">
							<div>
								<div class="check">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" placeholder="체크박스 답변을 입력" required></input>
									<input type="button" class="rRemove" value="답변삭제">
									</label>
								</div>
							</div>
							<button class="btn_checkans">답안 추가</button>
							<hr>
						</div> <!-- layer3 end -->
						<div class="layer4" style="display: none">
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div>  <!-- layer4 end -->
						<div class="layer5" style="display: none">
							<div>
								<div class="schedule">
								<input type="date" name="i_content" readonly></input>
								</div>	
							</div>
						</div>  <!-- layer5 end -->	
						
						</c:when> 
						</c:choose>
					</c:forEach><!-- ju choice end -->
				</c:when>
	
				<c:when test="${title.dsv_type eq 'gaek' or 'etc'}">
					<select name="q_type" class="q_type">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek" selected>객관식</option>
						<option value="ju">주관식</option>
						<option value="check">체크박스</option>
						<option value="time">시간</option>
						<option value="schedule">날짜</option>
					</select>
						<div class="layer1" >
							<div>
							<c:forEach items="${choice}" var="choice">
							<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">
								<div class="gaek">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content"  value="${choice.ch_content}" placeholder="객관식 답변을 입력" required></input></label>
									<input type="button" class="rRemove" value="답변삭제">
								</div>
							</c:when>
							</c:choose>
							</c:forEach> <!-- gaek choice end -->
							
							</div>
							<button class="btn_answer">답안 추가</button>	
							<hr>
						</div> <!-- layer1 end -->
						<div class="layer2" style="display: none">
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer2 end -->
						<div class="layer3" style="display: none">
							<div>
								<div class="check">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" placeholder="체크박스 답변을 입력" required></input>
									<input type="button" class="rRemove" value="답변삭제">
									</label>
								</div>
							</div>
							<button class="btn_checkans">답안 추가</button>
							<hr>
						</div> <!-- layer3 end -->
						<div class="layer4" style="display: none">
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer4 end -->
						<div class="layer5" style="display: none">
							<div>
								<div class="schedule">
								<input type="date" name="i_content" readonly></input>
								</div>	
							</div>
						</div> <!-- layer5 end -->	
						
				</c:when>
				
					
				<c:when test="${title.dsv_type eq 'check' or 'etc' }">
					
					<select name="q_type" class="q_type">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek" >객관식</option>
						<option value="ju">주관식</option>
						<option value="check" selected>체크박스</option>
						<option value="time">시간</option>
						<option value="schedule">날짜</option>
					</select>
						<div class="layer1" style="display: none">
							<div>
								<div class="gaek">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content"  placeholder="객관식 답변을 입력" required></input></label>
									<input type="button" class="rRemove" value="답변삭제">
								</div>
							</div>
							<button class="btn_answer">답안 추가</button>	
							<hr>
						</div> <!-- layer1 end -->
						<div class="layer2" style="display: none">
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer2 end -->
						<div class="layer3">
							<div>
							<c:forEach items="${choice}" var="choice">
							<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">							
								<div class="check">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" value="${choice.ch_content}" placeholder="체크박스 답변을 입력" required></input>
									<input type="button" class="rRemove" value="답변삭제">
									</label>
								</div>
							</c:when>
							</c:choose>
							</c:forEach> <!-- gaek choice end -->								
							</div>
							<button class="btn_checkans">답안 추가</button>
							<hr>
						</div> <!-- layer3 end -->
						<div class="layer4" style="display: none">
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer4 end -->
						<div class="layer5" style="display: none">
							<div>
								<div class="schedule">
								<input type="date" name="i_content" readonly></input>
								</div>	
							</div>
						</div> <!-- layer5 end -->	
						
				</c:when>
				
				<c:when test="${title.dsv_type eq 'schedule' }">	
					<select name="q_type" class="q_type">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek">객관식</option>
						<option value="ju">주관식</option>
						<option value="check">체크박스</option>
						<option value="time" selected>시간</option>
						<option value="schedule">날짜</option>
					</select>
					<c:forEach items="${choice}" var="choice">
						<c:choose>
						<c:when test="${title.dsv_order eq choice.ch_order}">
						<div class="layer1" style="display: none">
							<div>
								<div class="gaek" style="display: none">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content" placeholder="객관식 답변을 입력" required></input>
									<input type="button" class="rRemove" value="답변삭제">
									</label>
								</div>
							</div>
							<button class="btn_answer">답안 추가</button>	
							<hr>
						</div> <!-- layer1 end -->
						<div class="layer2" >
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer2 end -->
						<div class="layer3" style="display: none">
							<div>
								<div class="check">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" placeholder="체크박스 답변을 입력" required></input>
									<input type="button" class="rRemove" value="답변삭제">
									</label>
								</div>
							</div>
							<button class="btn_checkans">답안 추가</button>
							<hr>
						</div> <!-- layer3 end -->
						<div class="layer4" >
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div>  <!-- layer4 end -->
						<div class="layer5" style="display: none">
							<div>
								<div class="schedule">
								<input type="date" name="i_content" readonly></input>
								</div>	
							</div>
						</div>  <!-- layer5 end -->	
						
						</c:when> 
						</c:choose>
					</c:forEach><!-- schedule choice end -->

				</c:when>
						
				<c:when test="${title.dsv_type eq 'time' }">
					
	
						<select name="q_type" class="q_type">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek">객관식</option>
						<option value="ju">주관식</option>
						<option value="check">체크박스</option>
						<option value="time" >시간</option>
						<option value="schedule" selected>날짜</option>
					</select>
					<c:forEach items="${choice}" var="choice">
						<c:choose>
						<c:when test="${title.dsv_order eq choice.ch_order}">
						<div class="layer1" style="display: none">
							<div>
								<div class="gaek" style="display: none">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content" placeholder="객관식 답변을 입력" required></input>
									<input type="button" class="rRemove" value="답변삭제">
									</label>
								</div>
							</div>
							<button class="btn_answer">답안 추가</button>	
							<hr>
						</div> <!-- layer1 end -->
						<div class="layer2" >
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div> <!-- layer2 end -->
						<div class="layer3" style="display: none">
							<div>
								<div class="check">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" placeholder="체크박스 답변을 입력" required></input>
									<input type="button" class="rRemove" value="답변삭제">
									</label>
								</div>
							</div>
							<button class="btn_checkans">답안 추가</button>
							<hr>
						</div> <!-- layer3 end -->
						<div class="layer4" style="display: none">
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
							<hr>
						</div>  <!-- layer4 end -->
						<div class="layer5" >
							<div>
								<div class="schedule">
								<input type="date" name="i_content" readonly></input>
								</div>	
							</div>
						</div>  <!-- layer5 end -->		
						
						</c:when> 
						</c:choose>
					</c:forEach><!-- schedule choice end -->
					
				</c:when>
			</c:choose>					
			
		</div>
		<button id="btn_Del">질문삭제</button>	
		</c:forEach> 
		  	<div>
				<button id="btn_add">질문추가</button>
			</div>
			
			<br><hr><br>
			<div>
				<button type="button" id="btn_survey" >작성완료</button>
			</div>
				
			
		  </div> <!-- contaioner end -->
		
		</div> <!-- site-section end -->
        </div>
    </div>
    </div>



	<script>
    let q_tag = `
    <div class="q_div">
		<input type="text" name="q_title" placeholder="질문의 제목을 입력하세요."></input>
		<select name="q_type" class="q_type">
			<option value="0" selected>유형을 선택하여주세요</option>
			<option value="gaek">객관식</option>
			<option value="ju">주관식</option>x 
			<option value="check">체크박스</option>
			<option value="time">시간</option>
			<option value="schedule">날짜</option>
		</select>
		<div class="layer1" style="display: none">
				<div class="gaek">
					<label><input type='radio' name='radio' onclick="return(false);">
					<input type='text' name="i_content"placeholder="객관식 답변을 입력" required></input>
					</label>
					<input type="button" class="rRemove" value="답변삭제">
				</div>
			<button class="btn_answer">답안 추가</button>		
			<hr>
		</div>
		<div class="layer2" style="display: none">
				<div class="ju">
				<input type="text" name="i_content" readonly></input>
				</div>
			<hr>
		</div>
		<div class="layer3" style="display: none">
				<div class="check">
					<label><input type="checkbox" name='checkbox' onclick="return(false);">
					<input type='text' name="i_content" placeholder="체크박스 답변을 입력" required></input>
					</label>
					<input type="button" class="rRemove" value="답변삭제">
				</div>
			<button class="btn_checkans">답안 추가</button>
			<hr>
		</div>
		<div class="layer4" style="display: none">
				<div class="time">
				<input type="time" name="i_content" readonly></input>	<hr>
				</div>
		</div>
		<div class="layer5" style="display: none">
				<div class="schedule">
				<input type="date" name="i_content" readonly></input>	
				</div>	
		</div>
		</div>
		<button id="btn_Del">질문삭제</button>
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
	<div class = "gaek">
		<input type='radio' name='radio' readonly>
		<input type='text' name="i_content" placeholder="객관식 답변을 입력" required></input>
		<input type="button" class="rRemove" value="답변삭제">
	</div>
	`; // radio end
	
	let c_tag =`
	<div class = "check">
		<input type='checkbox' name='checkbox' readonly>
		<input type='text' name="i_content" placeholder="체크박스 답변을 입력" required></input>
		<input type="button" class="cRemove" value="답변삭제">
	</div>
	`; // checkbox end
			
	$(document).on('click', '.btn_answer', function(){
		$(this).before(a_tag);
		//alert(rcount);
	}); // btn_answer.click end
	
	$(document).on('click', '.btn_checkans', function(){
		$(this).before(c_tag);
		//alert(ccount);
	}); // btb_checkans.click end
	
	$(document).on('click', '.rRemove', function(){
        $(this).prev().remove (); // remove the textbox
        $(this).prev().remove (); // remove the textbox
        $(this).remove (); // remove the button
       // alert(rcount);
	}); // radioRemove.click end
	
	$(document).on('click', '.cRemove', function(){
        $(this).prev().remove (); // remove the textbox
        $(this).prev().remove (); // remove the textbox
        $(this).remove (); // remove the button
		// alert(ccount);
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
		let sv_code = '${dsv_code}';
		alert(sv_code);
		let updelete = { sv_code : sv_code };
			$.ajax({
				type: "post",
				url:"/survey/update/updelete",
				contentType: "application/json",
				data: JSON.stringify(updelete)
			}) 
			.done(function (data) {
				alert("updelete성공");
			});
		
		
			$(".q_div").each(function (i) {
				let dsv_subject = $(this).find('input[name="q_title"]').val();
				// let q_content = $(this).find('input[name="q_content"]:eq(1)').val();
				let dsv_type = $(this).find('option:selected').val();
				let dsv_order = "od0"+(i+1);
				// alert(dsv_subject);
				// alert(dsv_type);
				// alert(dsv_order);
				// alert(sv_code);
			
				
				let question = {
					dsv_code :sv_code,
					dsv_subject: dsv_subject,
					dsv_type: dsv_type,
					dsv_order: dsv_order
				};
				
 				 $.ajax({
					type: "post",
					url:"/survey/create/dinsert",
					contentType: "application/json",
					data: JSON.stringify(question)
				}) 
				.done(function (data) {
					//alert("dsurvey성공");
				}); 
	
			
				$(this).find("."+dsv_type+"").find('input[name="i_content"]').each(function (i) {
					//console.log($(this));
					let i_content = $(this).val();
					let ch_anscode = dsv_type.substring(0,1)+0+(i+1);
					// alert(ch_anscode);
					
					let item = {
						ch_code : sv_code,
						ch_order : dsv_order,
						ch_type : dsv_type,
						ch_anscode : ch_anscode,
						ch_content: i_content
						};
					
					//	 alert(sv_code);
					//	 alert(dsv_order);
					//	 alert(dsv_type);
					//	 alert(i_content);
						
				  	 $.ajax({
						type: "post",
						url:"/survey/create/cinsert",
						contentType: "application/json",
						data: JSON.stringify(item),
						success:function(data){
							alert(data);
						} 
					})  // q_div.i_div function() end
				
				
				}); // i)div, functoin() end
				
			}); //q_div, function() end	
	//alert("생성 었습니다.");
	window.location.href= "http://localhost:9090/comm/admin/${c_code}";			
	}); // survey end



  /////////////////// AJAX

  </script>

<!-- 본문작성 끝 -->
<%@ include file="../community/admin_footer.jsp"%>