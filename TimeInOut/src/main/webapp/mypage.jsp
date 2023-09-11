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

        * {
            padding: 0;
            margin: 0;
        }

        #header {
            justify-content: space-between;
            display: flex;
            align-items: center;
            padding: 15px;
            margin: 0 auto;
        }

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

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        #wrap {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        #header {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
        }

        #header .logo a {
            color: #fff;
            text-decoration: none;
            font-size: 24px;
            margin-left: 20px;
        }

        nav ul {
            padding: 0;
            list-style-type: none;
            display: flex;
            justify-content: space-around;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }


        #article {
            height: 40vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #article img {
            height: 35vh;
            aspect-ratio: auto;
        }

        #main {
            padding: 20px;
            display: flex;
            height: 40vh;
            width: 100%;
            justify-content: center;
            align-items: center;
        }


        #contents {
            width: 40vh;
            padding: 10px;
            background-color: #f9f9f9;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border: 1px solid black;
            text-align: left;
        }

        #contents p {
            font-size: 18px;
            margin: 10px 0;
        }

        button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .modal-content {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        /* 푸터 */
        #footer {
            width: 100%;
            height: 10%;
            display: flex;
            justify-content: center;
        }

        #footernav,
        #footerp {
            display: flex;
            margin-left: 100px;

        }


    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div id="wrap">
    <!-- 해더 -->
    <header id="header">
        <h1 class="logo">
            <a href="index.jsp">TIME IN OUT.</a>
        </h1>
        <nav>
            <ul>
                <a href="main.jsp">출퇴근 입력</a>
                <a href="userCalendar.jsp">출퇴근 조회</a>
                <a href="mypage.jsp">Mypage</a>
                <a href="first.jsp">Logout</a>
            </ul>
        </nav>
    </header>
    <article id="article">
            <img src="image/login%20icon.png">
    </article>
    <main id="main">
        <div id="contents">
            <p>User ID: ${mypage.userId}</p>
            <p>Company Name: ${mypage.companyName}</p>
            <p>Office Start Time: ${mypage.companyInHour}:${mypage.companyInMinute}</p>
            <p>Office End Time: ${mypage.companyOutHour}:${mypage.companyOutMinute}</p>

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
        </div>
    </main>
    <!-- 푸터 -->
    <footer id="footer">
        <div id="footerp">
            <p>&copy; 2023 My Website. All rights reserved.</p>
            <p>Contact us: contact@example.com</p>
            <p>Follow us on social media:</p>
        </div>
        <nav id="footernav">
            <ul>
                <li>Facebook</li>
                <li>Twitter</li>
                <li>Instagram</li>
            </ul>
        </nav>
    </footer>
</div>
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

        if (password !== "${mypage.userPassword}") {
            alert("현재 비밀번호가 다릅니다.");
            return false;
        } else if (newPassword === "") {
            alert("새로운 비밀번호를 입력해주세요.");
            return false;
        } else if (password === newPassword) {
            alert("현재 비밀번호와 같습니다.");
            return false;
        } else if (repeat !== newPassword) {
            alert("비밀번호가 다릅니다.");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/change-password",
            data: {
                newPassword: newPassword
            },
            success: function () {
                alert("비밀번호 변경 완료");
            }
        });

        closeModal();
    }

    window.addEventListener("click", function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });
</script>
</body>
</html>
