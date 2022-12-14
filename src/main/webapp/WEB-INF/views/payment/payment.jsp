<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<div class="container">
    <form name="paymentview" method="post">
    <table border="1" class="table table-hover">
        <tr>
            <td>주문서 번호</td>
            <td><input type="text" name=""></td>
        </tr>
         <tr>
            <td>주문자 ID</td>
            <td><input type="number" name=""></td>
        </tr>
        <tr>
            <td>상품 총금액</td>
            <td><input type="text" name="" id=""></td>
        </tr>
        <tr>
            <td>사용 에정 마일리지</td>
            <td><input type="text" name="" id=""></td>
        </tr>
        <tr>
            <td>실제 결제 금액</td>
            <td><input type="text" name="" id=""></td>
        </tr>
        <tr>
            <td>실제 결제 금액</td>
            <td><input type="hidden" name="" id=""></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="hidden" name="">
                <input type="button" class="btn btn-success" value="eBook구경하기">
                <button type="button" class="btn btn-danger" onclick="javascript.history.back()">뒤로가기</button>
            </td>
        </tr>
      </table>
    </form>
   
   </div>


<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>