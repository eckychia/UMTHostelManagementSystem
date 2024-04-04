<%-- 
    Document   : involvementList
    Created on : 25 May 2023, 9:28:50 PM
    Author     : wongh
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <title>UMT Hostel Management System</title>
        <link href="https://fonts.googleapis.com/css2?family=Rowdies&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              <link rel="stylesheet" type="text/css" href="room.css">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="s2.css">
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">    </head>


        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    </head>
</head>

<body>
    <!-- Header -->
    <header class="header">
        <!-- As a heading -->
        <div class="hero" style="background:white;">
            <nav class="navbar1"">
                <div class="left flex">
                    <div>
                        <a href="http://localhost:8080/UMTHostelManagementSystem/staffHomePage.jsp" class="navbar-brand" style="color: white;"> UMT Hostel Management System </a>                   
                    </div>
                </div>
                <div class="right flex">
                    <ul>
                        <%if (session.getAttribute("user").equals("admin")) { %>
                        <li><a href="<%=request.getContextPath()%>/staffStaffPage.jsp" class="nav-link">STAFF</a></li>
                        <li><a href="<%=request.getContextPath()%>/staffStudentPage.jsp" class="nav-link">STUDENTS</a></li>
                        <%}%>
                        <li><a href="<%=request.getContextPath()%>/staffMeritPage.jsp" class="nav-link active">MERITS</a></li>
                        <li><a href="<%=request.getContextPath()%>/staffHostelPage.jsp" class="nav-link">HOSTELS</a></li>
                        <li><a href="<%=request.getContextPath()%>/staffRoomPage.jsp" class="nav-link">ROOMS</a></li>
                        <li><a href="<%=request.getContextPath()%>/staffApplicationPage.jsp" class="nav-link">APPLICATIONS</a></li>
                        <li><a href="<%=request.getContextPath()%>/staffReportPage.jsp" class="nav-link">REPORTS</a></li>
                    </ul>
                    <img src="images/user.png" class="user-pic" onclick="toggleMenu()">

                    <div class="sub-menu-wrap" id="subMenu">
                        <div class="sub-menu">
                            <div class="user-info">
                                <img src="images/user.png">
                                <%if (session.getAttribute("user").equals("admin")) { %>
                                <h3 style="font-size: 19px;">Admin</h3>
                                <%} else {%>
                                <h3 style="font-size: 19px;">Staff&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <%=session.getAttribute("user")%></h3>
                                <%}%>
                            </div>
                            <hr>
                            <%if (session.getAttribute("user").equals("admin")) { %>
                            <a href="updatePasswordForm.jsp" class="sub-menu-link">
                                <%} else {%>
                                <a href="showStaffProfile?staffID=<%=session.getAttribute("user")%>" class="sub-menu-link">
                                <%}%>
                                <img src="images/profile.png">
                                <p>Edit Profile</p>
                                <span>></span>
                            </a>
                            <a href="loginInterface.jsp" class="sub-menu-link">
                                <img src="images/logout.png">
                                <p>Logout</p>
                                <span>></span>
                            </a>

                        </div>

                    </div>

                </div>
            </nav>

            <nav class="navbar2">
                <img src="images/UMT.png" class="logo1">
                <img src="images/logoUMT.png" class="logo">
                <ul>

                    <a href="<%=request.getContextPath()%>/meritList" class="btn1">Back</a>
                </ul>
            </nav>
            <!-- Header -->

            <br><br>
        
        <!-- Body -->
        <div class="row">
            <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->
            
            <div class="container">
                <!-- Display list of employees -->
                <h3 class="text-center">Involvements of <%=request.getParameter("meritID")%></h3>
                <% 
                    String meritID = request.getParameter("meritID");
                    session.setAttribute("meritID", meritID);
                    String category = request.getParameter("category");
                    session.setAttribute("category", category);
                %>
                <hr>
                <div class="container text-left">
                    <!-- Add New Employee button to add new employee -->                    
                    <a href="<%=request.getContextPath()%>/newInvolvement?meritID=<%=session.getAttribute("meritID")%>" class="btn btn-success">Add New Involvement</a>
                </div>
                <br>
                <!-- Table -->
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Merit ID</th>
                            <th>Role</th>
                            <th>Merit</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- for (Todo todo: todos) { -->
                        <c:forEach var="involvement" items="${listInvolvement}">
                            <tr>
                                <td>
                                    <c:out value="${involvement.studID}" />
                                </td>
                                <td>
                                    <c:out value="${involvement.meritID}" />
                                </td>
                                <td>
                                    <c:out value="${involvement.role}" />
                                </td>
                                <td>
                                    <c:out value="${involvement.merit}" />
                                </td>
                                <!-- Here need add parameter of meritID -->
                                <td><a href="editInvolvement?studID=<c:out value='${involvement.studID}' />&meritID=<c:out value='${involvement.meritID}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="deleteInvolvement?studID=<c:out value='${involvement.studID}' />&meritID=<c:out value='${involvement.meritID}' />&category=<%=session.getAttribute("category") %>">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
            <script src="script.js"></script>
            <script>
                        let subMenu = document.getElementById("subMenu");
                        function toggleMenu() {
                            subMenu.classList.toggle("open-menu");
                        }
            </script>
    </body>
    
</html>