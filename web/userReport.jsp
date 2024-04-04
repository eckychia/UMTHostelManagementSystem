<%-- 
    Document   : userReport
    Created on : Jun 11, 2023, 12:13:26 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
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
        <style>
            @import url(https://fonts.googleapis.com/css?family=Roboto:400,100,900);

            html,
            body {
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                height: 100%;
                width: 100%;
                background: #FFF;
                font-family: 'Roboto', sans-serif;
                font-weight: 400;
            }

            .wrapper {
                display: table;
                height: 100%;
                width: 100%;
            }

            .container-fostrap {
                display: table-cell;
                padding: 1em;
                text-align: center;
                vertical-align: middle;
            }
            .fostrap-logo {
                width: 100px;
                margin-bottom:15px
            }
            h1.heading {
                color: #fff;
                font-size: 1.15em;
                font-weight: 900;
                margin: 0 0 0.5em;
                color: #505050;
            }
            @media (min-width: 450px) {
                h1.heading {
                    font-size: 3.55em;
                }
            }
            @media (min-width: 760px) {
                h1.heading {
                    font-size: 3.05em;
                }
            }
            @media (min-width: 900px) {
                h1.heading {
                    font-size: 3.25em;
                    margin: 0 0 0.3em;
                }
            }
            .card {
                display: block;
                margin-bottom: 20px;
                line-height: 1.42857143;
                background-color: #fff;
                border-radius: 2px;
                box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
                transition: box-shadow .25s;
            }
            .card:hover {
                box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
            }
            .img-card {
                width: 100%;
                height:300px;
                border-top-left-radius:2px;
                border-top-right-radius:2px;
                display:block;
                overflow: hidden;
            }
            .img-card img{
                width: 65%;
                height:65%;
                object-fit:cover;
                transition: all .25s ease;
            }
            .card-content {
                padding:15px;
                text-align:left;
            }
            .card-title {
                margin-top:0px;
                font-weight: 700;
                font-size: 1.65em;
            }
            .card-title a {
                color: #000;
                text-decoration: none !important;
            }
            .card-read-more {
                border-top: 1px solid #D4D4D4;
            }
            .card-read-more a {
                text-decoration: none !important;
                padding:10px;
                font-weight:600;
                text-transform: uppercase
            }
        </style>
        <script type="text/javascript">
            function preventBack() {
                window.history.forward();
            }
            setTimeout("preventBack()", 0);
            window.onunload = function () {
                null;
            };
        </script>
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
                            <%if (session.getAttribute("user").equals("admin")) {%>
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

                        <a href="staffReportPage.jsp" class="btn1">Back</a>
                    </ul>
                </nav>
                <!-- Header -->

                <br>

                <section id="offer" class="offer section-padding">
                    <div class="container">
                        <div class="row" style="background-color:white; color:black;">
                            <div class="col-md-12">
                                <div class="section-header text-center pb-5">
                                    <br><br>

                                    <h1 style="font-family: 'Rowdies'; color: black;">USER REPORT</h1>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="background-color:white; color:black;">
                            <div class="col-12 col-md-12">
                                <div class="card text-center bg-white pb-2">
                                    <div class="card-body text-dark">
                                        <div class="img-area mb-4">
                                            <br><img src="https://cdn-icons-png.flaticon.com/512/2206/2206368.png" style="width:200px; height:200px;">
                                        </div>
                                        <h3 class="card-title" style="font-family: 'IM Fell Great Primer', serif;">ADMIN</h3><br>
                                        Total Admin: <%=request.getAttribute("number")%>
                                    </div><br>
                                </div>
                            </div>

                            <div class="col-12 col-md-12">
                                <div class="card text-center bg-white pb-2">
                                    <div class="card-body text-dark">
                                        <div class="img-area mb-4">
                                            <br><img src="images/staff.png" style="width:200px; height:200px;">
                                        </div>
                                        <h3 class="card-title" style="font-family: 'IM Fell Great Primer', serif;">STAFF</h3><br>
                                        Total Staff: <%=request.getAttribute("staffNumber")%>
                                    </div><br>
                                </div>
                            </div>

                            <div class="col-12 col-md-12">
                                <div class="card text-center bg-white pb-2">
                                    <div class="card-body text-dark">
                                        <div class="img-area mb-4">
                                            <br><img src="images/student.png" style="width:200px; height:200px;">
                                        </div>
                                        <h3 class="card-title" style="font-family: 'IM Fell Great Primer', serif;">STUDENT</h3><br>
                                        Total Student: <%=request.getAttribute("studentNumber")%>
                                    </div><br>
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
