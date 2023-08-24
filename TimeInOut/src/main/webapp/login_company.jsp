<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false"
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="./style/shared.css">
  
 <title>Login-company</title>
  <style>
  
    #wrap {
      height: 900px;
    }

    #header {
      height: 10%;
    }

    #main {
      height: 80%;
    }

     *,
    :after,
    :before {
      box-sizing: border-box
    }


    .login-wrap {
      width: 100%;
      margin: auto;
      max-width: 525px;
      min-height: 670px;
      position: relative;
      top: 25px;
      box-shadow: 0 12px 15px 0 rgba(0, 0, 0, .24), 0 17px 50px 0 rgba(0, 0, 0, .19);
    }

    .login-html {
      width: 100%;
      height: 100%;
      position: absolute;
      padding: 50px 70px 50px 70px;
      background-color: #545457;
      border: 1px solid black;
    }

    .login-html .sign-in-htm,
    .login-html .sign-up-htm {
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      position: absolute;
      transform: rotateY(180deg);
      backface-visibility: hidden;
      transition: all .4s linear;
    }

    .login-html .sign-in,
    .login-html .sign-up,
    .login-form .group .check {
      display: none;
    }

    .login-html .tab {
      font-size: 22px;
      margin-right: 15px;
      padding-bottom: 5px;
      margin: 0 15px 10px 0;
      display: inline-block;
      border-bottom: 2px solid transparent;
    }

    .login-html .sign-in:checked+.tab,
    .login-html .sign-up:checked+.tab {
      color: #ffffff;
      border-color: #1161ee;
    }

    .login-form {
      min-height: 345px;
      position: relative;
      perspective: 1000px;
      transform-style: preserve-3d;
    }

    .login-form .group {
      margin-bottom: 15px;
    }

    .login-form .group .label,
    .login-form .group .input,
    .login-form .group .button {
      width: 100%;
      color: #000000;
      display: block;
    }

    .login-form .group .input,
    .login-form .group .button {
      border: none;
      padding: 15px 20px;
      border-radius: 25px;
      background: white;
    }


    .login-form .group .label {
      color: #aaa;
      font-size: 12px;
    }

    .login-form .group .button {
      background: #1161ee;
    }

    
    .login-form .group .check:checked+label {
      color: #fff;
    }

    .login-html .sign-in:checked+.tab+.sign-up+.tab+.login-form .sign-in-htm {
      transform: rotate(0);
    }

    .login-html .sign-up:checked+.tab+.login-form .sign-up-htm {
      transform: rotate(0);
    }

    .hr {
      height: 2px;
      margin: 20px 0 20px 0;
      background: rgba(255, 255, 255, .2);
    }
    
    #Duplicate_Check {
      position: absolute;
      left: 19rem;
      top: 1.7rem;
      background-color: transparent;
      border-style: none;
      color: #000;
      cursor: pointer;
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
    
        .available {
            border: 2px solid green;
        }

        .unavailable {
            border: 2px solid red;
        }

        #Duplicate_Check{
            position: absolute;
            left: 19rem;
            top: 1.7rem;
            border-radius: 6px;
        }
  </style>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
  <div id="wrap">
    <!-- 해더 -->
    <header id="header">
      <h1 class="logo">
        <a href="./index.jsp">TIME IN OUT.</a>
      </h1>
      <!-- 삭제할것 -->
      <nav>
        <ul>
          <a href="./login.jsp">개인 로그인</a>
        </ul>
      </nav>
    </header>
    <!-- 메인 -->
    <main id="main">
      <div class="login-wrap">
        <div class="login-html">
          <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign
            In</label>
          <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
          <div class="login-form">
            <!-- 로그인 -->
            <div class="sign-in-htm">
              <br>
              <div class="group">
                <label for="user" class="label">Id</label>
                <input id="user" type="text" class="input">
              </div>
              <br>
              <div class="group">
                <label for="pass" class="label">Password</label>
                <input id="pass" type="password" class="input" data-type="password">
              </div>
              <div class="hr"></div>
              <div class="group">
                <input type="submit" class="button" value="Sign In">
              </div>
            </div>
            <!-- 회원가입 -->
            <div class="sign-up-htm">
              <div class="group">
                <input type="button" value="중복확인" id="Duplicate_Check">
                <label for="user" class="label">Id</label>
                <input id="user" type="text" class="input">
              </div>
              <div class="group">
                <label for="pass" class="label">Password</label>
                <input id="pass" type="password" class="input" data-type="password">
              </div>
              <div class="group">
                <label for="pass" class="label">Repeat Password</label>
                <input id="pass" type="password" class="input" data-type="password">
              </div>
              <div class="group">
                <label for="pass" class="label">Companyname</label>
                <input id="pass" type="text" class="input">
              </div>
              <div class="group">
                <label for="pass" class="label">Email Address</label>
                <input id="pass" type="text" class="input">
              </div>
                <div class="group">
                  <label for="pass" class="label">Worktime</label>
                  <input id="pass" type="text" class="input">
              </div>
              <div class="hr"></div>
              <div class="group">
                <input type="submit" class="button" value="Sign Up">
              </div>
            </div>
          </div>
        </div>
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
</body>

