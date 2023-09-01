<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="workIn.dao.WorkInDao" %>
<%@ page import="workIn.entity.WorkIn" %>
<jsp:useBean id="userWork" class="workIn.entity.WorkIn" />
<jsp:setProperty name="userWork" property="workIn" />
<jsp:setProperty name="userWork" property="workOut" />
<jsp:useBean id="loginUser" class="user.entity.User" />
<jsp:getProperty name="loginUser" property="userId" />
<jsp:useBean id="work" class="workIn.dao.WorkInDao" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
	<link rel="stylesheet" href="style/shared.css">
<!-- jQuery 라이브러리 선언 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		text-decoration: none;
	}

	*:after {
		color: black;
	}

	body {
 	background-image: url("image/white clock.png");
	}


	/*메인*/
	#main {
		height: 80%;
		display: flex;
		justify-content: center;
		align-items: center;

	}

	.input-group {
		display: flex;
		flex-direction: column;
		align-items: flex-start; /* 필요하면 버튼과 입력 필드를 왼쪽으로 정렬 */
		margin-bottom: 10px; /* 그룹 간의 간격 조정 */
	}

	#btnIn,#btnOut{
		height: 300px;
		aspect-ratio: 1 / 1;
		border-radius: 50%;
		background-color: transparent;
	}

	#timeIn,#timeOut{

	}

	/* 푸터 */
	#footer {
		width: 100%;
		height: 10%;
		display: flex;
		justify-content: center;
	}

	#footernav,
	#footerp {
		display: flex;
		margin-left: 100px;

	}

	/* 기존 스타일에 이 내용을 추가하세요 */

	/* 버튼 스타일 */
	#btnIn, #btnOut {
		transition: 0.3s; /* 부드러운 전환 */
		cursor: pointer; /* 호버시 손 모양 커서로 변경하여 UX 향상 */
		border: 2px solid black;
	}

	#btnIn:hover, #btnOut:hover {
		background-color: #e1e1e1; /* 호버시 연한 회색 배경 */
	}

	.input-group {
		display: flex;
		justify-content: center; /* 버튼과 입력 필드를 가로로 가운데 정렬 */
		align-items: center;
		gap: 20px; /* 버튼과 입력 필드 사이의 간격 */
		margin-top: 30px; /* 각 .input-group 사이의 간격 */
	}

	#timeIn, #timeOut {
		padding: 10px; /* 입력 내부의 패딩 */
		border-radius: 4px; /* 둥근 모서리 */
		border: 1px solid #aaa; /* 회색 테두리 */
	}

	/* 기존 스타일에 추가하세요 */

	#btnIn:active, #btnOut:active {
		transform: scale(0.95); /* 버튼이 눌렸을 때 약간 축소 */
	}


</style>
</head>
<body>
 <div id="wrap">
	 <!-- 해더 -->
	 <header id="header">
		 <h1 class="logo">
			 <a href="/index.jsp">TIME IN OUT.</a>
		 </h1>
		 <nav>
			 <ul>
				 <a href="main.jsp">출퇴근 입력</a>
				 <a href="userCalendar.jsp">출퇴근 조회</a>
				 <a href="mypage.jsp">Mypage</a>
				 <a href="index.jsp">Logout</a>
			 </ul>
		 </nav>
	 </header>
	<main id="main">
		<form name = "time" action="logoutAction.jsp" method="post">
			로그인후 id 넘겨받기
			<%
				String userId = (String)session.getAttribute("userId");
			%>
			<p> ID: <%= userId %>
				<input type="submit" value="Logout" >
		</form>
		<div class="input-group">
			<button id="btnIn">In</button>
			<input type="text" id="timeIn" size="100">
		</div>
		<div class="input-group">
			<button id="btnOut">Out</button>
			<input type="text" id="timeOut" size="100">
		</div>

		<script type="text/javascript">
			$(document).ready(function(){
				$("#btnIn").click(function(){

					var userId = "<%=userId%>";

					$.ajax({
						type : "POST",           // 타입 (get, post, put 등등)
						url : "/work/in",           // 요청할 서버url
						data : { 'userId': userId
						},     // 데이터 타입 (html, xml, json, text 등등)
						success : function(result) { // 결과 성공 콜백함수
							console.log(result);
							$("#timeIn").val(result);

						},
						error : function(request, status, error) { // 결과 에러 콜백함수
							console.log(error)
						}
					});
				});
				$("#btnOut").click(function(){
					var out = new Date();
					var year = out.getFullYear();
					var month = out.getMonth()+1;
					var day = out.getDate();
					let today = year+"-"+month+"-"+day;
					alert(today);

					var userId = "<%=userId%>";

					$.ajax({
						type : "POST",           // 타입 (get, post, put 등등)
						url : "/work/out",           // 요청할 서버url
						data : { 'userId': userId
						},     // 데이터 타입 (html, xml, json, text 등등)
						success : function(result) { // 결과 성공 콜백함수
							console.log(result);
							alert(result);

							$("#timeOut").val(result);

						},
						error : function(request, status, error) { // 결과 에러 콜백함수
							console.log(error)
						}
					});
				});
			});
		</script>
	</main>
	<footer id="footer">
		<div id="footerp">
			<p>&copy; 2023 My Website. All rights reserved.</p>
			<p>Contact us: contact@example.com</p>
			<p>Follow us on social media:</p>
		</div>
		<nav id="footernav">
			<ul>
				<li>Facebook</li>
				<li>Twitter</li>
				<li>Instagram</li>
			</ul>
		</nav>
	</footer>
 </div>
</body>
</html>