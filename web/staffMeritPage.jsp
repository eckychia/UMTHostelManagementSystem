<%-- 
    Document   : merit
    Created on : 25 May 2023, 9:24:09 PM
    Author     : wongh
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
                                <h1 style="font-family: 'Rowdies'; color: black;">MERIT MYSTAR</h1>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="background-color:white; color:black;">
                        <div class="col-12 col-md-12 col-lg-4">
                            <div class="card text-center bg-white pb-2">
                                <div class="card-body text-dark">
                                    <div class="img-area mb-4">
                                        <br><img src="images/add.png" style="width:100px; height:100px;">
                                    </div>
                                    <h3 class="card-title" style="font-family: 'IM Fell Great Primer', serif;">Add</h3>
                                    <p class="lead" style="font-family: 'NTR', sans-serif;"><br>Add a New Merit<br><br><br>
                                        <a href="http://localhost:8080/UMTHostelManagementSystem/newMerit"><button class="btn mt-3" style="color: white; background-color: orange;">Add</button></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-12 col-lg-4">
                            <div class="card text-center bg-white pb-2">
                                <div class="card-body text-dark">
                                    <div class="img-area mb-4">
                                        <br><img src="images/edit.png" style="width:110px; height:100px;">
                                    </div>
                                    <h3 class="card-title" style="font-family: 'IM Fell Great Primer', serif;">Edit</h3>
                                    <p class="lead" style="font-family: 'NTR', sans-serif;"><br>Edit an Existing Merit<br><br><br>
                                        <a href="http://localhost:8080/UMTHostelManagementSystem/meritList"><button class="btn mt-3" style="color: white; background-color: orange;">Edit</button></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-12 col-lg-4">
                            <div class="card text-center bg-white pb-2">
                                <div class="card-body text-dark">
                                    <div class="img-area mb-4">
                                        <br><img src="images/list.png" style="width:110px; height:100px;">
                                    </div>
                                    <h3 class="card-title" style="font-family: 'IM Fell Great Primer', serif;">List</h3>
                                    <p class="lead" style="font-family: 'NTR', sans-serif;"><br>Get the List of Merits<br><br><br>
                                        <a href="http://localhost:8080/UMTHostelManagementSystem/meritList"><button class="btn mt-3" style="color: white; background-color: orange;">Get List</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
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
