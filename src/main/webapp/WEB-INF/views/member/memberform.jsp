<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->

<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<br>
<form name="memfrm" method="post" action="insert.do" onsubmit="return send()">
<span style="color:red; font-weight: bold">필수입력</span>
<br>
<div class= container">
<table border="1" class="table table-hover">
<tr>
    <th>*아이디</th>
    <td style="text-align: left">
      <input type="text" name="id" id="id" size="15">
      <input type="button" value="ID중복확인" id="btn_userid"> 
      <span id="panel"></span>
    </td>
</tr>
<tr>
    <th>*비밀번호</th>
    <td style="text-align: left"><input type="password" name="passwd" id="passwd" size="15" required></td>
</tr>
<tr>
    <th>*비밀번호 확인</th>
    <td style="text-align: left"><input type="password" name="repasswd" id="repasswd" size="15" required></td>
</tr>
<tr>
    <th>*이름</th>
    <td style="text-align: left"><input type="text" name="mname" id="mname" size="15" maxlength="20" required></td>
</tr>
<tr>
    <th>*이메일</th>
    <td style="text-align: left">
      <input type="email" name="email" id="email" size="30" readonly>
      <input type="button" value="Email 중복확인" onclick="emailCheck()">
    </td>
</tr>
<tr>
    <th>전화번호</th>
    <td style="text-align: left"><input type="text" name="tel" id="tel" size="15"></td>
</tr>
<tr>
    <th>우편번호</th>
    <td style="text-align: left">
      <input type="text" name="zipcode" id="zipcode" size="7"  readonly>
      <input type="button" value="주소찾기" onclick="DaumPostcode()">
      <span></span>    
    </td>
</tr>
<tr>  
  <th>주소</th>
  <td style="text-align: left"><input type="text" name="address1" id="address1" size="45" readonly></td>
</tr>
<tr>  
  <th>나머지주소</th>
  <td style="text-align: left"><input type="text" name="address2" id="address2" size="45"></td>
</tr>
<tr>  
  <th>직업</th>
  <td style="text-align: left">
        <select name="job"  id="job">
          <option value="0">선택하세요.</option>
          <option value="A01">회사원</option>
          <option value="A02" selected>IT관련직</option>
          <option value="A03">학생</option>
          <option value="A04">주부</option>
          <option value="A05">기타</option>
        </select>
  </td>
</tr>
<tr>
    <td colspan="2">
        <input type="submit" value="회원가입"  class="btn btn-primary"/>
        <input type="reset"  value="취소"      class="btn btn-primary"/>
    </td>
</tr>
</table>
</div>

<!-- ----- DAUM 우편번호 API 시작 ----- -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>
   
      //6)해당 페이지가 로딩되었을 아이디 중복확인과 관련된 쿠키변수 삭제
      $(function(){
         $.removeCookie("checkID");
      });//end
       $("#btn_userid").click(function(){
       
       let params="userid=" + $("#userid").val();
   
   
      
       
       //JSON응답
       $.post("idcheckcookieproc.do", params, checkID, "json")
       
      });//click end
   
   //4) 콜백함수 
   function checkID(result) {
      
      //(1) text응답
      //alert(result); //0 또는 1
      
      
      //(2) JSON응답
      //alert(result); //[object Object] 또는
      //alert(result.count);
      
      
      //5)서버에서 응답받는 메세지(result)를 본문의 id=panel에 출력하고, 쿠키변수에 저장
      // 형식) $.cookie("쿠키변수명", 값)
      let count=eval(result.count); //형변환
      
      if(count==0){
         $("#panel").css("color", "blue");
         $("#panel").text("사용 가능한 아이디 입니다");
         //$.cookie("checkID", "PASS"); //아이디중복확인을 했다는 증거
      }else{
         $("#panel").css("color", "red");
         $("#panel").text("중복된 아이디 입니다");
         $("#userid").focus(); //커서생성 잘됨 ㅋ
      }//if end
         
   }//checkID()

   
   //7)아이디중복확인을 해야만 회원가입폼이 서버로 전송
   function send() {
      //아이디 입력했는지?
	  let wid=$.cookie("wid");
       
      //비밀번호 입력했는지?
    		  
      //이름 입력헀는지?
    		  
      //이메일 입력했는지?
            
      //아이디중복확인을 했는지?
      let checkID=$.cookie("checkID"); //쿠키변수값 가져오기
      if(checkID=="PASS"){
         return true; //서버로 전송
      }else{
         $("#panel").css("color", "green");
         $("#panel").text("아이디 중복 확인 해주세요");
         $("#userid").focus();
         return false;
      }//if end
   
            
   }// send() end
   
   </script>

<script>
	$("#btn_userid").click(function() {
		$.post(
				"idcheckproc.do"
				,"userid=" + $("#userid").val()
				,responseProc		
		);
	}); //click() end
	
	
	function responseProc() {
		$("#panel").empty();
		$("#panel").html(result);
		$("#panel").show();
	}//responseProc() end
</script>



<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
    <!-- ----- DAUM 우편번호 API 종료----- -->
</script>


</form>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>