<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate();
		if(request.isRequestedSessionIdValid()== true){
			out.println("삭제 후에도 유효한 세션입니다.");
		}
		else{
	%>
	<script>
			alert("로그아웃되었습니다.");
			location.href='first.jsp';
	</script>
	<%
		}
	%>
</body>
</html>