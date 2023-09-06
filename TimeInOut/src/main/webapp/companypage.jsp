<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>User List</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        #wrap {
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin: 30px auto;
        }

        #header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            color: #ffffff;
            padding: 10px 20px;
        }

        #header h1.logo a {
            color: #ffffff;
            text-decoration: none;
        }

        #header nav ul a {
            color: #ffffff;
            margin-left: 10px;
        }

        #article {
            height: 20%;
        }

        #article nav {
            height: 50px;
            margin: 0 auto;
            text-align: center;
            position: relative;
            top: 50%;
        }

        #article nav a {
            font-size: 15px;
        }

        #article nav ul a {
            color: #333;
            margin-right: 10px;
        }

        #main {
            padding: 20px;
        }

        #footer {
            display: flex;
            justify-content: space-around;
            background-color: #333;
            color: #ffffff;
            padding: 10px 0;
        }

        #footerp p, #footernav ul li {
            margin-left: 10px;
        }

        button {
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            color: #ffffff;
            cursor: pointer;
            padding: 10px 20px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        #contents {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        #contents h2 {
            margin-bottom: 5px;
        }

        select, input[type="text"] {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="text"] {
            width: 80%;
        }

        button {
            margin-top: 20px;
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
<div id="wrap">
    <header id="header">
        <h1 class="logo">
            <a href="index.jsp">TIME IN OUT.</a>
        </h1>
        <nav>
            <ul>
                <a href="userlist.jsp">회원목록</a>
                <a href="first.jsp">logout</a>
            </ul>
        </nav>
    </header>
    <article id="article">
        <nav>
            <ul>
                <a href="#">목록</a>
                <a href="#">규칙</a>
            </ul>
        </nav>
    </article>
    <main id="main">
        <h1>근무시간 설정</h1>
        <hr>
        <div id="contents">
            <div class="time-set">
                <h2>시작시간</h2>
                <select id="startHour">
                    <% for(int i=0; i<24; i++) { %>
                    <option value="<%= i %>"><%= i %></option>
                    <% } %>
                </select>
                :
                <select id="startMinute">
                    <% for(int i=0; i<60;) { %>
                    <option value="<%= i %>"><%= i %></option>
                    <% i = i+5;
                    } %>
                </select>
            </div>

            <div class="time-set">
                <h2>종료시간</h2>
                <select id="endHour">
                    <% for(int i=0; i<24; i++) { %>
                    <option value="<%= i %>"><%= i %></option>
                    <% } %>
                </select>
                :
                <select id="endMinute">
                    <% for(int i=0; i<60;) { %>
                    <option value="<%= i %>"><%= i %></option>
                    <% i = i+5; 
                    } %>
                </select>
            </div>

            <div class="gps-set">
                <h2>GPS</h2>
                <input type="text" name="gpsLocation" placeholder="GPS 위치 정보 입력">
            </div>

            <button type="submit" id="register">설정 저장</button>
        </div>
    </main>
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
<script type="text/javascript">
	var startHour = document.getElementById("startHour");
	var startMinute = document.getElementById("startMinute");
	var endHour = document.getElementById("endHour");
	var endMinute = document.getElementById("endMinute");
	
	var startH = startHour.options[startHour.selectedIndex].value;
	var startMin = startMinute.options[startMinute.selectedIndex].value;
	var endH = endHour.options[endHour.selectedIndex].value;
	var endMin = endMinute.options[endMinute.selectedIndex].value;
	
	$(document).ready(function(){
		$("#register").click(function(){
			
			$.ajax({
				type:"POST",
				url:"/company/register/time",
				data:{
					startHour:startH,
					startMin:startMin,
					endHour:endH,
					endMin:endMin
				},
				success: function(result){
					if(result>0){
						alert("출퇴근 시간이 설정되었습니다.");
					}
					else{
						alert("출퇴근 시간이 설정에 실패하였습니다.");
					}
					
				}
			});
		});
	});
	
</script>
</body>


</html>