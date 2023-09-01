<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="workIn.dto.WorkInDto" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/style/shared.css">

    <!-- 캘린더 라이브러리 가져다 쓰는 부분 -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.0.1/main.css' rel='stylesheet'/>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.0.1/main.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <title>Calendar</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            text-decoration: none;
        }


        #wrap {
            background: linear-gradient(45deg, #5f2c82, #49a09d);
            height: 100vh;
        }


        #main {
            display: flex;
            height: 80vh;
            width: 100%;
            justify-content: center;
            align-items: center;
        }

        #contents {
            border: 1px solid black;
            width: 90vh;
            background: #fff;
        }

        /* 푸터 */
        #footer {
            width: 100%;
            height: 10%;
            display: flex;
            justify-content: center;
            color: white;
        }

        #footernav,
        #footerp {
            display: flex;
            margin-left: 100px;

        }

    </style>
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
    <!-- 메인 -->
    <main id="main">

        <%
            String userId = (String) session.getAttribute("userId");
        %>
        <div id="contents">
            <div id='calendar'></div>
            <div id='dateClickModal' class='modal fade' role='dialog'>
                <div class='modal-dialog' id="modalWrap">
                    <div class='modal-content'>
                        <div class='modal-header'>
                            <h4 class='modal-title' id=title></h4>
                            <button type='button' class='close' data-dismiss='modal'>&times;</button>
                        </div>
                        <div class='modal-body'>
                            <p id='dateClickDetails'></p>
                        </div>
                        <div class='modal-footer'>
                            <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>
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

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                height: 'auto',
                // FullCalendar 옵션 설정
                headerToolbar: { // 헤더에 표시할 툴 바
                    start: 'prev next today',
                    center: 'title',
                    end: 'dayGridMonth,dayGridWeek,dayGridDay'
                },
                titleFormat: function (date) {
                    return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
                },
                nowIndicator: true, // 현재 시간 마크
                locale: 'ko',
                events: [
                    <%HashMap<String,WorkInDto> calendar = (HashMap<String,WorkInDto>) request.getAttribute("workList");%>
                    <%if (calendar != null) {%>
                    <%for (Map.Entry<String,WorkInDto> entry : calendar.entrySet()) {
                        System.out.println(entry.getValue().getWorkIn()+entry.getValue().getWorkOut()+entry.getValue().getStatus());
                        String status = "";
                        String c_color="";
                        if(entry.getValue().getStatus().equals("Y")){
                            status="출석";
                            c_color = "#006633";
                        }
                        else if(entry.getValue().getStatus().equals("D")){
                            status = "지각";
                            c_color = "#FFCC00";
                        }
                        else if(entry.getValue().getStatus().equals("E")){
                            status = "조퇴";
                            c_color = "#663399";
                        }
                        else{
                            status = "결석";
                            c_color = "#ff0000";
                        }%>
                    {
                        start: '<%=entry.getValue().getWorkIn()%>',
                        end: '<%=entry.getValue().getWorkOut()%>',
                        title: '<%=status%>',
                        color: '<%=c_color%>'
                    },

                    <%}
                }%>
                ],

                eventClick: function (info) {

                    var txt = "WorkIn: " + info.event.start.toTimeString().split(' ')[0] + "<br>"
                        + "WorkOut: " + info.event.end.toTimeString().split(' ')[0] + "<br>"
                        + "Status: " + info.event.title;

                    $("#title").html(info.event.start.toLocaleDateString().replace(/\./g, '').replace(/\s/g, '-'));
                    $("#dateClickDetails").html(txt);
                    $('#dateClickModal').modal('show');

                }
            });
            calendar.render();
        });
    </script>
</body>
</html>
