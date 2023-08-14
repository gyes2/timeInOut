<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false"
%>

<!DOCTYPE html>
<html>
<head>
    <title>MY PAGE</title>
</head>
<body>
    <p>User ID: ${mypage.userId}</p>
    <p>Company Name: ${mypage.companyName}</p>
    <p>Office Start Time: ${mypage.companyIn}</p>
    <p>Office End Time: ${mypage.companyOut}</p>

    <form action="/change-password" method="post">
        <input type="password" id="newPassword" name="newPassword" required>
        <button type="submit">Change Password</button>
    </form>

    <form action="/delete-user" method="post">
        <button type="submit">Delete Account</button>
    </form>
</body>
</html>
