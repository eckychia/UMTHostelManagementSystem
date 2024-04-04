<%-- 
    Document   : studProfile
    Created on : 13 Jun 2023, 4:50:42 PM
    Author     : wongh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
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
            td {
                height: 50px;
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <header class="header">
            <!-- As a heading -->

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



            <!--end header--> 

            <br><br><br>
            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        <h2>Personal Details</h2><hr>

                        <table>
                            <tr>
                                <td>Student ID</td>
                                <td>: <c:out value='${student.studid}' /></td>
                            </tr>
                            <tr>
                                <td>Student Name</td>
                                <td>: <c:out value='${student.name}' /></td>
                            </tr>
                            <tr>
                                <td>Student IC No</td>
                                <td>: <c:out value='${student.icno}' /></td>
                            </tr>
                            <tr>
                                <td>Course</td>
                                <td>: <c:out value='${student.course}' /></td>
                            </tr>
                            <tr>
                                <td>Student Email</td>
                                <td>: <c:out value='${student.email}' /></td>
                            </tr>
                            <tr>
                                <td>Student HP No</td>
                                <td>: <c:out value='${student.hpno}' /></td>
                            </tr>
                        </table>
                        <br>
                        <fieldset class="form-group">
                            <a href="updatePasswordForm.jsp">Change Password?</a>
                        </fieldset>

                        <a href="showStudentEditProfileForm?studID=<%=session.getAttribute("user")%>"><button class="btn btn-success">Edit Profile</button></a>
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
