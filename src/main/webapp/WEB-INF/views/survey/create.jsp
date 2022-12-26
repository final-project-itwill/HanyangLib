<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../community/admin_header.jsp"%>

<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions" %>   

<style>
	button {
		box-shadow: 1px 1px 1px gray;
	}
	
</style>

   
<!-- 본문작성 시작 -->	
    <div class="container-fluid">

        <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">설문지 작성하기</h1>
        <p class="mb-4">가입시 참가할수 있는 설문지를 만들수 있습니다.</p>

        <div class="card shadow mb-6">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">'${read.c_name}' 설문지 생성</h6>
            </div>
            <div class="card-body">   
	
	
<!-- 설문 소개. -->
	<!-- ** 경환 : 설문지코드 자동생성 : s + 날짜(yyyymmdd) + 커뮤니티코드 -->
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="date"><fmt:formatDate value="${now}" pattern="yyyyMMdd" /></c:set>
	<c:set var="min"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>  
	<c:set var="sv_code" value="s${date}-${c_code}"></c:set>
	<!-- count 생성 -->
	<c:set var="c" value='${c+1}'></c:set>
	<c:if test="${c<10}">
		<c:set var="anscodeno" value="od0${j}"></c:set>
	</c:if>
	<c:if test="${c>=10}">
		<c:set var="anscodeno" value="od${j}"></c:set>
	</c:if>
	
<div >
  <div class="container">
	<!-- <form name="frm1" method="post" action="/survey/create/insert" enctype="multipart/form-dat"> -->
	<div style="margin-top :30px; margin-bottom: 60px; ">
	<div>
	<c:set var="oderno" value="1"></c:set>
		<p class="survey">
			<input type="hidden" class="sv_id" name="sv_id" value="${s_id}">
			<input type="hidden" class="sv_comcode" name="sv_comcode" value="${c_code}"> <!-- 커뮤니티 코드 받아오기 -->
			<input type="hidden" class="sv_code" name="sv_code" value="${sv_code}">
		&nbsp;&nbsp;제 &nbsp; &nbsp;목 &nbsp;: &nbsp;<input type="text" class="sv_title" name="sv_title" placeholder="해당 설문지의 제목을 입력하세요." style="width: 60%">
		</p>
	</div>
	<div>
		<p class="survey">
		&nbsp;&nbsp;설  &nbsp; &nbsp;명 &nbsp;: &nbsp;<input type="text" class="sv_des" name="s_content" placeholder="해당 설문지의 설명을 입력하세요." style="width: 60%">
		</p>
	</div>
	<div>
		<p class="survey">
		인원제한 : <input type="number" class="sv_max" name="sv_max" min="0" max="30" value="3">
		</p>
	</div>
	<div>
		<p class="survey">
		&nbsp;마 감 일 &nbsp;: <input type="date" class="sv_edate" name="sv_edate" min="${min}">
		</p>
	</div>
	</div>
