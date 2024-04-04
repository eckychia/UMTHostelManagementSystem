<%-- 
    Document   : staffApplicationForm
    Created on : 6 Jun 2023, 11:04:45 pm
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
    <!-- Header -->
    <header class="header">
        <!-- As a heading -->
        <div class="hero" style="background:white;">
            <nav class="navbar1"">
                <div class="left flex">
                    <div>
                        <a href="http://localhost:8080/UMTHostelManagementSystem/home.jsp" class="navbar-brand" style="color: white;"> UMT Hostel Management System </a>                   
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

                    <a href="<%=request.getContextPath()%>/applicationList" class="btn1">Back</a>
                </ul>
            </nav>
            <!-- Header -->


            <!-- Body -->
            <br><br>


            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        <!-- Test whether to put Edit Car or Add New Car based on situation -->
                        <c:if test="${application != null}">
                            <form action="updateApplication" method="post">
                            </c:if>
                            <c:if test="${application == null}">
                                <form action="insertApplication" method="post">
                                </c:if>

                                <h2>
                                    <c:if test="${application != null}">
                                        Edit Room Application
                                    </c:if>
                                    <c:if test="${application == null}">
                                        Add Room Application
                                        <input type="hidden" name="user" id="user" value="<%=session.getAttribute("type")%>">
                                    </c:if> 
                                </h2><br>

                                

                                <!-- Get input from user -->
                                <fieldset class="form-group">
                                    <label>Student ID</label> <input type="text" value="<c:out value='${application.getStudID()}' />"
                                                                     class="form-control" name="studID" required="required" readonly>
                                </fieldset>


                                <fieldset class="form-group">
                                    <label>Start Date</label> <input type="date" value="<c:out value='${application.getStartDate()}' />"
                                                                     class="form-control" name="startDate" required="required">
                                </fieldset>

                                <fieldset class="form-group">
                                    <label>End Date</label> <input type="date" value="<c:out value='${application.getEndDate()}' />"
                                                                   class="form-control" name="endDate" required="required">
                                </fieldset> 

                                <fieldset class="form-group">
                                    <label for="blockChosen">Block Chosen</label>
                                    <select name="block" id="block" class="form-control" value="<c:out value='${application.getBlock()}' />"
                                            required="required">
                                        <option value="Ibnu Sina">Ibnu Sina(IS)</option>
                                        <option value="Ibnu Hibbah">Ibnu Hibbah(IH)</option>
                                        <option value="Ibnu Majah">Ibnu Majah(IM)</option>
                                        <option value="Ibnu Abbas">Ibnu Abbas(IA)</option>
                                        <option value="Ibnu Jarir">Ibnu Jarir(IJ)</option>
                                        <option value="An Nasai">An-Nasai(ANN)</option>
                                        <option value="At thabrani">At-Tabrani(ATB)</option>
                                        <option value="At tarnidzi">At-Tarmidzi(ATT)</option>
                                    </select>
                                </fieldset> 

                                <fieldset class="form-group">
                                    <label for="blockLevel">Block Level
                                        <span style="color: red">*</span></label><p> All block have 4 level except (IS & IH have 5 level)</p>
                                    <select name="blockLevel" id="block" class="form-control" value="<c:out value='${application.getBlockLevel()}' />"
                                            required="required">>
                                        <option value="1">Level 1</option>
                                        <option value="2">Level 2</option>
                                        <option value="3">Level 3</option>
                                        <option value="4">Level 4</option>
                                        <option value="5">Level 5</option>
                                    </select>
                                </fieldset>                                     

                                <fieldset class="form-group">
                                    <label for="roomType">Room Type</label>
                                    <select name="roomType" id="block" class="form-control" value="<c:out value='${application.getRoomType()}' />"
                                            required="required">
                                        <option value="Double Room">Double Room (2pax)</option>
                                        <option value="Tripple Room">Triple Room(3pax)</option>
                                        <option value="Quadruple Room">Quadruple Room(4pax)</option>

                                    </select>
                                </fieldset>

                                <fieldset class="form-group">
                                    <label>Room No</label> <input type="text"  maxlength="20" minlength="5" placeholder="e.g. B1-307-1" value="<c:out value='${application.getRoomNo()}' />"
                                                                  class="form-control" name="roomNo" required="required">
                                </fieldset>                                     

                                <fieldset class="form-group">
                                    <label>Request</label> <input type="text"  maxlength="200" minlength="0" placeholder="Enter your problems" value="<c:out value='${application.getStuRequire()}' />"
                                                                  class="form-control" name="stuRequire">
                                </fieldset>



                                <!-- Button save to save information -->
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
              <script type="text/javascript" src="script.js"></script>
            </html>

