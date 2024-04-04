<%-- 
    Document   : staffHostelApplicationForm
    Created on : 15 Jun 2023, 8:35:48 pm
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
                            <a href="staffHomePage.jsp" class="navbar-brand" style="color: white;"> UMT Hostel Management System </a>                   
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

                        <a href="<%=request.getContextPath()%>/hostelApplicationList" class="btn1">Back</a>
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
                            <c:if test="${hostelApplication != null}">
                                <form action="updateHostelApplication" method="post">
                                </c:if>
                                <c:if test="${hostelApplication == null}">
                                    <form action="insertHostelApplication" method="post">
                                    </c:if>

                                    <h2>
                                        <c:if test="${hostelApplication != null}">
                                            Edit Hostel Application
                                        </c:if>
                                        <c:if test="${hostelApplication== null}">
                                            Add Hostel Application 
                                        </c:if> 
                                    </h2><br>

                                    <c:if test="${hostelApplication != null}">
                                        <input type="hidden" name="studID" value="<c:out value='${hostelApplication.getStudID()}' />" />
                                    </c:if> 

                                    <!-- Get input from user -->


                                    <fieldset class="form-group">
                                        <label>Student ID</label> <input type="text" value="<c:out value='${hostelApplication.getStudID()}' />"
                                                                         class="form-control" name="studID" readonly>
                                    </fieldset>



                                    <fieldset class="form-group">
                                        <label for="condition">Condition
                                        </label>
                                        <select name="condition" id="condition" class="form-control" value="<c:out value='${hostelApplication.getCondition()}' />">
                                            <option value="Common Student">Common Student</option>
                                            <option value="Health Problem">Health Problem</option>
                                            <option value="Student of Uniformed Bodies">Student of Uniformed Bodies</option>

                                        </select>
                                    </fieldset>                                     

                                    <fieldset class="form-group">
                                        <label>Merit</label> <input type="text" value="<c:out value='${hostelApplication.getMerit()}' />"
                                                                    class="form-control" id="merit" name="merit" required="required" readonly>

                                    </fieldset>
                                    <fieldset class="form-group">
                                        <label>Status </label> 
                                        <select name="status" id="status" class="form-control" value="<c:out value='${hostelApplication.getStatus()}' />">
                                            <option value="Successful">Successful</option>
                                            <option value="Unsuccessful">Unsuccessful</option>

                                        </select>        
                                    </fieldset>

                                    <fieldset class="form-group">
                                        <label>Accept / Reject </label> 
                                        <select name="action" id="action" class="form-control" value="<c:out value='${hostelApplication.getAction()}' />">
                                            <option value="Accept">Accept</option>
                                            <option value="Reject">Reject</option>

                                        </select>          
                                    </fieldset>


                                    <!-- Button save to save information -->
                                    <button type="submit" class="btn btn-success">Save</button>
                                </form>
                        </div>
                    </div>
                </div>

                </body>
                <script type="text/javascript" src="script.js"></script>
                         </html>