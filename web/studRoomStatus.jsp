<%-- 
    Document   : studRoomStatus
    Created on : 17 Jun 2023, 3:07:09 PM
    Author     : wongh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                font-size: 15px;
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

            .button{
                color:white;
                font-size: 14px;
                background-color:#7fc142;
                border: 8px solid #7fc142;
                border-radius: 4px;
                text-align:center;
                margin-left:750px;

            }
            .button1{
                color:white;
                font-size: 14px;
                background-color:#7fc142;
                border: 8px solid #7fc142;
                border-radius: 4px;
                text-align:center;

                padding-right:5px;
                padding-left:5px;
            }
            
           


            @media print{
                /* Hide evvery other element*/
                body * {
                    visibility:hidden;
                }

                /* Then displaying print container elements */
                .print-container, .print-container * {
                    visibility: visible;
                }


            </style>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE-edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
          
            <!-- font awesome cdn link-->
            <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
            <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
            <link rel="stylesheet" href="s2.css">
            <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        </head>
        <body>
            <%if (request.getAttribute("roomApplication") != null) {
                session.setAttribute("roomApplication", request.getAttribute("roomApplication"));
            }%>
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

                    <div class="print-container container" style="background-color:white;">
                        <h1>ROOM APPLICATION FOR ACADEMIC SESSION 2023/2024 </h1>
                    </div>

                    <div class="row">
                        <div class="column left1" style="background-color:white;"> 
                        </div>
                        <div class="print-container" style="background-color:white;
                             width:1300px;">
                            <div class="colum middle" style="background-color:white;
                                 width:1300px;">
                                <h2 style=" background-color:white;
                                    color:black;
                                    text-align:left;"><br>Registration Slip and Self-Report at UMT Campus:</h2>
                                <br><br><br>
                                <input type="hidden" name="status" id="status" value="<c:out value="${status.status}" />">
                                <table>
                                    
                                    <tr>
                                        <td>Student ID</td>
                                        <td>: <b><%=request.getParameter("studID")%></b></td>
                                    </tr>
                                    <tr>
                                        <td>Name</td>
                                        <td>: <b><c:out value="${status.name}" /></b></td>
                                    </tr>
                                    <tr>
                                        <td>IC</td>
                                        <td>: <b><c:out value="${status.icno}" /></b></td>
                                    </tr>
                                    <tr>
                                        <td>Course</td>
                                        <td>: <b><c:out value="${status.course}" /></b></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td>: <b><c:out value="${status.email}" /></b></td>
                                    </tr>
                                    <tr>
                                        <td>HP No</td>
                                        <td>: <b><c:out value="${status.hpno}" /></b></td>
                                    </tr>
                                </table>

                                <br><br><br>
                                <p>The steps self-report at the UMT Hostel Campus are as below:</p>
                                <br><br>
                                <p>1.<b> Self Report Registration</b></p><br>
                                
                                <p> Start Staying Date: <b><c:out value="${applicationn.getStartDate()}" /></b> <br>
                                <p> End Staying Date: <b><c:out value="${applicationn.getEndDate()}" /></b>
                                <br><br>
                                <p>2.<b> Residential College Placement Information:</b><p><br><br><br>
                                
                                <table style=" border: 1px solid; border-collapse: collapse; padding:8px;">
                                    <tr>
                                    <th style="width:18%; border: 1px solid; border-collapse: collapse; padding:6px; text-align: center;">BLOCK</th>
                                    <th style="width:15%; border: 1px solid; border-collapse: collapse; padding:6px; text-align: center;">LEVEL</th>
                                    <th style="width:20%; border: 1px solid; border-collapse: collapse; padding:6px; text-align: center;">ROOM TYPE</th>
                                    <th style="width:18%; border: 1px solid; border-collapse: collapse; padding:6px; text-align: center;">ROOM NO.</th>
                                    <th style="width:18%; border: 1px solid; border-collapse: collapse; padding:6px; text-align: center;">REQUEST</th>
                                    </tr>
                                    
                                         <tr>
                                        <td style="width:18%; border: 1px solid; border-collapse: collapse; padding:6px; text-align: center;"> <b><c:out value="${applicationn.getBlock()}" /></b></td>
                                        <td style="width:15%; border: 1px solid; border-collapse: collapse; padding:6px; text-align: center;"><b><c:out value="${applicationn.getBlockLevel()}" /></b></td>
                                        <td style="width:20%; border: 1px solid; border-collapse: collapse; padding:6px; text-align: center;"><b><c:out value="${applicationn.getRoomType()}" /></b></td>
                                        <td style="width:18%; border: 1px solid; border-collapse: collapse; padding:6px; text-align: center;"><b><c:out value="${applicationn.getRoomNo()}" /></b></td>
                                        <td style="width:18%; border: 1px solid; border-collapse: collapse; padding:6px; text-align: center;"><b><c:out value="${applicationn.getStuRequire()}" /></b></td>
                                     
                                </table>

                                <br><br><br>
                                <p>3. <b>Done Registration.</b></p><br>
                                <p>4.<b> Student are advised to print out the copy of the offer letter for future reference.</b></p><br>
                               

                            </div>
                        </div>
                    </div>
                        <button style="font-size:16px;" onclick="window.print();">Print</button>

                        </body>
                       <!--<input class="button" type="button" value="Accept" onclick="msg()">-->
                        
                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

                        <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
                        <script src="script.js"></script>
                        <script>
                            let subMenu = document.getElementById("subMenu");
                            function toggleMenu() {
                                subMenu.classList.toggle("open-menu");
                            }
                        </script>

                                 </html>