<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.dao.UserDao" %>
<%@ page import="user.entity.User" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="loginUser" class="user.entity.User"/>
<jsp:setProperty name="loginUser" property="userName"/>
<jsp:setProperty name="loginUser" property="password"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<%
	//세션확인
	if(session.getAttribute("userName") != null){
		if(request.getAttribute("userName") == (String)session.getAttribute("userName")){
	%>
	<script>
		alert("이미 로그인이 완료된 상태입니다.");
	</script>
	<% 		
		}
	}
	else{
		UserDao userDao = new UserDao();
		int result = userDao.login(request.getParameter("userName"),request.getParameter("password"));
		//유저 있는지 확인
		
		//loginUser = userDao.getUser(request.getParameter("userName"));
		if(result == -2){
	%>
			<script>
				alert("회원가입되지 않은 회원입니다.");
				history.back();
			</script>
	<%
		}
		else if(result == 1){
				//세션 설정
			session.setAttribute("userName", loginUser.getUserName());
			session.setAttribute("userPassword",loginUser.getPassword());
			//세션 유효시간-4시간
			session.setMaxInactiveInterval(60*60*4);
				
	%>
			<script>
				alert("Success Login!");
					//location.href = 'main.jsp';
			</script>
	<%
			response.sendRedirect("main.jsp");
		}
		else if(result == 0){
	%>
			<script>
				alert("Wrong Password!");
				history.back();
			</script>
	<% 
		}
		else{
	%>
			<script>
				alert("Wrong ID!");
				history.back();
			</script>
	<%
		}
	}
	%>
</body>
</html>