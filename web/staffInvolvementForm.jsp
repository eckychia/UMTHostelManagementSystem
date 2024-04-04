<%-- 
    Document   : involvementForm
    Created on : 25 May 2023, 9:29:38 PM
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

                    <a href="involvementListByMeritID?meritID=<%=session.getAttribute("meritID")%>&category=<%=session.getAttribute("category") %>" class="btn1">Back</a>
                </ul>
            </nav>
            <!-- Header -->

            <br><br>
        <!-- Body -->
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <!-- Test whether to put Edit Employee or Add New Employee based on situation -->
                    <c:if test="${involvement != null}">
                        <form action="updateInvolvement" method="post">
                    </c:if>
                    <c:if test="${involvement == null}">
                        <form action="insertInvolvement" method="post">
                    </c:if>
                    
                    <h2>
                        <c:if test="${involvement != null}">
                            Edit Involvement / Participation
                        </c:if>
                        <c:if test="${involvement == null}">
                            Add Involvement / Participation
                        </c:if> 
                    </h2>
                            
                    <c:if test="${involvement != null}">
                        <input type="hidden" name="id" value="<c:out value='${involvement.studID}' />" />
                    </c:if> 
                        
                    <!-- Get input from user -->
                    <input type="hidden" name="category" id="category" value="<%=session.getAttribute("category")%>" />
                    <br>
                    <fieldset class="form-group">
                        <label>Student ID</label> <input type="text" value="<c:out value='${involvement.studID}' />"
                                                         class="form-control" name="studID" required="required">
                    </fieldset>
                                                            
                    <fieldset class="form-group">
                        <label>Merit ID</label> <input type="text" value="<%=session.getAttribute("meritID")%>"
                                                            class="form-control" name="meritID" required="required" readonly>
                    </fieldset>                                                                                                                                           
                                                            
                    <fieldset class="form-group">
                        <label>Role</label> 
                        <input type="text" value="<c:out value='${involvement.role}' />"class="form-control" readonly>
                            <select id="role" class="form-control" name="role" onchange="updateTextInput()">
                                <option value="Participant">Participant</option>
                                <option value="Facilitator">Facilitator</option>
                                <option value="Represent University">Represent University</option>
                            </select>
                    </fieldset>                                       
                                                            
                    <fieldset class="form-group">
                        <label>Merit</label> <input type="text" value="<c:out value='${involvement.merit}' />"class="form-control" name="merit" id="merit" readonly>
                    </fieldset>
                    <br>                                        
                           
                    <!-- Button save to save information -->
                    <button type="submit" class="btn btn-success"">Save</button>
                    </form>
                </div>
            </div>
        </div>
         <script>
            function updateTextInput() {
                var category = document.getElementById('category').value;
                var role = document.getElementById('role').value;
                var merit = 0;
                
                if (category === "Club"){
                    merit = 5;
                } else if (category === "University"){
                    merit = 10;
                } else if (category === "National"){
                    merit = 30;
                } else if (category === "International"){
                    merit = 50;
                } else {
                    merit = 0;
                }
                
                if (role === "Participant"){
                    merit = merit * 1;
                } else if (role === "Represent University"){
                    if (category === "Club"){
                        merit = 8;
                    } else {
                        merit = merit * 1.5;
                    }
                } else if (role === "Facilitator"){
                    merit = merit * 2;
                } else {
                    merit = merit * 0;
                }
                
                document.getElementById('merit').value=merit; 
            }            
        </script> 
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

