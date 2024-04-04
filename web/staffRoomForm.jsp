<%-- 
    Document   : staffRoomForm
    Created on : 7 Jun 2023, 2:19:22 pm
    Author     : User
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>UMT Hostel Management System</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="room.css">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="s2.css">

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>


    </head>
    <body style="background-color: white;">
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

                        <a href="roomList" class="btn1">Back</a>
                    </ul>
                </nav>

                <!-- Header -->

                <br>
                <!-- Header -->


                <!-- Body -->
                <br><br>


                <div class="container col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <!-- Test whether to put Edit Car or Add New Car based on situation -->
                            <c:if test="${room != null}">
                                <form action="updateRoom" method="post">
                                </c:if>
                                <c:if test="${room == null}">
                                    <form action="insertRoom" method="post">
                                    </c:if>

                                    <h2>
                                        <c:if test="${room != null}">
                                            Edit Room 
                                        </c:if>
                                        <c:if test="${room == null}">
                                            Add Room 
                                        </c:if> 
                                    </h2><br>

                                    <c:if test="${room != null}">
                                        <input type="hidden" name="roomID" value="<c:out value='${room.getRoomID()}' />" />
                                    </c:if> 

                                    <!-- Get input from user -->


                                    <fieldset class="form-group">
                                        <label>Room ID</label> <input type="text" value="<c:out value='${room.getRoomID()}' />"
                                                                      class="form-control" name="roomID" required="required">
                                    </fieldset>



                                    <fieldset class="form-group">
                                        <label for="capacity">Capacity
                                        </label>
                                        <select name="capacity" id="block" class="form-control" value="<c:out value='${room.getCapacity()}' />"
                                                required="required">
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>

                                        </select>
                                    </fieldset>                                     

                                    <fieldset class="form-group">
                                        <label for="feesPerNight">Fees Per Night</label>
                                        <select name="feesPerNight" id="block" class="form-control" value="<c:out value='${room.getFeesPerNight()}' />"
                                                required="required">
                                            <option value="7.00">RM7</option>
                                            <option value="5.00">RM5</option>
                                            <option value="3.00">RM3</option>

                                        </select>
                                    </fieldset>
                                    <fieldset class="form-group">
                                        <label>Hostel ID</label> <input type="text" class="form-control" name="hostelID" id="hostelID" value="<c:out value='${room.getHostelID()}' />"
                                                                        required="required">
                                    </fieldset>


                                    <!-- Button save to save information -->
                                    <button type="submit" class="btn btn-success">Save</button>
                                </form>
                        </div>
                    </div>
                </div>

                </body>
                <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
                <script src="script.js"></script>
                <script>
                            let subMenu = document.getElementById("subMenu");
                            function toggleMenu() {
                                subMenu.classList.toggle("open-menu");
                            }
                </script>
                <script type="text/javascript" src="script.js"></script>
                         </html>