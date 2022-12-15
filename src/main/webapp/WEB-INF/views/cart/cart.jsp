<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<div class="container">
   
   <h3>장바구니 목록</h3>
     <div class="container">
      <form method="post" action="search" class="form-group">
          상품명 : <input type="text" name="" value="">
                  <input type="submit" class="" value="검색">
      </form>
   </div>
    <form name="cartview" method="post">
    <table border="1" class="table table-hover">
        <tr>
            <td class="info">구매한 정보</td>
            <td><input type="text" name="" id=""></td>
        </tr>
         <tr>
            <td class="info">상품가격</td>
            <td><input type="number" name="" id=""></td>
        </tr>
        <tr>
            <td class="info">상품설명</td>
            <td><input type="text" name="" id=""></td>
        </tr>
        <tr>
            <td class="info">출판사</td>
            <td><input type="text" name="" id=""></td>
        </tr>
        <tr>
            <td class="info">출판일</td>
            <td><input type="text" name="" id=""></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="hidden" name="">
                <input type="button" class="btn btn-success" value="결제하러가기" onclick="location.href='/payment/paymentview'">
                <input type="button" class="btn btn-danger" value="eBook구경하기">
                <button type="button" class="btn btn-danger" onclick="javascript.history.back()">뒤로가기</button>
            </td>
        </tr>
      </table>
    </form>
   
   </div>






<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>