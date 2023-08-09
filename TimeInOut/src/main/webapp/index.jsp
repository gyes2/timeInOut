<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="./insert_user.jsp" method="post">
        <table>
            <tr>
                <td>ID : </td>
                <td><input type="text" name="userName"></td>
            </tr>
            <tr>
                <td>Password : </td>
                <td><input type="password" name="pw"></td>
            </tr>
        </table>
        <input type="submit" value="Insert">
    </form>
</body>
</html>