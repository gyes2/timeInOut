<%@ page
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"
        isELIgnored="false"
%>

<!DOCTYPE html>
<html>
<head>
    <title>MY PAGE</title>
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<p>User ID: ${mypage.userId}</p>
<p>Company Name: ${mypage.companyName}</p>
<p>Office Start Time: ${mypage.companyIn}</p>
<p>Office End Time: ${mypage.companyOut}</p>

<button type="button" onclick="showModal()">Change Password</button>
<div id="changePasswordModal" class="modal">
    <div class="modal-content">
        <h2>Change Password</h2>
        현재 비밀번호 :
        <input type="password" id="password" name="password" required>
        <br>
        새로운 비밀번호 :
        <input type="password" id="newPassword" name="newPassword" required>
        <br>
        한번더 :
        <input type="password" id="repeat" name="repeat" required>
        <br>
        <button type="button" onclick="changePassword()">Change Password</button>
        <button type="button" onclick="closeModal()">Cancel</button>
    </div>
</div>

<form action="/delete-user" method="post">
    <button type="submit">Delete Account</button>
</form>

<script>
    const modal = document.getElementById("changePasswordModal");

    function showModal() {
        modal.style.display = "block";
        console.log("Hello");
    }

    function closeModal() {
        modal.style.display = "none";
    }

    function changePassword() {
        var password = $("#password").val();
        var newPassword = $("#newPassword").val();
        var repeat = $("#repeat").val();

        if(password !== "${mypage.userPassword}") {
            alert("현재 비밀번호가 다릅니다.");
            return false;
        }
        else if (newPassword === "") {
            alert("새로운 비밀번호를 입력해주세요.");
            return false;
        }
        else if (password === newPassword) {
            alert("현재 비밀번호와 같습니다.");
            return false;
        }
        else if (repeat !== newPassword) {
            alert("비밀번호가 다릅니다.");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/change-password",
            data: {
                newPassword: newPassword
            },
            success: function() {
                alert("비밀번호 변경 완료");
            }
        });

        closeModal();
    }

    window.addEventListener("click", function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });
</script>
</body>
</html>
