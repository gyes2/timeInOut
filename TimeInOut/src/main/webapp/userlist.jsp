<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="user.dto.AdminUserDto" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="shared.css">
    <title>User List</title>
    <style>
        #wrap {
            height: 900px;
        }

        #header {
            height: 10%;
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

        #main {
            height: 60%;
        }
        
        #main .contents {
            position: relative;
            left: 400px;
        }

        #main .contents h1 {
            position: relative;
            left: 400px;
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
        <header id="header">
            <h1 class="logo">
                <a href="/index.html">TIME IN OUT.</a>
              </h1>
              <nav>
                <ul>
                  <a href="index.html">logout</a>
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
            <div class="contents">
                <h1>User List</h1>
                <%--1. 리스트 출력--%>
                    <form action="/admin/user" method="get">
                        <input type="text" name="userName" placeholder="userName">
                        <button type="submit">Search</button>
                    </form>
            
                    <table border="1">
                        <th>User Id</th>
                        <th>User Name</th>
                        <th>Team Name</th>
                        <th>Email</th>
                        <% for (AdminUserDto user : (List<AdminUserDto>) request.getAttribute("currentPageUsers")) { %>
                            <tr>
                                <td>
                                    <%= user.getUserId() %>
                                </td>
                                <td>
                                    <%= user.getUserName() %>
                                </td>
                                <td>
                                    <%= user.getTeamName() %>
                                </td>
                                <td>
                                    <%= user.getEmail() %>
                                </td>
                                <td>
                                    <form action="/change-teamid" method="post">
                                        <input type="hidden" name="userId" value="<%= user.getUserId() %>">
                                        <button type="submit"><i class="fa-solid fa-trash-can"></i>Delete</button>
                                        <script src="https://kit.fontawesome.com/b187669ae5.js" crossorigin="anonymous"></script>
                                    </form>
                                </td>
                                <td>
                                    <button id="openChangeModalBtn"><i class="fa-solid fa-gear"></i>Change</button>
                                    <div id="changeModal" class="modal">
                                        <div class="modal-content">
                                            <span class="close" id="closeChangeModal">&times;</span>
                                            <div id="changeModalContent">
                                                <p>UserId : <%= user.getUserId() %>
                                                </p>
                                                <p>UserName : <%= user.getUserName() %>
                                                </p>
                                                <p>TeamName : <%= user.getTeamName() %>
                                                </p>
                                                <p>Email : <%= user.getEmail() %>
                                                </p>
                                                <hr>
                                                <form action="/add-teamid" method="post">
                                                    <select name="teamName">
                                                        <% for (String team : (List<String>) request.getAttribute("teamList")) { %>
                                                            <option value="<%= team %>">
                                                                <%= team %>
                                                            </option>
                                                            <% } %>
                                                    </select>
                                                    <input type="hidden" name="userId" value="<%= user.getUserId() %>">
                                                    <button type="submit">change</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                    </table>
            
            
            
                    <div>
                        <% int totalPages=(int) request.getAttribute("totalPages"); for (int i=1; i <=totalPages; i++) { %>
                            <a href="/admin/user?page=<%= i %>">
                                <%= i %>
                            </a>
                            <% } %>
                    </div>
            
                    <%--2. 모달, 유저 추가--%>
                        <button id="openModalButton">Add</button>
            
                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <span class="close" id="closeModal">&times;</span>
                                <div id="modalContent"></div>
                            </div>
                        </div>
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
    

            <script>
                const addModal = document.getElementById("myModal");
                const changeModal = document.getElementById("changeModal");

                document.getElementById("openModalButton").addEventListener("click", function () {
                    document.getElementById("myModal").style.display = "block";

                    $('#modalContent').load('/admin/user-modal');

                });

                document.getElementById("closeModal").addEventListener("click", function () {
                    document.getElementById("myModal").style.display = "none";
                });

                document.getElementById("openChangeModalBtn").addEventListener("click", function () {
                    document.getElementById("changeModal").style.display = "block";

                    $('#modalContent').load('/admin/user-modal');

                });

                document.getElementById("closeChangeModal").addEventListener("click", function () {
                    document.getElementById("changeModal").style.display = "none";
                });

                window.addEventListener("click", function (event) {
                    if (event.target === addModal) {
                        addModal.style.display = "none";
                    }
                    if (event.target === changeModal) {
                        changeModal.style.display = "none";
                    }
                });

            </script>
</body>

</html>