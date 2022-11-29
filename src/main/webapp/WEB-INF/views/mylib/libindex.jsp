<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 본문작성 시작 -->
<!-- 배너와 커뮤니티장 사진이 들어가는 곳 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
	
<!-- 커뮤니티 container -->
	<img class="userphoto rounded-circle" alt="user" src="../images/user.png">
	<div class="container-fluid">
		<div class="row lib-row">
			<!-- 개인정보창 -->
			<div class="lib-info col-12 col-sm-3 col-lg-3">
				<table class="table">
				<tr align="center">
					<td valign="middle" style="line-height: 180%;">
						<span style="font-weight: bold; font-size: 35px;">닉네임</span><br>
						아이디					
					</td>
				</tr>
				<tr>
					<td>heat</td>
				</tr>
				<tr>
					<td>
						서재에 있는 책은 모두 : 142 권<br>
						80% 이상 읽은 책은 : 98 권
					</td>
				</tr>
				<tr>
					<td>
					<button class="btn btn-warning">이번 달 목표 설정하기</button>
					</td>
				</tr>
				<tr>
					<td>
						이번 달은<br>
						<span style="font-weight: bold; font-size: 35px;">4</span> 권 읽기
					</td>
				</tr>
				<tr>
					<td>
						이번 해는<br>
						<span style="font-weight: bold; font-size: 35px;">12</span> 권 읽기
					</td>
				</tr>
				</table>
			</div>
			<!-- 상세페이지 -->
			<div class="lib-cont col-12 col-sm-9 col-lg-9">
				<table class="table">
				<tr>
					<td colspan="3">
						<span style="font-weight: bold; font-size: 35px;">나의 서재 > </span>요즘 읽고 있는 책들이에요
					</td>
				</tr>
				<tr>
					<td>책 그림</td>
					<td>책 그림</td>
					<td>책 그림</td>
				</tr>
				<tr>
					<td>책 제목</td>
					<td>책 제목</td>
					<td>책 제목</td>
				</tr>
				<tr>
					<td>진행률 - 10%</td>
					<td>진행률 - 10%</td>
					<td>진행률 - 10%</td>
				</tr>
				<tr>
					<td colspan="3">
						<span style="font-weight: bold; font-size: 35px;">나의 커뮤니티 활동 > </span>최근에 활동한 커뮤니티들이에요
					</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>커뮤니티 이름</td>
					<td>후기와 별점</td>
				</tr>
				<tr>
					<td>책 제목</td>
					<td>책 제목</td>
					<td>책 제목</td>
				</tr>
				<tr>
					<td colspan="3">
						<span style="font-weight: bold; font-size: 35px;">나의 서평 > </span>읽기만 하지 않고 쓰기도 하는 당신
					</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>서평 제목</td>
					<td>책 이름</td>
				</tr>
				<tr>
					<td>책 제목</td>
					<td>책 제목</td>
					<td>책 제목</td>
				</tr>
				</table>
			</div>
		</div>
	</div>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>