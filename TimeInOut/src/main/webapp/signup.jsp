<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false"
%>

<html>
<head>
    <title>SIGN UP</title>

    <style>
        .available {
            border: 2px solid green;
        }

        .unavailable {
            border: 2px solid red;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <form id="signupForm">
		
		User ID : 
        <input type="text" id="userId" name="userId" placeholder="userId" onkeydown="inputIdChk()">
        <button type="button" id="checkuserId">Check userId</button>
        <input type="hidden" id="result" value="N">
        <br>

        PW :
        <input type="password" id="password" name="password" placeholder="Password">
        <br>

        Repeat :
        <input type="password" id="repeat" name="repeat" placeholder="Password">
        <br>

		UserName :
        <input type="text" id="userName" name="userName" placeholder="userName">
        <br>

        Email :
        <input type="text" id="email" name="email" placeholder="Email">
        <br>

        <button type="submit">SIGN UP</button>

    </form>

    <script>
        $(document).ready(function() {
            // ID 중복검사
            $("#checkuserId").click(function() {
                var userId = $("#userId").val();
                $.ajax({
                    type: "POST",
                    url: "/checked",
                    data: { userId: userId },
                    success: function(response) {

                        if(response === "unavailable") {
                            $("#userId").removeClass("available").addClass("unavailable");
                            document.getElementById("result").value = "N";
                            alert("userId is not available")
                        }
                        else {
                            $("#userId").removeClass("unavailable").addClass("available");
                            document.getElementById("result").value = "Y";
                        }
                    }
                });
            });

            // 회원가입
            $("#signupForm").submit(function(e) {
                e.preventDefault();

                var userId = $("#userId").val();
                var checkId = $("#result").val();
                var password = $("#password").val();
                var repeat = $("#repeat").val();
                var userName = $("#userName").val();
                var email = $("#email").val();

                // 핸들러 함수
                if (userId === "") {
                    alert("아이디를 입력해주세요.");
                    return false;
                }
                else if(checkId === "N") {
                    alert("중복검사를 해주세요.");
                    return false;
                }
                else if (password === "") {
                    alert("비밀번호를 입력해주세요.");
                    return false;
                }
                else if (repeat !== password) {
                    alert("비밀번호가 다릅니다.");
                    return false;
                }
                else if (userName === "") {
                    alert("이름을 입력해주세요.");
                    return false;
                }
                else if (email === "") {
                    alert("이메일을 입력해주세요.");
                    return false;
                }

                // 회원가입
                $.ajax({
                    type: "POST",
                    url: "/signup",
                    data: { userId: userId,
                        password: password, 
                        userName: userName,
                        email: email
                    },
                    success: function(response) {
                        if (response === "success") {
                            // 페이지 이동
                            alert("Sign up successful!");
                        } else {
                            alert("Sign up failed.");
                        }
                    }
                });
            });
        });

        function inputIdChk() {
            var checkId = $("#result").val();

            if(checkId === "Y") {
                $("#userId").removeClass("available").addClass("unavailable");
                document.getElementById("result").value = "N";
            }
        }
    </script>


</body>
</html>
