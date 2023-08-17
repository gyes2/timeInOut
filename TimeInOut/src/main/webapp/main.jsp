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
<title>Insert title here</title>
<!-- jQuery 라이브러리 선언 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<form name = "time" action="logoutAction.jsp" method="post">
		로그인후 id 넘겨받기
	<%
		String userId = (String)session.getAttribute("userId");
	%>
	<p> ID: <%= userId %>
	<input type="submit" value="Logout" >
	</form>
	<button id="btnIn">  In  </button>
	<input type="text" id="timeIn" size="100">
	<br>
	<button id="btnOut"> Out </button>
	<input type="text" id="timeOut" size="100">

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
</body>
</html>