<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
%>
<%@ page import="company.entity.Company" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./style/shared.css">
    <title>check-in</title>
</head>

<body>
<div id="wrap">
        <!-- 해더 -->
        <header id="header">
            <h1 class="logo">
                <a href="/index.jsp">TIME IN OUT.</a>
              </h1>
            <nav>
            	<p>네비게이션바</p>
            </nav>
        </header>
        <!-- 메인 -->
        <main id="main">
        	근무시간 설정
        	<br>
        	<form name="companyRegister" action="/company/register" method="GET" onsubmit="return registerCheck()" >
	        	<table border=1>
		        	<tr>
		        		<td>
		        		시작 시간
		        		</td>
		        		<td>
		        			<% Company company = request.get;
		        				String[] hours = in.split(":");
		        				String hour = hours[0];
		        				String minute = hours[1];
		        				
		        			%>
		        			<input type="text" id="companyInHour" value=<%=hour%> %>> 시
		        			<br>
		        			<input type="text" id="companyInMin" value=<%=minute%>> 분
		        		</td>
		        		<td>
		        		종료 시간
		        		</td>
		        		<td>
		        			<input type="text" id="companyOutHour"> 시
		        			<br>
		        			<input type="text" id="companyOutMin"> 분
		        		</td>
		        		
		        	</tr>
	        	<tr>
	        		<td>
	        			GPS
	        		</td>
	        		<td>
	        			<input type="text" id="companyAdrress" value="서울특별시 금천구 가산동 371-28">
	        		</td>
	        	</tr>
	        	</table>
        	</form>
		    <input type="submit" class="button" id = "submit" value="Register">

        </main>
        <!-- 푸터 -->
        <footer id="footer"></footer>
    </div>
	<script>
		<%-- Register : 핸들러 함수 --%>
		<%-- 입력값 유효성 검사(숫자만, 2자리까지) 제한 하기 --%>
		function registerCheck() {
			if (document.getElementById('companyInHour').value ==="") {
		    	alert('Enter Start Hour!');
		    	document.getElementById('companyInHour').focus();
		        return false;
		    }
			else if (document.getElementById('companyInMin').value ==="") {
		    	alert('Enter Start Minute!');
		    	document.getElementById('companyInMin').focus();
		        return false;
		    }
			else if (document.getElementById('companyOutHour').value ==="") {
		    	alert('Enter End Hour!');
		    	document.getElementById('companyOutHour').focus();
		        return false;
		    }
			else if (document.getElementById('companyOutMin').value ==="") {
		    	alert('Enter End Minute!');
		    	document.getElementById('companyOutMin').focus();
		        return false;
		    }
			else{
				return true;
			}
		};
		
	</script>
</body>
</html>