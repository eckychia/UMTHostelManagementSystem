<%-- 
    Document   : studHostelApplication
    Created on : 6 Jun 2023, 11:03:21 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UMT Hostel Management System</title>
        <style>


            h1 {
                background-color: #461B7E;
                height: 80px;
                background: cover;
                padding: 20px;
                text-align: center;
                color: white;
            }

            .column {
                float: left;
                padding: 10px;
                height: 1000px;
            }

            .left1, .right1 {
                width: 20.5%;
                background-color: lightgrey;
            }

            .middle {
                width: 55%;
                background-image: url("umtlogo.jpg");
                background-position: center;
                background-repeat: no-repeat;
                background-size: 700px 600px;
            }

            .image{
                width: 100%;
                vertical-align: middle;
            }

            .row {
                text-align: left;
                position: relative;
                font-family: Arial, sans-serif;
                font-size: 19px;
            }

            .container1 {
                text-align: center;
            }

            .submit {
                text-align: center;
                font-size: 20px;
            }

            .btn {
                color:white;
                font-size: 14px;
                background-color:#7fc142;
                border: 8px solid #7fc142;
                border-radius: 4px;
            }

            .btn:hover {
                background-color: lightgrey;
            }


        </style>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hostel Room Application</title>
        <!-- font awesome cdn link-->
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="s2.css">
    </head>
    <body>
        <header class="header">
            <!-- As a heading -->
            <div class="hero" style="background:white;">
                <nav class="navbar1">
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
                                    <h3>Student&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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




                <!--end header-->

                </head>
                <form action="insertHostelApplication" method="POST">
                    <input type="hidden" name="studID" value="<%=session.getAttribute("user")%>">
                    <h1>HOSTEL APPLICATION FORM</h1>
                    <br><br>
                    <div class="row">
                        <div class="column left1" style="background-color:white;">
                        </div>
                    </div>

                    <div class="column middle"">
                        <h2 style="text-align:center"> Hostel Application For Academic Session 2023/2024</h2><br><br>
                        <h2>Rules/ Regulation</h2>
                        <p>1. Please be informed that the hostel application for <b>2023/2024 session</b> will be open by <b>1 July to 18 June 2023 only</b>.</p>
                        <p>2. The application can be done through online UMT Hostel Management System application page. Manual application will be not accepted.</p>
                        <p>3. The hostel application is based on <b>MYSTAR MERITS</b> connected starting from <b>OCTOBER 2022 to JULY 2023</b>.</p>
                        <p>4. Students need to ensure that merit is including the involvement of all Residential College programmes.</p>
                        <p>5. Student needs to choose the channel current status selection: </p>
                        <br>
                        <form action="hostelApplicationServlet" method="post" encrype="multipart/form-data">
                            <label class="container1">Condition
                                <select name="condition" id="condition" class="form-control" required="required">
                                    <option value="Common Student">Common Student</option>
                                    <option value="Health Problem">Health Problem</option>
                                    <option value="Student of Uniformed Bodies">Student of Uniformed Bodies</option>

                                </select>
                            </label>


                            <br>
                            <br>
                            <p>6. Students with <b>HEALTH PROBLEMS</b> need to show supporting documents as evidence of confirmation upon receiving room key.
                                Only documents from <b> PUBLIC HOSPITAL / SPECIALIST HOSPITAL </b> are accepted.</p>

                            <p>7. Students of <b>UNIFORMED BODIES </b>need to upload their <b>MEMBERSHIP CARD</b>.</p>
                            <p>8. Students are advised to print a copy of the application form for reference.</p>
                            <p>9. The successful applicant will be granted permission to apply for a room.</p>
                            <p>10. Please to inform that announcement for admission date to apply for room is subject to the <b>UMTKK approval</b>.</p>
                            <p>11. Any inquiries, please contact a <b>Fellow or Residential College Administration</b> at <b>09-622 2084</b>.</p>
                            <br>
                            <p>      Thank you.</p>
                            <br>
                            <input class="form-control" type="checkbox" name="requirement" required="required" >I have read and understand the above terms and conditions.

                            <br><br>


                            <button type="submit" class="btn">Submit</button>
                        </form>
                        </header>
                    </div>
                    <div class="column right1" style="background-color:white;">
                    </div> 
                    </body>


                    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

                    <script>
                            let subMenu = document.getElementById("subMenu");
                            function toggleMenu() {
                                subMenu.classList.toggle("open-menu");
                            }
                    </script>

                             </html>