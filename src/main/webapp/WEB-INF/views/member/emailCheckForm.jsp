<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emailCheckForm.jsp</title>
</head>
<body>
		
	<div style="text-align: center;"> 
         <h3>이메일 중복획인</h3>
         <form action="emailCheckProc.jsp" onsubmit="return blankCheck()">
         아이디 : <input type="text" name="email" id="email" maxlength="20" autofocus>
         <input type="submit" value="중복혹인">
         </form>
     </div>
	
	<script>
	   function blankCheck() {
           let email=document.getElementById("email").value;
           email=email.trim();
           if(email.length<10){
               alert("이메일은 10~20글자 이내로 입력해주세요!");
               return false;

           }//if end
           return true;
       }//blankCheck() end
	</script>
	
	
</body>
</html>