<!-- 설문 템플릿 -->	

 
	
	
<!-- 설문지 작성  -->	


	<c:forEach items="${tplread}" var="title" varStatus="tvs">	
	<div style=" margin-bottom: 40px;  border: solid 1px ; border-color: #2a96a5; border-radius: 12px; padding:20px;">		
	<div class="q_div" style=" margin: 20px 50px 30px 50px;">	
	
			<input type="text" name="q_title" value="${title.tefo_subject}" placeholder="질문의 제목을 입력하세요."   style="width : 250px;"></input>
			<c:choose>
	
				<c:when test="${title.tefo_type eq 'ju'}">
					<select name="q_type" class="q_type" style=" width : 75px;">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek">객관식</option>
						<option value="ju"selected>주관식</option>
						<option value="check">체크박스</option>
						<option value="time">시간</option>
						<option value="schedule">날짜</option>
					</select>
					
						<div class="layer1" style="display: none; padding:5px;"> 
							<div>
								<div class="gaek" style="display:inline; ; padding:5px;">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content" placeholder="객관식 답변을 입력"  ></input>
									</label>
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								
							</div>
							<button id="btn_answer"style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>

						</div> <!-- layer1 end -->
						
						<div class="layer2" style=" padding:5px;" >
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly placeholder="주관식 입니다."></input>
								</div>
							</div>
							
						</div> <!-- layer2 end -->
						<div class="layer3" style="display: none ; padding:5px;">
							<div>
								<div class="check" style="display:inline;">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" placeholder="체크박스 답변을 입력"  ></input>
									</label>
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								
							</div>
							<button id="btn_checkans" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
						</div> <!-- layer3 end -->
						<div class="layer4" style="display: none; padding:5px;">
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
						</div>  <!-- layer4 end -->
						<div class="layer5" style="display: none; padding:5px;">
							<div>
								<div class="schedule">
								<input type="date" name="i_content" readonly></input>
								</div>	
							</div>
						</div>  <!-- layer5 end -->	
						
				</c:when>
	
				<c:when test="${title.tefo_type eq 'gaek' or 'etc'}">
					<select name="q_type" class="q_type" style=" width : 75px;">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek" selected>객관식</option>
						<option value="ju">주관식</option>
						<option value="check">체크박스</option>
						<option value="time">시간</option>
						<option value="schedule">날짜</option>
					</select>
						<div class="layer1" style="padding:5px;" >
							<div>
							
								<div class="gaek" style="display:inline; ">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content"  value="${choice.ch_content}" placeholder="객관식 답변을 입력"  ></input></label>
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								</div>	
								<button id="btn_answer"style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
							
						</div> <!-- layer1 end -->
						
						<div class="layer2" style="display: none; padding:5px;">
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly placeholder="주관식 입니다."></input>
								</div>
							</div>
						</div> <!-- layer2 end -->
						
						<div class="layer3" style="display: none; padding:5px;">
							<div>
								<div class="check" style="display:inline;">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" placeholder="체크박스 답변을 입력"  ></input>
									</label>
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
							</div>
							<button id="btn_checkans" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
							
						</div> <!-- layer3 end -->
						
						<div class="layer4" style="display: none; padding:5px;">
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
						</div> <!-- layer4 end -->
						
						<div class="layer5" style="display: none; padding:5px;">
							<div>
								<div class="schedule">
								<input type="date" name="i_content" readonly></input>
								</div>	
							</div>
						</div> <!-- layer5 end -->	
						
				</c:when>
				
					
				<c:when test="${title.tefo_type eq 'check' or 'etc' }">
					
					<select name="q_type" class="q_type" style=" width : 75px;">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek" >객관식</option>
						<option value="ju">주관식</option>
						<option value="check" selected>체크박스</option>
						<option value="time">시간</option>
						<option value="schedule">날짜</option>
					</select>
						<div class="layer1" style="display: none; padding:5px;">
							<div>
								<div class="gaek" style="display:inline;">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content"  placeholder="객관식 답변을 입력"  ></input></label>
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								
							</div>
							<button id="btn_answer"style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
						</div> <!-- layer1 end -->
						
						<div class="layer2" style="display: none; padding:5px;">
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly placeholder="주관식 입니다."></input>
								</div>
							</div>
						</div> <!-- layer2 end -->
						
						<div class="layer3" style=" padding:5px;">
							<div>
												
								<div class="check" style="display:inline;">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" value="${choice.ch_content}" placeholder="체크박스 답변을 입력"  ></input></label>
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
							</div>
								<button id="btn_checkans" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
							
						</div> <!-- layer3 end -->
						
						<div class="layer4" style="display: none; padding:5px;">
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
						</div> <!-- layer4 end -->
						
						<div class="layer5" style="display: none; padding:5px;">
							<div>
								<div class="schedule">
								<input type="date" name="i_content" readonly></input>
								</div>	
							</div>
						</div> <!-- layer5 end -->	
						
				</c:when>
				
				<c:when test="${title.tefo_type eq 'schedule' }">	
					<select name="q_type" class="q_type" style=" width : 75px;">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek">객관식</option>
						<option value="ju">주관식</option>
						<option value="check">체크박스</option>
						<option value="time" selected>시간</option>
						<option value="schedule">날짜</option>
					</select>
					<c:forEach items="${choice}" var="choice">
						<c:choose>
						<c:when test="${title.tefo_order eq choice.ch_order}">
						<div class="layer1" style="display: none; padding:5px;">
							<div>
								<div class="gaek" style="display:inline;">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content" placeholder="객관식 답변을 입력"  ></input></label>
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								
							</div>
							<button id="btn_answer"style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
							</div>
						</div> <!-- layer1 end -->
						
						<div class="layer2" style="padding:5px;">
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly placeholder="주관식 입니다."></input>
								</div>
							</div>
						</div> <!-- layer2 end -->
						
						<div class="layer3" style="display: none; padding:5px;">
							<div>
								<div class="check" style="display:inline">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" placeholder="체크박스 답변을 입력"  ></input></label>
								</div>
									<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
								
							</div>
							<button id="btn_checkans" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
						</div> <!-- layer3 end -->
						
						<div class="layer4" style="padding:5px;">
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
						</div>  <!-- layer4 end -->
						
						<div class="layer5" style="display: none; padding:5px;">
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
						
				<c:when test="${title.tefo_type eq 'time' }">
					
	
						<select name="q_type" class="q_type"  style=" width : 75px;">
						<option value="0">유형을 선택하여주세요</option>
						<option value="gaek">객관식</option>
						<option value="ju">주관식</option>
						<option value="check">체크박스</option>
						<option value="time" >시간</option>
						<option value="schedule" selected>날짜</option>
					</select>
					<c:forEach items="${choice}" var="choice">
						<c:choose>
						<c:when test="${title.tefo_order eq choice.ch_order}">
						<div class="layer1" style="display: none; padding:5px;">
							<div>
								<div class="gaek" style="display:inline">
									<label><input type='radio' name='radio' onclick="return(false);">
									<input type='text' name="i_content" placeholder="객관식 답변을 입력"  ></input></label>
								</div>
							<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
									
							</div>
							<button id="btn_answer"style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
						</div> <!-- layer1 end -->
						
						<div class="layer2" style="display: none; padding:5px;">
							<div>
								<div class="ju">
								<input type="text" name="i_content" readonly placeholder="주관식 입니다."></input>
								</div>
							</div>
						</div> <!-- layer2 end -->
						
						<div class="layer3" style="display: none; padding:5px;">
							<div>
								<div class="check" style="display:inline">
									<label><input type="checkbox" name='checkbox' onclick="return(false);">
									<input type='text' name="i_content" placeholder="체크박스 답변을 입력"  ></input></label>
								</div>
								<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
							</div>
							<button id="btn_checkans" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
						</div> <!-- layer3 end -->
						
						<div class="layer4" style="display: none; padding:5px;">
							<div>
								<div class="time">
								<input type="time" name="i_content" readonly></input>
								</div>
							</div>
						</div>  <!-- layer4 end -->
						
						<div class="layer5" style="padding:5px;"> 
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
			
		</div> <!-- q_div end -->
		<button id="btn_Del" class="btn btn-outline-light btn-block text-dark" style="font-weight: bold; color: #3b5998; border-color: #2a96a5; width: 200px;    margin:auto;">질문삭제</button>
		</div>	
		</c:forEach> 
		
		  	<div>
				<button id="btn_add" class="btn btn-outline-light btn-block text-dark" style="font-weight: bold; color: #3b5998; border-color: #2a96a5; width: 200px;    margin:auto;">질문추가</button>
			</div>
			
			<br><hr><br>
			<div>
				<button type="button" id="btn_survey" class="btn btn-outline-light btn-block text-dark" style="font-weight: bold; color: #3b5998; border-color: #2a96a5; width: 300px;    margin:auto;" >작성완료</button>
			</div>
				
			
		  </div> <!-- contaioner end -->
		
		</div> <!-- site-section end -->
        </div>
    </div>
    </div>





	<script>

    let q_tag = `
    
    	<div style=" margin-bottom: 40px;  border: solid 1px ; border-color: #2a96a5; border-radius: 12px; padding:20px;">	
    	<div class="q_div" style=" margin: 20px 50px 30px 50px;">	
		<input type="text" name="q_title" placeholder="질문의 제목을 입력하세요." style=" width : 300px;"></input>
		<select name="q_type" class="q_type" style=" width : 75px;">
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
					<label><input type='radio' name='radio' onclick="return(false);">
					<input type='text' name="i_content"placeholder="객관식 답변을 입력"  ></input>
					</label>
				</div>
				<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
			</div>
			<button id="btn_answer"style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
		</div>
		<div class="layer2" style="display: none; padding:5px;">
				<div class="ju">
				<input type="text" name="i_content" readonly placeholder="주관식 입니다."></input>
				</div>
		</div>
		<div class="layer3" style="display: none; padding:5px;">
			<div>
				<div class="check" style="display:inline">
					<label><input type="checkbox" name='checkbox' onclick="return(false);">
					<input type='text' name="i_content" placeholder="체크박스 답변을 입력"  ></input>
					</label>
				</div>
				<button id="cRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
			</div>
			<button id="btn_checkans" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답안 추가</button>
		</div>
		<div class="layer4" style="display: none; padding:5px;">
				<div class="time">
				<input type="time" name="i_content" readonly></input>
				</div>
		</div>
		<div class="layer5" style="display: none; padding:5px;">
				<div class="schedule">
				<input type="date" name="i_content" readonly></input>	
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
			<input type='text' name="i_content" placeholder="객관식 답변을 입력"  ></input>
		</div>
		<button id="rRemove" style=" font-weight: bold; background-color:rgba(0,0,0,0); text-align: center; border: solid 1px ; border-color: #2a96a5; border-radius: 12px; margin:auto;">답변 삭제</button>
		</div>
	`; // radio end
	
	let c_tag =`
		<div style="margin-top :3px; margin-bottom: 10px;">
		<div class = "check"  style="display:inline;">
			<input type='checkbox' name='checkbox' readonly>
			<input type='text' name="i_content" placeholder="체크박스 답변을 입력"  ></input>
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
	
	
	$(document).on('click','#btn_survey',function(){
		let sv_code = $('p.survey').find('input.sv_code').val();
		let sv_comcode = $('p.survey').find('input.sv_comcode').val();
		let sv_title = $('p.survey').find('input.sv_title').val();
		let sv_des = $('p.survey').find('input.sv_des').val();
		let sv_id = $('p.survey').find('input.sv_id').val();
		let sv_max = $('p.survey').find('input.sv_max').val();
		let sv_edate = $('p.survey').find('input.sv_edate').val();
		
		if(sv_title==''){
			alert("제목을 입력해주세요.");
			sv_title.focus;
			return false;
		}
		if(sv_des==''){
			alert("내용을 입력해주세요.");
			sv_des.focus;
			return false;
		}
		if(sv_edate==''){
			alert("마감일을 입력해주세요.");
			sv_edate.focus;
			return false;
		}
		
		
		
		let survey = {
			sv_code : sv_code,
			sv_comcode : sv_comcode,
			sv_title : sv_title,
			sv_des : sv_des,
			sv_id : sv_id,
			sv_max : sv_max,
			sv_edate : sv_edate
		};
    
		$.ajax({
			type: "post",
			url:"/survey/create/insert",
			contentType: "application/json",
			async: false,
			data: JSON.stringify(survey),
		})

		
			$(".q_div").each(function (i) {
				let dsv_subject = $(this).find('input[name="q_title"]').val();
				// let q_content = $(this).find('input[name="q_content"]:eq(1)').val();
				let dsv_type = $(this).find('option:selected').val();
				let dsv_order = "od0"+(i+1);
				// alert(dsv_subject);
				// alert(dsv_type);
				// alert(dsv_order);
				// alert(sv_code);
				if(dsv_subject==''){
					alert("질문을 입력해주세요.");
					return false;
				}
				
				if(dsv_type==0){
					alert("질문유형을 선택해주세요.");
					return false;
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
				.done(function (data) {
					//alert("dsurvey성공");
				});
	
				$(this).find("."+dsv_type+"").find('input[name="i_content"]').each(function (i) {
					//console.log($(this));
					let i_content = $(this).val();
					let ch_anscode = dsv_type.substring(0,1)+0+(i+1);
					// alert(ch_anscode);
/* 					if(i_content==''){
						alert("질문내용을 입력해주세요.");
						i_content.focus;
						return false;
					} */
					
					let item = {
						ch_code : sv_code,
						ch_order : dsv_order,
						ch_type : dsv_type,
						ch_anscode : ch_anscode,
						ch_content: i_content
						};
					
						// alert(sv_code);
						//alert(dsv_order);
						// alert(dsv_type);
						// alert(i_content);
						
				 	 $.ajax({
						type: "post",
						url:"/survey/create/cinsert",
						contentType: "application/json",
						data: JSON.stringify(item),
						async: false

					}) // q_div.i_div function() end
				
				}); // i)div, functoin() end
				
			}); //q_div, function() end	
	//alert("생성 었습니다.");
	window.location.href= "http://localhost:9090/comm/admin/${c_code}";			
	}); // survey end



  /////////////////// AJAX

  </script>

<!-- 본문작성 끝 -->
<%@ include file="../community/admin_footer.jsp"%>