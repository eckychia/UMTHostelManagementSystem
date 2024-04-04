<%-- 
    Document   : application
    Created on : 6 Jun 2023, 10:59:37 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                    <a href="staffHomePage.jsp" class="btn1">Back</a>
                </ul>
            </nav>
            <!-- Header -->

            <br>

            <!-- Action -->
            <section id="offer" class="offer section-padding">
                <div class="container">
                    <div class="row" style="background-color:white; color:black;">
                        <div class="col-md-12">
                            <div class="section-header text-center pb-5">
                                <br><br>
                                <h1 style="font-family: 'Rowdies'; color: black;">APPLICATIONS</h1>
                            </div>
                        </div>
                    </div>

                    
                    
                    <div class="row" style="background-color:white; color:black;">
                        <div class="col-12 col-md-12 col-lg-2"></div>
                        <div class="col-12 col-md-12 col-lg-4">
                            <div class="card text-center bg-white pb-2">
                                <div class="card-body text-dark">
                                    <div class="img-area mb-4">
                                        <br><br><img src="images/hostel.png" style="width:109px; height:109px;">
                                    </div><br>
                                    <h3 class="card-title" style="font-family: 'IM Fell Great Primer', serif;">Hostel Application</h3>
                                    <p class="lead" style="font-family: 'NTR', sans-serif;"><br>View List of Hostel Application<br><br><br>
                                        <a href="hostelApplicationList"><button class="btn mt-3" style="color: white; background-color: orange;">Details</button></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-12 col-lg-4">
                            <div class="card text-center bg-white pb-2">
                                <div class="card-body text-dark">
                                    <div class="img-area mb-4">
                                        <br><img src="images/room.png" style="width:155px; height:158px;">
                                    </div>
                                    <h3 class="card-title" style="font-family: 'IM Fell Great Primer', serif;">Room Application</h3>
                                    <p class="lead" style="font-family: 'NTR', sans-serif;"><br>View List of Room Application<br><br><br>
                                        <a href="applicationList"><button class="btn mt-3" style="color: white; background-color: orange;">Details</button></a>
                                </div>
                            </div>
                        </div>
                       <div class="col-12 col-md-12 col-lg-2"></div>
                    </div>
                </div>
            </section>

            <br>    
            <br>
            <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
            <script src="script.js"></script>
            <script>
                        let subMenu = document.getElementById("subMenu");
                        function toggleMenu() {
                            subMenu.classList.toggle("open-menu");
                        }
            </script>
            <script type="text/javascript" src="script.js"></script>
            </body>
            </html>