<%-- 
    Document   : meritForm
    Created on : 25 May 2023, 9:25:27 PM
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

            <br><br><br>
        <!-- Body -->
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <!-- Test whether to put Edit Employee or Add New Employee based on situation -->
                    <c:if test="${merit != null}">
                        <form action="updateMerit" method="post">
                        </c:if>
                        <c:if test="${merit == null}">
                            <form action="insertMerit" method="post">
                            </c:if>

                            <h2>
                                <c:if test="${merit != null}">
                                    Edit Merit MyStar
                                </c:if>
                                <c:if test="${merit == null}">
                                    Add New Merit MyStar
                                </c:if> 
                            </h2>

                            <c:if test="${merit != null}">
                                <input type="hidden" name="id" value="<c:out value='${merit.meritID}' />" />
                            </c:if> 

                            <!-- Get input from user -->
                            <br>
                            <fieldset class="form-group">
                                <label>Merit ID</label> <input type="text" value="<c:out value='${merit.meritID}' />"
                                                               class="form-control" name="meritID" required="required">
                            </fieldset>                                                            

                            <fieldset class="form-group">
                                <label>Description</label> <input type="text" value="<c:out value='${merit.meritDesc}' />"
                                                                  class="form-control" name="meritDesc">
                            </fieldset>

                            <fieldset class="form-group">
                                <label>Category</label> 
                                <input type="text" value="<c:out value='${merit.category}' />" class="form-control" readonly >

                                <select id="categoryList" id="category" class="form-control" name="category">
                                    <option value="International">International</option>
                                    <option value="National">National</option>
                                    <option value="University">University</option>
                                    <option value="Club">Club</option>
                                </select>
                            </fieldset>

                            <fieldset class="form-group">
                                <label>Semester</label> 
                                <input type="text" value="<c:out value='${merit.semester}' />" class="form-control" readonly >
                                <select id="semesterList" class="form-control" name="semester">
                                    <option value="2022/23-2">2022/23-2</option>
                                    <option value="2023/24-1">2023/24-1</option>
                                    <option value="2023/24-2">2023/24-2</option>
                                </select>
                            </fieldset>

                            <fieldset class="form-group">
                                <label>Date</label> <input type="date" value="<c:out value='${merit.date}' />"
                                                           class="form-control" name="date">
                            </fieldset>                                                                              
                            <br>                                        

                            <!-- Button save to save information -->
                            <button type="submit" class="btn btn-success"">Save</button>
                        </form>
                </div>
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
