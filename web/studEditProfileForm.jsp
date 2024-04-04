<%-- 
    Document   : studEditProfileForm
    Created on : 13 Jun 2023, 6:34:39 PM
    Author     : wongh
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UMT Hostel Management System</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Rowdies&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              <link rel="stylesheet" type="text/css" href="room.css">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="s2.css">

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    </head>
    <body>
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
                            <li><a href="studHostelPage.jsp">HOME</a></li>
                            <li><a href="studRoomPage.jsp">ROOM</a></li>
                            <li><a href="involvementListByStudID?studID=<%=session.getAttribute("user")%>">MERIT</a></li>
                            <li><a href="#">APPLICATION</a>
                                <ul class="dropdown">                                   
                                        <%if (session.getAttribute("count").equals(0)) {%>
                                        <li><a href="studHostelApplication.jsp">APPLY HOSTEL</a></li>
                                        <li><a href="studRoomApplication.jsp" onclick="return false;">APPLY ROOM</a></li>  
                                        <li><a href="showHostelApplicationStatus?studID=<%=session.getAttribute("user")%>" onclick="return false;">STATUS</a></li> 
                                        <%} else { %>
                                        <li><a href="studHostelApplication.jsp" onclick="return false;">APPLY HOSTEL</a></li>
                                            <%if (session.getAttribute("action").equals("Reject")) { %>
                                        <li><a href="studRoomApplication.jsp" onclick="return false;">APPLY ROOM</a></li>
                                            <%} else { %>
                                                <%if(session.getAttribute("roomApplication").equals(0)){ %>
                                        <li><a href="studRoomApplication.jsp">APPLY ROOM</a></li>  
                                                <%} else { %>
                                        <li><a href="offerLetter?studID=<%=session.getAttribute("user")%>">APPLY ROOM</a></li>
                                                <%}
                                              }%>
                                        <li><a href="showHostelApplicationStatus?studID=<%=session.getAttribute("user")%>">STATUS</a></li> 
                                         <%}%>
                                    </ul>
                            </li>
                        </ul>
                        <img src="images/user.png" class="user-pic" onclick="toggleMenu()">

                        <div class="sub-menu-wrap" id="subMenu">
                            <div class="sub-menu">
                                <div class="user-info">
                                    <img src="images/user.png">
                                    <h3 style="font-size: 19px;">Student&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <%=session.getAttribute("user")%></h3>
                                </div>
                                <hr>
                                <a href="showStudentProfile?studID=<%=session.getAttribute("user")%>" class="sub-menu-link">
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
                        <a href="showStudentProfile?studID=<%=session.getAttribute("user")%>" class="btn1">Back</a>
                    </ul>

                </nav>
                <!-- Header -->

                <br><br><br>
                <div class="container col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <form action="updateStudentPersonalInfo" method="post">
                                <h2>Edit Personal Details</h2><br>

                                <fieldset class="form-group">
                                    <label>Student ID</label>
                                    <input type="text" value="<c:out value='${student.studid}' />"
                                           class="form-control" name="studid" required="required" readonly>
                                </fieldset>

                                <fieldset class="form-group">
                                    <label>Student Name</label>
                                    <input type="text" value="<c:out value='${student.name}' />"
                                           class="form-control" name="name" required="required" readonly>
                                </fieldset>

                                <fieldset class="form-group">
                                    <label>Student IC No</label>
                                    <input type="text" value="<c:out value='${student.icno}' />"
                                           class="form-control" name="icno" required="required" readonly>
                                </fieldset>

                                <fieldset class="form-group">
                                    <label>Course</label>
                                    <input type="text" value="<c:out value='${student.course}' />"
                                           class="form-control" name="course" required="required" readonly>
                                </fieldset>

                                <fieldset class="form-group">
                                    <label>Student Email</label>
                                    <input type="text" value="<c:out value='${student.email}' />"
                                           class="form-control" name="email">
                                </fieldset>

                                <fieldset class="form-group">
                                    <label>Student HP No</label>
                                    <input type="text" value="<c:out value='${student.hpno}' />"
                                           class="form-control" name="hpNo">
                                </fieldset><br>

                                <fieldset class="form-group">
                                    <a href="updatePasswordForm.jsp">Change Password?</a>
                                </fieldset>

                                <button type="submit" class="btn btn-success">Save</button>
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
