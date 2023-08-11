<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script type="text/javascript">
		function logincheck(){
			if(document.login.userName.value==""){
				alert("ID를 입력하여 주세요");
				document.login.userName.focus();
				return false;
			}
			else if(document.login.pw.value==""){
				alert("패스워드를 입력하여 주세요");
				document.login.password.focus();
				return false;
			}
			else{
				return true;
			}
		}
</script>
</head>
<body>
    <form name="login" action="loginAction.jsp" 
    method="post" onsubmit="logincheck()" >
        <table>
            <tr>
                <td>ID : </td>
                <td><input type="text" name="userName"></td>
            </tr>
            <tr>
                <td>Password : </td>
                <td><input type="password" name="password"></td>
            </tr>
        </table>
        <input type="submit" value="Login"  >
    </form>
</body>
</html>