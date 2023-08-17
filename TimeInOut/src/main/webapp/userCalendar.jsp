<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="workIn.dto.WorkInDto"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.0.1/main.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.0.1/main.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <title>Calendar</title>
</head>
<body>
	<%
		String userId = (String)session.getAttribute("userId");
	%>
	
    <div id='calendar'></div>
    <div id='dateClickModal' class='modal fade' role='dialog'>
        <div class='modal-dialog' id="modalWrap">
            <div class='modal-content'>
                <div class='modal-header'>
                    <h4 class='modal-title'>Date Click Details</h4>
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
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                // FullCalendar 옵션 설정
	            headerToolbar : { // 헤더에 표시할 툴 바
					start : 'prev next today',
					center : 'title',
					end : 'dayGridMonth,dayGridWeek,dayGridDay'
				},
				titleFormat : function(date) {
					return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
				},
		//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
				//selectable : true, // 달력 일자 드래그 설정가능
				//droppable : true,
				//editable : true,
				nowIndicator: true, // 현재 시간 마크
				locale: 'ko',
				events : [ 
		    	    <%HashMap<String,WorkInDto> calendar = (HashMap<String,WorkInDto>) request.getAttribute("workList");%>
		            <%if (calendar != null) {%>
			            <%for (Map.Entry<String,WorkInDto> entry : calendar.entrySet()) {
			            	String status = "";
			            	if(entry.getValue().getStatus().equals("Y")){
			            		status="출석";
			            	}
			            	else if(entry.getValue().getStatus().equals("D")){
			            		status = "지각";
			            	}
			            	else if(entry.getValue().getStatus().equals("E")){
			            		status = "조퇴";
			            	}
			            	else{
			            		status = "결석";
			            	}%>
				            {
				                start : '<%=entry.getValue().getWorkIn()%>',
				                end : '<%=entry.getValue().getWorkOut()%>',
				                status:'<%=status%>',
				                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
				             },
						<%}
					}%>
				],
                // ...
                // 날짜 클릭 이벤트
                dateClick: function(info) {
                	
                    //$('#dateClickDetails').html('Clicked on: ' + info.dateStr);
                    $.ajax({
                    	type : "GET",           // 타입 (get, post, put 등등)
        			    url : "/calendar/details",      // 요청할 서버url
        			    data : {
        			    	'today':info.dateStr     //해당 날짜
        			    },     // 데이터 타입 (html, xml, json, text 등등)
        			    success : function(result) { // 결과 성공 콜백함수
        			        console.log(result);
        			        alert(result);
        			        var txt="";
        			        $.each(result, function(idx, e){
        			        	txt = "WorkIn: "+e.getWorkIn()+"<br>"
        			        	+"WorkOut: "+e.workOut+"<br>"
        			        	+"Status: "+e.status;
        			        })
        			        
        			    	$("#dateClickDetails").html(txt);
        			    	$('#dateClickModal').modal('show');	
        			    },
        			    error : function(request, status, error) { // 결과 에러 콜백함수
        			        console.log(error)
        			    }
                    });
                    
                }
            });
            calendar.render();
        });
    </script>
</body>
</html>
