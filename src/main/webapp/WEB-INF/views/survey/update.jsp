<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../community/admin_header.jsp"%>

<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions" %>   

<style>
	input#q_title {
		width :70%;
	}
	select.q_type{
		width : 100px;
	}
	input#i_content {
		width :50%;
	}
	div.gaek.check {
		width : 60%;
	}

</style>
   

    <div class="container-fluid">

        <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">설문지 수정하기</h1>
        <p class="mb-4">설문지를 수정할수 있습니다.</p>

        <div class="card shadow mb-4">
            <div class="card-header py-2">
                <h6 class="m-0 font-weight-bold text-primary">'${read.c_name}' 설문지 정보</h6>
            </div>
            <div class="card-body">   
    <!-- 본문작성 시작 -->	    
<div>
  <div class="container">
	<div style="margin-top :30px; margin-bottom: 60px; ">
	

	<input type="hidden" id="ans_code" name="ans_code" class="ans_code" value="${sv_code}"> <!-- dsv_code -->
	<input type="hidden" id="ans_id" name="ans_id" class="ans_id" value="${s_id}"> <!-- dsv_code --> 

	<c:forEach items="${title}" var="title" varStatus="tvs">
	<div style=" margin-bottom: 40px;  border: solid 1px ; border-color: #2a96a5; border-radius: 12px; padding:20px;">	
	<div class="q_div" style=" margin: 20px 50px 30px 50px;">	
			<input type="text" name="q_title" id="q_title" value="${title.dsv_subject}" placeholder="질문의 제목을 입력하세요."   ></input>
			<c:choose>
	
				<c:when test="${title.dsv_type eq 'ju'}">
					<select name="q_type" class="q_type"  >
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
						<div class="layer1" style="display: none ; padding:5px;"> 
							<div>
								<div class="gaek" style="display:inline;">
									<input type='radio' name='radio' onclick="return(false);">
									<input type='text'  name="i_content" id="i_content" placeholder="객관식 답변을 입력"  ></input>
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								
							</div>
							<button id="btn_answer"style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
							
						</div> <!-- layer1 end -->
						
						<div class="layer2" style=" padding:5px;" >
							<div>
								<div class="ju">
								<input type="text" name="i_content" id="i_content" readonly placeholder="주관식 입니다."></input>
								</div>
							</div>
							
						</div> <!-- layer2 end -->
						
						<div class="layer3" style="display: none ; padding:5px;">
							<div>
								<div class="check" style="display:inline;">
									<input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text'  name="i_content" id="i_content" placeholder="체크박스 답변을 입력"  ></input>
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								
							</div>
							<button id="btn_checkans" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
						</div> <!-- layer3 end -->
						<div class="layer4" style="display: none; padding:5px;">
							<div>
								<div class="time">
								<input type="time"  name="i_content" id="i_content" readonly></input>
								</div>
							</div>
						</div>  <!-- layer4 end -->
						<div class="layer5" style="display: none; padding:5px;">
							<div>
								<div class="schedule">
								<input type="date"  name="i_content" id="i_content" readonly></input>
								</div>	
							</div>
						</div>  <!-- layer5 end -->	
						
						</c:when> 
						</c:choose>
					</c:forEach><!-- ju choice end -->
				</c:when>
	
				<c:when test="${title.dsv_type eq 'gaek' or 'etc'}">
					<select name="q_type" class="q_type"  >
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek" selected>객관식</option>
						<option value="ju">주관식</option>
						<option value="check">체크박스</option>
						<option value="time">시간</option>
						<option value="schedule">날짜</option>
					</select>
						<div class="layer1"style=" padding:5px;" >
							
							<c:forEach items="${choice}" var="choice">
							<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">
							<div>
								<div class="gaek" style="display:inline;">
									<input type='radio' name='radio' onclick="return(false);">
									<input type='text'  name="i_content" id="i_content"  value="${choice.ch_content}" placeholder="객관식 답변을 입력"  ></input>
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
							</div>	
							</c:when>
							</c:choose>
							</c:forEach> <!-- gaek choice end -->
							<button id="btn_answer"style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
							
							
						</div> <!-- layer1 end -->
						<div class="layer2" style="display: none; padding:5px;">
							<div>
								<div class="ju">
								<input type="text"  name="i_content" id="i_content" readonly placeholder="주관식 입니다."></input>
								</div>
							</div>
						</div> <!-- layer2 end -->
						<div class="layer3" style="display: none; padding:5px;">
							<div>
								<div class="check" style="display:inline;">
									<input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text'  name="i_content" id="i_content" placeholder="체크박스 답변을 입력"  ></input>
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								
							</div>
							<button id="btn_checkans" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
						</div> <!-- layer3 end -->
						<div class="layer4" style="display: none; padding:5px;">
							<div>
								<div class="time">
								<input type="time"  name="i_content" id="i_content" readonly></input>
								</div>
							</div>
						</div> <!-- layer4 end -->
						<div class="layer5" style="display: none; padding:5px;">
							<div>
								<div class="schedule">
								<input type="date"  name="i_content" id="i_content" readonly></input>
								</div>	
							</div>
						</div> <!-- layer5 end -->	
						
				</c:when>
				
					
				<c:when test="${title.dsv_type eq 'check' or 'etc' }">
					
					<select name="q_type" class="q_type"  >
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek" >객관식</option>
						<option value="ju">주관식</option>
						<option value="check" selected>체크박스</option>
						<option value="time">시간</option>
						<option value="schedule">날짜</option>
					</select>
					
						<div class="layer1" style="display: none; padding:5px;">
							<div>
								<div class="gaek" style="display:inline; ; padding:5px;">
									  <input type='radio' name='radio' onclick="return(false);">
									<input type='text'  name="i_content" id="i_content"  placeholder="객관식 답변을 입력"  ></input>  
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								
							</div>
							<button id="btn_answer"style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>	
						</div> <!-- layer1 end -->
						<div class="layer2" style="display: none; padding:5px;">
							<div>
								<div class="ju">
								<input type="text"  name="i_content" id="i_content" readonly placeholder="주관식 입니다."></input>
								</div>
							</div>
						</div> <!-- layer2 end -->
						<div class="layer3" style=" padding:5px;">
							<div>
							<c:forEach items="${choice}" var="choice">
							<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">
								<div>					
								<div class="check"  style="display:inline;">
									  <input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text'  name="i_content" id="i_content" value="${choice.ch_content}" placeholder="체크박스 답변을 입력"  ></input>
									  
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								
								</div>
							</c:when>
							</c:choose>
							</c:forEach> <!-- gaek choice end -->
							</div>
								<button id="btn_checkans" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>								
							
						
						</div> <!-- layer3 end -->
						<div class="layer4" style="display: none; padding:5px;">
							<div>
								<div class="time">
								<input type="time"  name="i_content" id="i_content" readonly></input>
								</div>
							</div>
						</div> <!-- layer4 end -->
						<div class="layer5" style="display: none; padding:5px;">
							<div>
								<div class="schedule">
								<input type="date"  name="i_content" id="i_content" readonly></input>
								</div>	
							</div>
						</div> <!-- layer5 end -->	
						
				</c:when>
				
				<c:when test="${title.dsv_type eq 'schedule' }">	
					<select name="q_type" class="q_type"  >
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
						<div class="layer1" style="display: none; padding:5px;">
							<div>
								<div class="gaek" style="display:inline">
									  <input type='radio' name='radio' onclick="return(false);">
									<input type='text'  name="i_content" id="i_content" placeholder="객관식 답변을 입력"  ></input>
									  
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								
							</div>
							<button id="btn_answer"style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
						</div> <!-- layer1 end -->
						<div class="layer2" style="display: none; padding:5px;">
							<div>
								<div class="ju">
								<input type="text"  name="i_content" id="i_content" readonly placeholder="주관식 입니다."></input>
								</div>
							</div>
						</div> <!-- layer2 end -->
						<div class="layer3" style="display: none; padding:5px;">
							<div>
								<div class="check" style="display:inline">
									  <input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text'  name="i_content" id="i_content" placeholder="체크박스 답변을 입력"  ></input>
									  
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								
							</div>
							<button id="btn_checkans" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
						</div> <!-- layer3 end -->
						<div class="layer4" style="padding:5px;">
							<div>
								<div class="time">
								<input type="time"  name="i_content" id="i_content" readonly></input>
								</div>
							</div>
						</div>  <!-- layer4 end -->
						<div class="layer5" style="display: none; padding:5px;">
							<div>
								<div class="schedule">
								<input type="date"  name="i_content" id="i_content" readonly></input>
								</div>	
							</div>
						</div>  <!-- layer5 end -->	
						
						</c:when> 
						</c:choose>
					</c:forEach><!-- schedule choice end -->

				</c:when>
						
				<c:when test="${title.dsv_type eq 'time' }">
					
	
						<select name="q_type" class="q_type"  >
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
						<div class="layer1" style="display: none; padding:5px;">
							<div>
								<div class="gaek" style="display:inline">
									  <input type='radio' name='radio' onclick="return(false);">
									<input type='text'  name="i_content" id="i_content" placeholder="객관식 답변을 입력해주세요."  ></input>
									  
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
									
							</div>
							<button id="btn_answer"style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
						</div> <!-- layer1 end -->
						<div class="layer2" style="display: none; padding:5px;">
							<div>
								<div class="ju">
								<input type="text"  name="i_content" id="i_content" readonly placeholder="주관식 입니다."></input>
								</div>
							</div>
						</div> <!-- layer2 end -->
						<div class="layer3" style="display: none; padding:5px;">
							<div>
								<div class="check" style="display:inline">
									  <input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text'  name="i_content" id="i_content" placeholder="체크박스 답변을 입력"  ></input>
									  
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								
							</div>
							<button id="btn_checkans" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
						</div> <!-- layer3 end -->
						<div class="layer4" style="display: none; padding:5px;">
							<div>
								<div class="time">
								<input type="time"  name="i_content" id="i_content" readonly></input>
								</div>
							</div>
						</div>  <!-- layer4 end -->
						<div class="layer5" style=" padding:5px;">
							<div>
								<div class="schedule">
								<input type="date"  name="i_content" id="i_content" readonly></input>
								</div>	
							</div>
						</div>  <!-- layer5 end -->		
						
						</c:when> 
						</c:choose>
					</c:forEach><!-- schedule choice end -->
					
				</c:when>
			</c:choose>					
		</div> <!-- .q_div end -->
		
		<button id="btn_Del" class="btn btn-outline-light btn-block text-dark" style="font-weight: bold; color: #3b5998; border-color: #2a96a5; width: 200px;    margin:auto;">질문삭제</button>
	</div>	
		</c:forEach> 
		  	<div>
				<button id="btn_add" class="btn btn-outline-light btn-block text-dark" style="font-weight: bold; color: #3b5998; border-color: #2a96a5; width: 200px;    margin:auto;">질문추가</button>
			</div>
		
			<br><hr><br>
			<div>
				<button type="button" id="btn_survey" onclick="deleteupdate()" class="btn btn-outline-light btn-block text-dark" style="font-weight: bold; color: #3b5998; border-color: #2a96a5; width: 300px;    margin:auto;" >작성완료</button>
			</div>
				
			
		  </div> <!-- contaioner end -->
		
		</div> <!-- site-section end -->
        </div>
    </div>
    </div>
    </div>>



	<script>
    let q_tag = `
    	<div style=" margin-bottom: 40px;  border: solid 1px ; border-color: #2a96a5; border-radius: 12px; padding:20px;">	
    	<div class="q_div" style=" margin: 20px 50px 30px 50px;">	
		<input type="text" name="q_title" id="q_title" placeholder="질문의 제목을 입력하세요."></input>
		<select name="q_type" class="q_type"  >
			<option value="0" selected>유형을 선택하여주세요</option>
			<option value="gaek">객관식</option>
			<option value="ju">주관식</option>x 
			<option value="check">체크박스</option>
			<option value="time">시간</option>
			<option value="schedule">날짜</option>
		</select>
		<div class="layer1" style="display: none; padding:5px;">
			<div>
				<div class="gaek" style="display:inline">
					  <input type='radio' name='radio' onclick="return(false);">
					<input type='text'  name="i_content" id="i_content"placeholder="객관식 답변을 입력"  ></input>
					  
				</div>
				<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
			</div>
			<button id="btn_answer"style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
		</div>
		<div class="layer2" style="display: none; padding:5px;">
				<div class="ju">
				<input type="text"  name="i_content" id="i_content" readonly placeholder="주관식 입니다."></input>
				</div>
		</div>
		<div class="layer3" style="display: none; padding:5px;">
			<div>
				<div class="check" style="display:inline">
					  <input type="checkbox" name='checkbox' onclick="return(false);">
					<input type='text'  name="i_content" id="i_content" placeholder="체크박스 답변을 입력"  ></input>
					  
				</div>
				<button id="cRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
			</div>
			<button id="btn_checkans" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
		</div>
		<div class="layer4" style="display: none; padding:5px;">
				<div class="time">
				<input type="time"  name="i_content" id="i_content" readonly></input>
				</div>
		</div>
		<div class="layer5" style="display: none; padding:5px;">
				<div class="schedule">
				<input type="date"  name="i_content" id="i_content" readonly></input>	
				</div>	
		</div>
		</div>
		<button id="btn_Del" class="btn btn-outline-light btn-block text-dark" style="font-weight: bold; color: #3b5998; border-color: #2a96a5; width: 200px;    margin:auto;">질문삭제</button>
		</div>
	`; // add end
    
	//btn_add 클릭 질문 생성
    $(document).on('click', '#btn_add', function () {
    	$(this).before(q_tag);
    }); // #btn_add end
	
	//btn-Del 클릭 질문 삭제
	$(document).on('click', '#btn_Del', function (){
        $(this).prev().remove (); // remove the input date
        $(this).unwrap();		// 부모요소 삭제하기.
        $(this).remove();		  // remove the button
	}); // #btn_Del end
    
 
	let a_tag =`
	<div style="margin-top :3px; margin-bottom: 10px;">
	<div class = "gaek"  style="display:inline; margin-top :3px; margin-bottom: 3px;">
		<input type='radio' name='radio' readonly>
		<input type='text'  name="i_content" id="i_content" placeholder="객관식 답변을 입력"  ></input>
	</div>
	<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
	</div>
	`; // radio end
	
	let c_tag =`
	<div style="margin-top :3px; margin-bottom: 10px;">
	<div class = "check"  style="display:inline;">
		<input type='checkbox' name='checkbox' readonly>
		<input type='text'  name="i_content" id="i_content" placeholder="체크박스 답변을 입력"  ></input>
	</div>
	<button id="cRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
	</div>
	`; // checkbox end
			
	$(document).on('click', '#btn_answer', function(){
		$(this).before(a_tag);
		//alert(rcount);
	}); // btn_answer.click end
	
	$(document).on('click', '#btn_checkans', function(){
		$(this).before(c_tag);
		//alert(ccount);
	}); // btb_checkans.click end
	
	$(document).on('click', '#rRemove', function(){
        $(this).prev().remove (); // remove the textbox
        $(this).remove (); // remove the button
       // alert(rcount);
	}); // radioRemove.click end
	
	$(document).on('click', '#cRemove', function(){
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
	
	
	/* $(document).on('click','#btn_survey',function(){
		
		var q_title = $('[name="q_title"]');
		var dsv_type = $('[name="dsv_type"]');
		var i_content = $('[name="i_content"]');
		
		if(!q_title.value){
			alert("질문을 입력해주세요.");
			q_title.focus;
			return;
		}
		
		if(!dsv_type.value){
			alert("유형을 선택해주세요.");
			dsv_type.focus;
			return;
		}
		
		if(dsv_type.value=='gaek' || dsv_type.avlue=='check'){
			if(!i_content){
				alert("질문내용을 입력해주세요.");
				i_content.focus;
				return;
			}
		}
		
		deleteupdate;
			

		}); // survey end */
		
	function deleteupdate() {
			let sv_code = '${sv_code}';
			// alert(sv_code);
			let updelete = { sv_code : sv_code };
				$.ajax({
					type: "post",
					url:"/survey/update/updelete",
					contentType: "application/json",
					async: false,
					data: JSON.stringify(updelete)
				});
			
			getupdate();
		}// getupdate() end
		
	function getupdate() {
			$(".q_div").each(function (i) {
				let sv_code = '${sv_code}';
				let dsv_subject = $(this).find('input[name="q_title"]').val();
				// let q_content = $(this).find('input[name="q_content"]:eq(1)').val();
				let dsv_type = $(this).find('option:selected').val();
				let dsv_order = "od0"+(i+1);
				// alert(dsv_subject);
				// alert(dsv_type);
				// alert(dsv_order);
				// alert(sv_code);

				if(!dsv_subject) {
					alert('문제를 입력해주세요.');
					return ;
				}
				if(dsv_type==0) {
					alert('문제유형를 입력해주세요.');
					return ;
				}
			
				
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
					async: false,
					data: JSON.stringify(question)
				}) 
	
			
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
					
						 // alert(sv_code);
						 // alert(dsv_order);
						 // alert(dsv_type);
						 // alert(i_content);
						 if( dsv_type == 'check' ||
							 dsv_type == 'gaek' ){
							 if(!i_content) {
							 alert("질문을 입력해주세요")
							 return ;
							 }
						 }
						
				  	 $.ajax({
						type: "post",
						url:"/survey/create/cinsert",
						contentType: "application/json",
						data: JSON.stringify(item),
						async: false
					})  // q_div.i_div function() end
				
				
				}); // i)div, functoin() end
				
			}); //q_div, function() end	
	alert("수정 되었습니다.");
	window.location.href= "http://localhost:9090/comm/admin/${c_code}";			

	}// get update()


  /////////////////// AJAX

  </script>

<!-- 본문작성 끝 -->
<%@ include file="../community/admin_footer.jsp"%>