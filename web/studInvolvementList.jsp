<%-- 
    Document   : studentInvolvementList
    Created on : 26 May 2023, 1:01:48 AM
    Author     : wongh
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <title>UMT Hostel Management System</title>
        <link href="https://fonts.googleapis.com/css2?family=Rowdies&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="room.css">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="s2.css">
        <link rel="stylesheet" href="style.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    </head>

    <body>
        <!-- Header -->
        <header class="header">
            <!-- As a heading -->
            <div class="hero" style="background:white;">
                <nav class="navbar1"">
                    <div class="left flex">
                        <div class="email">
                            <i class="fa fa-envelope"></i>
                            <span>kolej.kediaman@umt.edu.my</span>
                        </div>
                        <div class="call">
                            <i class="fa fa-phone-alt"></i>
                            <span>+609-662 2084</span>
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

                        <a href="studHostelPage.jsp" class="btn1">Back</a>
                    </ul>
                </nav>
                <!-- Header -->

                <br><br>

                <!-- Body -->
                <div class="row">
                    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                    <div class="container">
                        <!-- Display list of employees -->
                        <h3 class="text-center">Merit MyStar</h3>
                        <hr><br>
                        <div class="container text-left">
                            <!-- Add New Employee button to add new employee -->
                            <b>Student ID: <%=session.getAttribute("user")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Target Merit: <%=request.getAttribute("targetMerit")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Total Merit: <%=request.getAttribute("totalMerit")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                  
                                <c:if test='<%=Integer.parseInt(String.valueOf(request.getAttribute("totalMerit"))) < 200%>'>
                                    Stars: 
                                </c:if>
                                <c:if test='<%=Integer.parseInt(String.valueOf(request.getAttribute("totalMerit"))) >= 200 && Integer.parseInt(String.valueOf(request.getAttribute("totalMerit"))) < 400%>'>
                                    Stars: <i class="fa fa-star" style="font-size: 16px; color: orange"></i>
                                </c:if>
                                <c:if test='<%=Integer.parseInt(String.valueOf(request.getAttribute("totalMerit"))) >= 400 && Integer.parseInt(String.valueOf(request.getAttribute("totalMerit"))) < 600%>'>
                                    Stars: <i class="fa fa-star" style="font-size: 16px; color: orange"></i>&nbsp;<i class="fa fa-star" style="font-size: 16px; color: orange"></i>
                                </c:if>
                                <c:if test='<%=Integer.parseInt(String.valueOf(request.getAttribute("totalMerit"))) >= 600 && Integer.parseInt(String.valueOf(request.getAttribute("totalMerit"))) < 800%>'>
                                    Stars: <i class="fa fa-star" style="font-size: 16px; color: orange"></i>&nbsp;<i class="fa fa-star" style="font-size: 16px; color: orange"></i>&nbsp;<i class="fa fa-star" style="font-size: 16px; color: orange"></i>
                                </c:if>
                                <c:if test='<%=Integer.parseInt(String.valueOf(request.getAttribute("totalMerit"))) >= 800 && Integer.parseInt(String.valueOf(request.getAttribute("totalMerit"))) < 1000%>'>
                                    Stars: <i class="fa fa-star" style="font-size: 16px; color: orange"></i>&nbsp;<i class="fa fa-star" style="font-size: 16px; color: orange"></i>&nbsp;<i class="fa fa-star" style="font-size: 16px; color: orange"></i>&nbsp;<i class="fa fa-star" style="font-size: 16px; color: orange"></i>
                                </c:if>
                                <c:if test='<%=Integer.parseInt(String.valueOf(request.getAttribute("totalMerit"))) >= 1000%>'>
                                    Stars: <i class="fa fa-star" style="font-size: 16px; color: orange"></i>&nbsp;<i class="fa fa-star" style="font-size: 16px; color: orange"></i>&nbsp;<i class="fa fa-star" style="font-size: 16px; color: orange"></i>&nbsp;<i class="fa fa-star" style="font-size: 16px; color: orange"></i>&nbsp;<i class="fa fa-star" style="font-size: 16px; color: orange"></i>
                                </c:if>
                            </b>
                        </div>
                        <br>
                        <!-- Table -->
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Merit Program</th>
                                    <th>Category</th>
                                    <th>Semester</th>
                                    <th>Date</th>
                                    <th>Role</th>
                                    <th>Merit</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%! int i = 0;%>
                                <!-- for (Todo todo: todos) { -->
                                <c:forEach var="involvement" items="${listInvolvement}">
                                    <% i = i + 1;%>
                                    <tr>
                                        <td>
                                            <c:out value="<%=i%>" />
                                        </td>
                                        <td>
                                            <c:out value="${involvement.meritDesc}" />
                                        </td>
                                        <td>
                                            <c:out value="${involvement.category}" />
                                        </td>
                                        <td>
                                            <c:out value="${involvement.semester}" />
                                        </td>
                                        <td>
                                            <c:out value="${involvement.date}" />
                                        </td>
                                        <td>
                                            <c:out value="${involvement.role}" />
                                        </td>
                                        <td>
                                            <c:out value="${involvement.merit}" />
                                        </td>
                                    </tr>
                                </c:forEach>
                                <% i = 0;%>
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