</html>
    <script>
        // <%-- Sign in : 핸들러 함수 --%>
        function logincheck(){

            if(document.signin.userId.value===""){
                alert("ID를 입력하여 주세요");
                document.signin.userId.focus();
                return false;
            }
            else if(document.signin.password.value===""){
                alert("패스워드를 입력하여 주세요");
                document.signin.password.focus();
                return false;
            }
            else{
                return true;
            }
        }

        // <%-- Sign up : 중복검사, 회원가입 --%>
        $(document).ready(function() {
            // 중복검사
            $("#Duplicate_Check").click(function() {
                var userId = $("#signup_user").val();
                $.ajax({
                    type: "POST",
                    url: "/checked",
                    data: { userId: userId },
                    success: function(response) {

                        // 중복 검사 결과 css에 반영
                        if(response === "unavailable") {
                            $("#signup_user").removeClass("available").addClass("unavailable");
                            document.getElementById("signup_result").value = "N";
                            alert("userId is not available")
                        }
                        else {
                            $("#signup_user").removeClass("unavailable").addClass("available");
                            document.getElementById("signup_result").value = "Y";
                        }
                    }
                });
            });

            // 회원가입
            $("#signup_form").submit(function(e) {
                e.preventDefault();

                var signup_user = $("#signup_user").val();
                var signup_result = $("#signup_result").val();
                var signup_pass = $("#signup_pass").val();
                var signup_repeat = $("#signup_repeat").val();
                var signup_name = $("#signup_name").val();
                var signup_email = $("#signup_email").val();

                // 핸들러 함수
                if (signup_user === "") {
                    alert("아이디를 입력해주세요.");
                    return false;
                }
                else if(signup_result === "N") {
                    alert("중복검사를 해주세요.");
                    return false;
                }
                else if (signup_pass === "") {
                    alert("비밀번호를 입력해주세요.");
                    return false;
                }
                else if (signup_repeat !== signup_pass) {
                    alert("비밀번호가 다릅니다.");
                    return false;
                }
                else if (signup_name === "") {
                    alert("이름을 입력해주세요.");
                    return false;
                }
                else if (signup_email === "") {
                    alert("이메일을 입력해주세요.");
                    return false;
                }

                // 회원가입
                $.ajax({
                    type: "POST",
                    url: "/signup",
                    data: { userId: signup_user,
                        password: signup_pass,
                        userName: signup_name,
                        email: signup_email
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
        })

        // 중복 검사 후 입력받는지 확인
        function inputIdChk() {
            var signup_result = $("#signup_result").val();

            console.log("여기");

            if(signup_result === "Y") {
                $("#signup_user").removeClass("available").addClass("unavailable");
                document.getElementById("signup_result").value = "N";
            }
        }
    </script>
</main>
</body>
</html>