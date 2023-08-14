<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="workIn.dao.WorkInDao" %>
<%@ page import="workIn.entity.WorkIn" %>
<jsp:useBean id="userWork" class="workIn.entity.WorkIn" />
<jsp:setProperty name="userWork" property="workIn" />
<jsp:setProperty name="userWork" property="workOut" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		function buttonClicked(String date){
			document.getElementById("timeIn").value = date;
		}
</script>
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
	<%
		WorkInDao workInDao = new WorkInDao();
		userWork = workInDao.getUserWork(userName);
		String workIn = userWork.getWorkIn();
	%>
	<button class = "btn">In</button>
	<input type="text" id="timeIn" onclick="buttonClicked(work)" >
	
</body>
</html>