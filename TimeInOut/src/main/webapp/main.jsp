<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="logoutAction.jsp" method="post">
		로그인후 id 넘겨받기
	<%
		String userName = (String)session.getAttribute("userName");
	%>
	<p> ID: <%= userName %>
	<input type="submit" name="Logout" >
	</form>
</body>
</html>