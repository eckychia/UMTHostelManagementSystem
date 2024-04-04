<%-- 
    Document   : adminNewPassForm
    Created on : Jun 4, 2023, 5:50:38 PM
    Author     : admin
--%>

<html>
    <head>
        <title>UMT Hostel Management System</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link href="https://fonts.googleapis.com/css2?family=Rowdies&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
        <link rel="stylesheet" type="text/css" href="room.css">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

        <link rel="stylesheet" href="s2.css">

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>

        <style>
            body{
                background:#f3c538;
            }
            .forget-pwd > a{
                color: #dc3545;
                font-weight: 500;
            }

            .forget-password .panel-body{
                margin-left: 100px;
                width: 500px;
                padding: 15%;
                margin-bottom: -10%;
                background: #fff;
                border-radius: 5px;
                -webkit-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            .btnForget{
                background: #461B7E;
                border:none;
            }
            .forget-password .dropdown{
                width: 100%;
                border: 1px solid #ced4da;
                border-radius: .25rem;
            }
            .forget-password .dropdown button{
                width: 100%;
            }
            .forget-password .dropdown ul{
                width: 100%;
            }
        </style>
    </head>



    <body style="background-color:#E3E4FA;">
        <header class="header">
            <!-- As a heading -->
            <div class="hero" style="background:white;">
                <nav class="navbar1"">
                    <div class="left flex">
                        <%if (session.getAttribute("type").equals("student")) {%>
                        <div class="email">
                            <i class="fa fa-envelope"></i>
                            <span>kolej.kediaman@umt.edu.my</span>
                        </div>
                        <div class="call">
                            <i class="fa fa-phone-alt"></i>
                            <span>+609-662 2084</span>
                        </div>
                        <%} else { %>
                        <div>
                            <a href="http://localhost:8080/UMTHostelManagementSystem/staffHomePage.jsp" class="navbar-brand" style="color: white;"> UMT Hostel Management System </a>                   
                        </div>
                        <%}%>
                    </div>
                    <div class="right flex">
                        <%if (session.getAttribute("type").equals("student")) {%>
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
                        <%} else { %>
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
                        <%}%>
                        <img src="images/user.png" class="user-pic" onclick="toggleMenu()">

                        <div class="sub-menu-wrap" id="subMenu">
                            <div class="sub-menu">
                                <div class="user-info">
                                    <img src="images/user.png">
                                    <%if (session.getAttribute("type").equals("student")) {%>
                                    <h3 style="font-size: 19px;">Student&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <%=session.getAttribute("user")%></h3>
                                        <%} else { %>
                                        <%if (session.getAttribute("user").equals("admin")) { %>
                                    <h3 style="font-size: 19px;">Admin</h3>
                                    <%} else {%>
                                    <h3 style="font-size: 19px;">Staff&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <%=session.getAttribute("user")%></h3>
                                        <%}
                                            }%>
                                </div>
                                <hr>
                                <%if (session.getAttribute("type").equals("student")) {%>
                                <a href="showStudentProfile?studID=<%=session.getAttribute("user")%>" class="sub-menu-link">
                                    <%} else {%>
                                    <%if (session.getAttribute("user").equals("admin")) { %>
                                    <a href="updatePasswordForm.jsp" class="sub-menu-link">
                                        <%} else {%>
                                        <a href="showStaffProfile?staffID=<%=session.getAttribute("user")%>" class="sub-menu-link">
                                            <%}
                                            }%>
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
                                                <%if (session.getAttribute("type").equals("student")) {%>
                                                <a href="showStudentProfile?studID=<%=session.getAttribute("user")%>" class="btn1">Back</a>
                                                <%} else { %>
                                                <%if (session.getAttribute("user").equals("admin")) { %>
                                                <a href="http://localhost:8080/UMTHostelManagementSystem/staffHomePage.jsp" class="btn1">Back</a>
                                                <%} else {%>
                                                <a href="showStaffProfile?staffID=<%=session.getAttribute("user")%>" class="btn1">Back</a>
                                                <%}
                                            }%>
                                            </ul>
                                        </nav>
                                        <!-- Header -->

                                        <br>

                                        <br>
                                        <h2 align="center"><strong>Change Password</strong></h2><br>
                                        <script language="javascript">
                                            function successMessage() {
                                                alert('New Password Changed Successfully!');
                                            }
                                            function fncSubmit()
                                            {

                                                if (document.ChangePasswordForm.OldPassword.value === "")
                                                {
                                                    alert('Please input old password');
                                                    document.ChangePasswordForm.OldPassword.focus();
                                                    return false;
                                                }

                                                if (document.ChangePasswordForm.newpassword.value === "")
                                                {
                                                    alert('Please input Password');
                                                    document.ChangePasswordForm.newpassword.focus();
                                                    return false;
                                                }

                                                if (document.ChangePasswordForm.conpassword.value === "")
                                                {
                                                    alert('Please input Confirm Password');
                                                    document.ChangePasswordForm.conpassword.focus();
                                                    return false;
                                                }

                                                if (document.ChangePasswordForm.newpassword.value !== document.ChangePasswordForm.conpassword.value)
                                                {
                                                    alert('Confirm Password Not Match');
                                                    document.ChangePasswordForm.conpassword.focus();
                                                    return false;
                                                }

                                                document.ChangePasswordForm.submit();
                                            }
                                        </script>
                                        <div class="container forget-password">
                                            <div class="row">
                                                <div class="col-md-12 col-md-offset-4">
                                                    <div class="panel panel-default" style="padding: 200px;
                                                         margin-top: -200px;">
                                                        <div class="panel-body">
                                                            <div class="text-center">
                                                                <img src="https://i.ibb.co/rshckyB/car-key.png" style="width:40%; margin-bottom:20%;"alt="car-key" border="0">
                                                                <%if (request.getAttribute("status") != null) {
                                                                        if (request.getAttribute("status").equals(true)) {
                                                                %>
                                                                <p style="color: #7fc142;">New Password Updated Successfully!</p>
                                                                <%      } else { %>
                                                                <p style="color:red;">Current Password is Incorrect!</p>
                                                                <%      }
                                        } else {%>

                                                                <%}%>
                                                                <p>You can reset your password here.</p>
                                                                <form name="ChangePasswordForm" method="post" action="updatePassword" OnSubmit="return fncSubmit();" class="form">
                                                                    <input type="hidden" name="type" value="<%=session.getAttribute("type")%>">
                                                                    <input type="hidden" name="name" value="<%=session.getAttribute("user")%>">

                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <table>
                                                                                <tr><td>Current Password</td></tr>
                                                                                <tr><td><input name="OldPassword" type="password" id="OLDpwd" size="31"></td></tr>
                                                                            </table>


                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <table>
                                                                                <tr><td>New Password</td></tr>
                                                                                <tr><td><input name="newpassword" type="password" id="newpassword" size="31"></td></tr>
                                                                            </table>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="input-group"> 
                                                                            <table>
                                                                                <tr><td>Confirm Password</td></tr>
                                                                                <tr><td><input name="conpassword" type="password" id="conpassword" size="31"></td></tr>
                                                                            </table>
                                                                        </div>
                                                                    </div>

                                                                    <br>
                                                                    <div class="form-group">
                                                                        <input type="submit" name="Submit" value="Save" class="btn btn-lg btn-primary btn-block btnForget">
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
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
