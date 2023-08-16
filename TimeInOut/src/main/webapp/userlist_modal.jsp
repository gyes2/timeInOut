<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="user.dto.AdminUserDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
	<body>
		<h1>User List for add</h1>
        
		<form action="/admin/user-modal" method="get">
			<input type="text" name="userName" placeholder="userName">
			<button type="submit">Search</button>
        </form>
        
        <table border="1">
            <th>User Id</th>
            <th>User Name</th>
            <th>Email</th>
            <%  for (AdminUserDto user : (List<AdminUserDto>) request.getAttribute("currentPageUsers")) { %>
                <tr>
                    <td><%= user.getUserId() %></td>
                    <td><%= user.getUserName() %></td>
                    <td><%= user.getEmail() %></td>
                    
                    <td>
                        <form action="/add-teamid" method="post">
	                        <select name="teamName">
		                        <%  for (String team : (List<String>) request.getAttribute("teamList")) { %>
								    <option value="<%= team %>"><%= team %></option>
							    <%  } %>
								</select>
                            <input type="hidden" name="userId" value="<%= user.getUserId() %>">
                            <button type="submit">add</button>
                        </form>
                    </td>
                </tr>
            <%  } %>
        </table>

        <div>
            <%  int totalPages = (int) request.getAttribute("totalPages");
                for (int i = 1; i <= totalPages; i++) { %>
                    <a href="/admin/user?page=<%= i %>"><%= i %></a>
            <%  } %>
        </div>
    </body>
</html>