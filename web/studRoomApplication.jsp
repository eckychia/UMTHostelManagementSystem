<%-- 
    Document   : studApplicationPage
    Created on : 6 Jun 2023, 11:01:26 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" type="text/css" href="room.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>UMT Hostel Management System</title>
        <!-- font awesome cdn link-->
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="s2.css">

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <style>
            h1 {
                background-color: #461B7E;
                height: 80px;
                background: cover;
                padding: 20px;
                text-align: center;
                color: white;
            }
        </style>
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
                                        <%if (session.getAttribute("roomApplication").equals(0)) { %>
                                    <li><a href="studRoomApplication.jsp">APPLY ROOM</a></li>  
                                        <%} else {%>
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

                <h1>ROOM APPLICATION FORM</h1>

                <div class="wrapper">
                    <div class="header">
                        <ul>
                            <li class="active form_1_progessbar">
                                <div>
                                    <p>1</p>
                                </div>
                            </li>
                            <li class="form_2_progessbar">
                                <div>
                                    <p>2</p>
                                </div>
                            </li>
                            <li class="form_3_progessbar">
                                <div>
                                    <p>3</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="form_wrap">
                        <div class="form_1 data_info">
                            <h2>Room Application Info</h2>
                            <form action="insertApplication" method="post">
                                <input type="hidden" name="user" id="user" value="<%=session.getAttribute("type")%>">
                                <input type="hidden" name="studID" value="<%=session.getAttribute("user")%>">
                                <div class="form_container">
                                    <div class="input_wrap">
                                        <label for="startDate">Start Date</label>
                                        <input type="date" name="startDate" value="<c:out value='${application.getStartDate()}' />"
                                               class="input"id="startDate" required="required">
                                    </div>
                                    <div class="input_wrap">
                                        <label for="endDate">End Date</label>
                                        <input type="date" name="endDate" class="input" id="endDate" value="<c:out value='${application.getEndDate()}' />"
                                               required="required">
                                    </div>
                                    <div class="input_wrap">
                                        <label for="blockChosen">Block Chosen</label>
                                        <select name="block" id="block" class="input" onchange="populate(this.id, 'blockLevel'), populate2(this.id, 'roomType'), populate3(this.id, 'roomNo')"  value="<c:out value='${application.getBlock()}' />"
                                                required="required">
                                            <option value="Choose Block">Choose Block</option> 
                                            <option value="Ibnu Sina">Ibnu Sina(B1)</option>
                                            <option value="Ibnu Hibban">Ibnu Hibban(B2)</option>
                                            <option value="Ibnu Majah">Ibnu Majah(IM)</option>
                                            <option value="Ibnu Abbas">Ibnu Abbas(IA)</option>
                                            <option value="Ibnu Jarir">Ibnu Jarir(IJ)</option>
                                            <option value="An-Nasai">An-Nasai(ANN)</option>
                                            <option value="At-Thabrani">At-Thabrani(ATB)</option>
                                            <option value="At-Tarmidzi">At-Tarmidzi(ATT)</option>
                                        </select>
                                    </div>
                                </div>
                                <!--</form>-->
                        </div>
                        <div class="form_2 data_info" style="display: none;">
                            <h2>Block Details</h2>
                            <!--<form action="insertApplication" method="post">-->
                            <div class="form_container">
                                <div class="input_wrap">
                                    <label for="blockLevel">Block Level
                                        <span style="color: red">*</span></label><p> All block have 4 level except (B1 & B2 have 5 level)</p>
                                    <select name="blockLevel" id="blockLevel" class="input"  onchange="populate3(this.id, 'roomNo')" value="<c:out value='${application.getBlockLevel()}' />"
                                            required="required">

                                    </select>
                                </div>
                                <div class="input_wrap">
                                    <label for="roomType">Room Type</label>
                                    <select name="roomType" id="roomType" class="input" onchange="populate3(this.id, 'roomNo')" value="<c:out value='${application.getRoomType()}' />"
                                            required="required">  
                                    </select>
                                </div>

                            </div>
                            <!--</form>-->
                        </div>
                        <div class="form_3 data_info" style="display: none;">
                            <h2>Room Details</h2>
                            <!--<form action="insertApplication" method="post">-->
                            <div class="form_container">
                                <div class="input_wrap">
                                    <label for="roomNo">Room No.</label>
                                    <select name="roomNo" id="roomNo" class="input" value="<c:out value='${application.getRoomNo()}' />"
                                            required="required">    
                                    </select>

                                </div>
                                <div class="input_wrap">
                                    <label for="stuRequire">Request:</label>
                                    <input type="text" name="stuRequire" class="input" id="stuRequire" size="200" placeholder="For specialize student to put request."  value="<c:out value='${room.getRequest()}' />"
                                           required="required">
                                </div>

                            </div>
                            <!--</form>-->
                        </div>
                    </div>
                    <div class="btns_wrap">
                        <div class="common_btns form_1_btns">
                            <button type="button" class="btn_next">Next <span class="icon"><ion-icon name="arrow-forward-sharp"></ion-icon></span></button>
                        </div>
                        <div class="common_btns form_2_btns" style="display: none;">
                            <button type="button" class="btn_back"><span class="icon"><ion-icon name="arrow-back-sharp"></ion-icon></span>Back</button>
                            <button type="button" class="btn_next">Next <span class="icon"><ion-icon name="arrow-forward-sharp"></ion-icon></span></button>
                        </div>
                        <div class="common_btns form_3_btns" style="display: none;">
                            <button type="button" class="btn_back"><span class="icon"><ion-icon name="arrow-back-sharp"></ion-icon></span>Back</button>
                            <button type="button" class="btn_done">Submit</button>

                            <div class="modal_wrapper">
                                <div class="shadow"></div>
                                <div class="success_wrap">
                                    <span class="modal_icon"><ion-icon name="checkmark-sharp"></ion-icon></span>
                                    <p>You have successfully completed the application.</p>
                                    <input type="submit" class="btn1" value="Review">
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>



                <script type="text/javascript" src="script.js"></script>
                <script type="text/javascript" src="room.js"></script>
                <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
                <script src="script.js"></script>
                <script>
                                        let subMenu = document.getElementById("subMenu");
                                        function toggleMenu() {
                                            subMenu.classList.toggle("open-menu");
                                        }
                </script>

                <script>
                    function populate(s1, s2)
                    {
                        var s1 = document.getElementById("block");
                        var s2 = document.getElementById('blockLevel');
                        switch (s1.value) {
                            case "Ibnu Sina":
                                var optionArray = ['1|1', '2|2', '3|3', '4|4', '5|5'];
                                break;
                            case "Ibnu Hibban":
                                var optionArray = ['1|1', '2|2', '3|3', '4|4', '5|5'];
                                break;
                            case "Ibnu Majah":
                                var optionArray = ['1|1', '2|2', '3|3', '4|4'];
                                break;
                            case "Ibnu Abbas":
                                var optionArray = ['1|1', '2|2', '3|3', '4|4'];
                                break;
                            case "Ibnu Jarir":
                                var optionArray = ['1|1', '2|2', '3|3', '4|4'];
                                break;
                            case "An-Nasai":
                                var optionArray = ['1|1', '2|2', '3|3', '4|4'];
                                break;
                            case "At-Thabrani":
                                var optionArray = ['1|1', '2|2', '3|3', '4|4'];
                                break;
                            case "At-Tarmidzi":
                                var optionArray = ['1|1', '2|2', '3|3', '4|4'];
                                break;
                        }


                        for (var option in optionArray) {
                            var pair = optionArray[option].split("|");
                            var newoption = document.createElement("option");

                            newoption.value = pair[0];
                            newoption.innerHTML = pair[1];
                            s2.options.add(newoption);
                        }

                    }

                    function populate2(s1, s2, s3)
                    {
                        var s1 = document.getElementById("block");
                        var s2 = document.getElementById('blockLevel');
                        var s3 = document.getElementById('roomType');

                        s2.innerHTML = "";
                        if (s1.value === "Ibnu Sina" || s1.value === "Ibnu Hibban") {
                            var optionArray = ['1|1', '2|2', '3|3', '4|4', '5|5'];

                        } else if (s1.value === "Ibnu Majah" || s1.value === "Ibnu Abbas" || s1.value === "Ibnu Jarir" || s1.value === "An-Nasai" || s1.value === "At-Thabrani" || s1.value === "At-Tarmidzi") {
                            var optionArray = ['1|1', '2|2', '3|3', '4|4'];

                        }

                        for (var option in optionArray) {
                            var pair = optionArray[option].split("|");
                            var newoption = document.createElement("option");

                            newoption.value = pair[0];
                            newoption.innerHTML = pair[1];
                            s2.options.add(newoption);
                        }

                        s3.innerHTML = "";
                        if (s1.value === "Ibnu Sina" || s1.value === "Ibnu Hibban") {
                            var optionArray = ['Double Room|Double Room', 'Triple Room|Triple Room'];

                        } else if (s1.value === "Ibnu Majah" || s1.value === "Ibnu Abbas" || s1.value === "Ibnu Jarir" || s1.value === "An-Nasai" || s1.value === "At-Thabrani" || s1.value === "At-Tarmidzi") {
                            var optionArray = ['Quadruple Room|Quadruple Room'];

                        }

                        for (var option in optionArray) {
                            var pair = optionArray[option].split("|");
                            var newoption = document.createElement("option");

                            newoption.value = pair[0];
                            newoption.innerHTML = pair[1];
                            s3.options.add(newoption);
                        }

                    }


                    function populate3(s1, s2, s3, s4)
                    {
                        var s1 = document.getElementById("block");
                        var s2 = document.getElementById('blockLevel');
                        var s3 = document.getElementById('roomType');
                        var s4 = document.getElementById('roomNo');

                        s4.innerHTML = "";
                        if (s1.value === "Ibnu Sina" && s2.value === "1" && s3.value === "Double Room") {
                            var optionArray = ['B1 101-1|B1 101-1', 'B1 101-3|B1 101-3', 'B1 101-5|B1 101-5', 'B1 102-1|B1 102-1', 'B1 102-3|B1 102-3', 'B1 102-5|B1 102-5', 'B1 103-1|B1 103-1', 'B1 103-3|B1 103-3', 'B1 103-5|B1 103-5', 'B1 104-1|B1 104-1', 'B1 104-3|B1 104-3', 'B1 104-5|B1 104-5'
                                        , 'B1 105-1|B1 105-1', 'B1 105-3|B1 105-3', 'B1 105-5|B1 105-5', 'B1 106-1|B1 106-1', 'B1 106-3|B1 106-3', 'B1 106-5|B1 106-5', 'B1 107-1|B1 107-1', 'B1 107-3|B1 107-3', 'B1 107-5|B1 107-5', 'B1 108-1|B1 108-1', 'B1 108-3|B1 108-3', 'B1 108-5|B1 108-5', 'B1 109-1|B1 109-1', 'B1 109-3|B1 109-3', 'B1 109-5|B1 109-5', 'B1 110-1|B1 110-1', 'B1 110-3|B1 110-3', 'B1 110-5|B1 110-5'];
                        } else if (s1.value === "Ibnu Sina" && s2.value === "2" && s3.value === "Double Room") {
                            var optionArray = ['B1 201-1|B1 201-1', 'B1 201-3|B1 201-3', 'B1 201-5|B1 201-5', 'B1 202-1|B1 202-1', 'B1 202-3|B1 202-3', 'B1 202-5|B1 202-5', 'B1 203-1|B1 203-1', 'B1 203-3|B1 203-3', 'B1 203-5|B1 203-5', 'B1 204-1|B1 204-1', 'B1 204-3|B1 204-3', 'B1 204-5|B1 204-5'
                                        , 'B1 205-1|B1 205-1', 'B1 205-3|B1 205-3', 'B1 205-5|B1 205-5', 'B1 206-1|B1 206-1', 'B1 206-3|B1 206-3', 'B1 206-5|B1 206-5', 'B1 207-1|B1 207-1', 'B1 207-3|B1 207-3', 'B1 207-5|B1 207-5', 'B1 208-1|B1 208-1', 'B1 208-3|B1 208-3', 'B1 208-5|B1 208-5', 'B1 209-1|B1 209-1', 'B1 209-3|B1 209-3', 'B1 209-5|B1 209-5', 'B1 210-1|B1 210-1', 'B1 210-3|B1 210-3', 'B1 210-5|B1 210-5'];
                        } else if (s1.value === "Ibnu Sina" && s2.value === "3" && s3.value === "Double Room") {
                            var optionArray = ['B1 301-1|B1 301-1', 'B1 301-3|B1 301-3', 'B1 301-5|B1 301-5', 'B1 302-1|B1 302-1', 'B1 302-3|B1 302-3', 'B1 302-5|B1 302-5', 'B1 303-1|B1 303-1', 'B1 303-3|B1 303-3', 'B1 303-5|B1 303-5', 'B1 304-1|B1 304-1', 'B1 304-3|B1 304-3', 'B1 304-5|B1 304-5'
                                        , 'B1 305-1|B1 305-1', 'B1 305-3|B1 305-3', 'B1 305-5|B1 305-5', 'B1 306-1|B1 306-1', 'B1 306-3|B1 306-3', 'B1 306-5|B1 306-5', 'B1 307-1|B1 307-1', 'B1 307-3|B1 307-3', 'B1 307-5|B1 307-5', 'B1 308-1|B1 308-1', 'B1 308-3|B1 308-3', 'B1 308-5|B1 308-5', 'B1 309-1|B1 309-1', 'B1 309-3|B1 309-3', 'B1 309-5|B1 309-5', 'B1 310-1|B1 310-1', 'B1 310-3|B1 310-3', 'B1 310-5|B1 310-5'];
                        } else if (s1.value === "Ibnu Sina" && s2.value === "4" && s3.value === "Double Room") {
                            var optionArray = ['B1 401-1|B1 401-1', 'B1 401-3|B1 401-3', 'B1 401-5|B1 401-5', 'B1 402-1|B1 402-1', 'B1 402-3|B1 402-3', 'B1 402-5|B1 402-5', 'B1 403-1|B1 403-1', 'B1 403-3|B1 403-3', 'B1 403-5|B1 403-5', 'B1 404-1|B1 404-1', 'B1 404-3|B1 404-3', 'B1 404-5|B1 404-5'
                                        , 'B1 405-1|B1 405-1', 'B1 405-3|B1 405-3', 'B1 405-5|B1 405-5', 'B1 406-1|B1 406-1', 'B1 406-3|B1 406-3', 'B1 406-5|B1 406-5', 'B1 407-1|B1 407-1', 'B1 407-3|B1 407-3', 'B1 407-5|B1 407-5', 'B1 408-1|B1 408-1', 'B1 408-3|B1 408-3', 'B1 408-5|B1 408-5', 'B1 409-1|B1 409-1', 'B1 409-3|B1 409-3', 'B1 409-5|B1 409-5', 'B1 410-1|B1 410-1', 'B1 410-3|B1 410-3', 'B1 410-5|B1 410-5'];
                        } else if (s1.value === "Ibnu Sina" && s2.value === "5" && s3.value === "Double Room") {
                            var optionArray = ['B1 501-1|B1 501-1', 'B1 501-3|B1 501-3', 'B1 501-5|B1 501-5', 'B1 502-1|B1 502-1', 'B1 502-3|B1 502-3', 'B1 502-5|B1 502-5', 'B1 503-1|B1 503-1', 'B1 503-3|B1 503-3', 'B1 503-5|B1 503-5', 'B1 504-1|B1 504-1', 'B1 504-3|B1 504-3', 'B1 504-5|B1 504-5'
                                        , 'B1 505-1|B1 505-1', 'B1 505-3|B1 505-3', 'B1 505-5|B1 505-5', 'B1 506-1|B1 506-1', 'B1 506-3|B1 506-3', 'B1 506-5|B1 506-5', 'B1 507-1|B1 507-1', 'B1 507-3|B1 507-3', 'B1 507-5|B1 507-5', 'B1 508-1|B1 508-1', 'B1 508-3|B1 508-3', 'B1 508-5|B1 508-5', 'B1 509-1|B1 509-1', 'B1 509-3|B1 509-3', 'B1 509-5|B1 509-5', 'B1 510-1|B1 510-1', 'B1 510-3|B1 510-3', 'B1 510-5|B1 510-5'];
                        } else if (s1.value === "Ibnu Sina" && s2.value === "1" && s3.value === "Triple Room") {
                            var optionArray = ['B1 101-2|B1 101-2', 'B1 101-4|B1 101-4', 'B1 102-2|B1 102-2', 'B1 102-4|B1 102-4', 'B1 103-2|B1 103-2', 'B1 103-4|B1 103-4', 'B1 104-2|B1 104-2', 'B1 104-4|B1 104-4'
                                        , 'B1 105-2|B1 105-2', 'B1 105-4|B1 105-4', 'B1 106-2|B1 106-2', 'B1 106-4|B1 106-4', 'B1 107-2|B1 107-2', 'B1 107-4|B1 107-4', 'B1 108-2|B1 108-2', 'B1 108-4|B1 108-4', 'B1 109-2|B1 109-2', 'B1 109-4|B1 109-4', 'B1 110-2|B1 110-2', 'B1 110-4|B1 110-4'];
                        } else if (s1.value === "Ibnu Sina" && s2.value === "2" && s3.value === "Triple Room") {
                            var optionArray = ['B1 201-2|B1 201-2', 'B1 201-4|B1 201-4', 'B1 202-2|B1 202-2', 'B1 202-4|B1 202-4', 'B1 203-2|B1 203-2', 'B1 203-4|B1 203-4', 'B1 204-2|B1 204-2', 'B1 204-4|B1 204-4'
                                        , 'B1 205-2|B1 205-2', 'B1 205-4|B1 205-4', 'B1 206-2|B1 206-2', 'B1 206-4|B1 206-4', 'B1 207-2|B1 207-2', 'B1 207-4|B1 207-4', 'B1 208-2|B1 208-2', 'B1 208-4|B1 208-4', 'B1 209-2|B1 209-2', 'B1 209-4|B1 209-4', 'B1 210-2|B1 210-2', 'B1 210-4|B1 210-4'];
                        } else if (s1.value === "Ibnu Sina" && s2.value === "3" && s3.value === "Triple Room") {
                            var optionArray = ['B1 301-2|B1 301-2', 'B1 301-4|B1 301-4', 'B1 302-2|B1 302-2', 'B1 302-4|B1 302-4', 'B1 303-2|B1 303-2', 'B1 303-4|B1 303-4', 'B1 304-2|B1 304-2', 'B1 304-4|B1 304-4'
                                        , 'B1 305-2|B1 305-2', 'B1 305-4|B1 305-4', 'B1 306-2|B1 306-2', 'B1 306-4|B1 306-4', 'B1 307-2|B1 307-2', 'B1 307-4|B1 307-4', 'B1 308-2|B1 308-2', 'B1 308-4|B1 308-4', 'B1 309-2|B1 309-2', 'B1 309-4|B1 309-4', 'B1 310-2|B1 310-2', 'B1 310-4|B1 310-4'];
                        } else if (s1.value === "Ibnu Sina" && s2.value === "4" && s3.value === "Triple Room") {
                            var optionArray = ['B1 401-2|B1 401-2', 'B1 401-4|B1 401-4', 'B1 402-2|B1 402-2', 'B1 402-4|B1 402-4', 'B1 403-2|B1 403-2', 'B1 403-4|B1 403-4', 'B1 404-2|B1 404-2', 'B1 404-4|B1 404-4'
                                        , 'B1 405-2|B1 405-2', 'B1 405-4|B1 405-4', 'B1 406-2|B1 406-2', 'B1 406-4|B1 406-4', 'B1 407-2|B1 407-2', 'B1 407-4|B1 407-4', 'B1 408-2|B1 408-2', 'B1 408-4|B1 408-4', 'B1 409-2|B1 409-2', 'B1 409-4|B1 409-4', 'B1 410-2|B1 410-2', 'B1 410-4|B1 410-4'];
                        } else if (s1.value === "Ibnu Sina" && s2.value === "5" && s3.value === "Triple Room") {
                            var optionArray = ['B1 501-2|B1 501-2', 'B1 501-4|B1 501-4', 'B1 502-2|B1 502-2', 'B1 502-4|B1 502-4', 'B1 503-2|B1 503-2', 'B1 503-4|B1 503-4', 'B1 504-2|B1 504-2', 'B1 504-4|B1 504-4'
                                        , 'B1 505-2|B1 505-2', 'B1 505-4|B1 505-4', 'B1 506-2|B1 506-2', 'B1 506-4|B1 506-4', 'B1 507-2|B1 507-2', 'B1 507-4|B1 507-4', 'B1 508-2|B1 508-2', 'B1 508-4|B1 508-4', 'B1 509-2|B1 509-2', 'B1 509-4|B1 509-4', 'B1 510-2|B1 510-2', 'B1 510-4|B1 510-4'];
                        } else if (s1.value === "Ibnu Hibban" && s2.value === "1" && s3.value === "Double Room") {
                            var optionArray = ['B2 101-1|B2 101-1', 'B2 101-3|B2 101-3', 'B2 101-5|B2 101-5', 'B2 102-1|B2 102-1', 'B2 102-3|B2 102-3', 'B2 102-5|B2 102-5', 'B2 103-1|B2 103-1', 'B2 103-3|B2 103-3', 'B2 103-5|B2 103-5', 'B2 104-1|B2 104-1', 'B2 104-3|B2 104-3', 'B2 104-5|B2 104-5'
                                        , 'B2 105-1|B2 105-1', 'B2 105-3|B2 105-3', 'B2 105-5|B2 105-5', 'B2 106-1|B2 106-1', 'B2 106-3|B2 106-3', 'B2 106-5|B2 106-5', 'B2 107-1|B2 107-1', 'B2 107-3|B2 107-3', 'B2 107-5|B2 107-5', 'B2 108-1|B2 108-1', 'B2 108-3|B2 108-3', 'B2 108-5|B2 108-5', 'B2 109-1|B2 109-1', 'B2 109-3|B2 109-3', 'B2 109-5|B2 109-5', 'B2 110-1|B2 110-1', 'B2 110-3|B2 110-3', 'B2 110-5|B2 110-5'];

                        } else if (s1.value === "Ibnu Hibban" && s2.value === "2" && s3.value === "Double Room") {
                            var optionArray = ['B2 201-1|B2 201-1', 'B2 201-3|B2 201-3', 'B2 201-5|B2 201-5', 'B2 202-1|B2 202-1', 'B2 202-3|B2 202-3', 'B2 202-5|B2 202-5', 'B2 203-1|B2 203-1', 'B2 203-3|B2 203-3', 'B2 203-5|B2 203-5', 'B2 204-1|B2 204-1', 'B2 204-3|B2 204-3', 'B2 204-5|B2 204-5'
                                        , 'B2 205-1|B2 205-1', 'B2 205-3|B2 205-3', 'B2 205-5|B2 205-5', 'B2 206-1|B2 206-1', 'B2 206-3|B2 206-3', 'B2 206-5|B2 206-5', 'B2 207-1|B2 207-1', 'B2 207-3|B2 207-3', 'B2 207-5|B2 207-5', 'B2 208-1|B2 208-1', 'B2 208-3|B2 208-3', 'B2 208-5|B2 208-5', 'B2 209-1|B2 209-1', 'B2 209-3|B2 209-3', 'B2 209-5|B2 209-5', 'B2 210-1|B2 210-1', 'B2 210-3|B2 210-3', 'B2 210-5|B2 210-5'];
                        } else if (s1.value === "Ibnu Hibban" && s2.value === "3" && s3.value === "Double Room") {
                            var optionArray = ['B2 301-1|B2 301-1', 'B2 301-3|B2 301-3', 'B2 301-5|B2 301-5', 'B2 302-1|B2 302-1', 'B2 302-3|B2 302-3', 'B2 302-5|B2 302-5', 'B2 303-1|B2 303-1', 'B2 303-3|B2 303-3', 'B2 303-5|B2 303-5', 'B2 304-1|B2 304-1', 'B2 304-3|B2 304-3', 'B2 304-5|B2 304-5'
                                        , 'B2 305-1|B2 305-1', 'B2 305-3|B2 305-3', 'B2 305-5|B2 305-5', 'B2 306-1|B2 306-1', 'B2 306-3|B2 306-3', 'B2 306-5|B2 306-5', 'B2 307-1|B2 307-1', 'B2 307-3|B2 307-3', 'B2 307-5|B2 307-5', 'B2 308-1|B2 308-1', 'B2 308-3|B2 308-3', 'B2 308-5|B2 308-5', 'B2 309-1|B2 309-1', 'B2 309-3|B2 309-3', 'B2 309-5|B2 309-5', 'B2 310-1|B2 310-1', 'B2 310-3|B2 310-3', 'B2 310-5|B2 310-5'];
                        } else if (s1.value === "Ibnu Hibban" && s2.value === "4" && s3.value === "Double Room") {
                            var optionArray = ['B2 401-1|B2 401-1', 'B2 401-3|B2 401-3', 'B2 401-5|B2 401-5', 'B2 402-1|B2 402-1', 'B2 402-3|B1 402-3', 'B2 402-5|B2 402-5', 'B2 403-1|B2 403-1', 'B2 403-3|B2 403-3', 'B2 403-5|B2 403-5', 'B2 404-1|B2 404-1', 'B2 404-3|B2 404-3', 'B2 404-5|B2 404-5'
                                        , 'B2 405-1|B2 405-1', 'B2 405-3|B2 405-3', 'B2 405-5|B2 405-5', 'B2 406-1|B2 406-1', 'B2 406-3|B1 406-3', 'B2 406-5|B2 406-5', 'B2 407-1|B2 407-1', 'B2 407-3|B2 407-3', 'B2 407-5|B2 407-5', 'B2 408-1|B2 408-1', 'B2 408-3|B2 408-3', 'B2 408-5|B2 408-5', 'B2 409-1|B2 409-1', 'B2 409-3|B2 409-3', 'B2 409-5|B2 409-5', 'B2 410-1|B2 410-1', 'B2 410-3|B2 410-3', 'B2 410-5|B2 410-5'];
                        } else if (s1.value === "Ibnu Hibban" && s2.value === "5" && s3.value === "Double Room") {
                            var optionArray = ['B2 501-1|B2 501-1', 'B2 501-3|B2 501-3', 'B2 501-5|B2 501-5', 'B2 502-1|B2 502-1', 'B2 502-3|B2 502-3', 'B2 502-5|B2 502-5', 'B2 503-1|B2 503-1', 'B2 503-3|B2 503-3', 'B2 503-5|B2 503-5', 'B2 504-1|B2 504-1', 'B2 504-3|B2 504-3', 'B2 504-5|B2 504-5'
                                        , 'B2 505-1|B2 505-1', 'B2 505-3|B2 505-3', 'B2 505-5|B2 505-5', 'B2 506-1|B2 506-1', 'B2 506-3|B2 506-3', 'B2 506-5|B2 506-5', 'B2 507-1|B2 507-1', 'B2 507-3|B2 507-3', 'B2 507-5|B2 507-5', 'B2 508-1|B2 508-1', 'B2 508-3|B2 508-3', 'B2 508-5|B2 508-5', 'B2 509-1|B2 509-1', 'B2 509-3|B2 509-3', 'B2 509-5|B2 509-5', 'B2 510-1|B2 510-1', 'B2 510-3|B2 510-3', 'B2 510-5|B2 510-5'];

                        } else if (s1.value === "Ibnu Hibban" && s2.value === "1" && s3.value === "Triple Room") {
                            var optionArray = ['B2 101-2|B2 101-2', 'B2 101-4|B2 101-4', 'B2 102-2|B2 102-2', 'B2 102-4|B2 102-4', 'B2 103-2|B2 103-2', 'B2 103-4|B2 103-4', 'B2 104-2|B2 104-2', 'B2 104-4|B2 104-4'
                                        , 'B2 105-2|B2 105-2', 'B2 105-4|B2 105-4', 'B2 106-2|B2 106-2', 'B2 106-4|B2 106-4', 'B2 107-2|B2 107-2', 'B2 107-4|B2 107-4', 'B2 108-2|B2 108-2', 'B2 108-4|B2 108-4', 'B2 109-2|B2 109-2', 'B2 109-4|B2 109-4', 'B2 110-2|B2 110-2', 'B2 110-4|B2 110-4'];
                        } else if (s1.value === "Ibnu Hibban" && s2.value === "2" && s3.value === "Triple Room") {
                            var optionArray = ['B2 201-2|B2 201-2', 'B2 201-4|B2 201-4', 'B2 202-2|B2 202-2', 'B2 202-4|B2 202-4', 'B2 203-2|B2 203-2', 'B2 203-4|B2 203-4', 'B2 204-2|B2 204-2', 'B2 204-4|B2 204-4'
                                        , 'B2 205-2|B2 205-2', 'B2 205-4|B2 205-4', 'B2 206-2|B2 206-2', 'B2 206-4|B2 206-4', 'B2 207-2|B2 207-2', 'B2 207-4|B2 207-4', 'B2 208-2|B2 208-2', 'B2 208-4|B2 208-4', 'B2 209-2|B2 209-2', 'B2 209-4|B2 209-4', 'B2 210-2|B2 210-2', 'B2 210-4|B2 210-4'];
                        } else if (s1.value === "Ibnu Hibban" && s2.value === "3" && s3.value === "Triple Room") {
                            var optionArray = ['B2 301-2|B2 301-2', 'B2 301-4|B2 301-4', 'B2 302-2|B2 302-2', 'B2 302-4|B2 302-4', 'B2 303-2|B2 303-2', 'B2 303-4|B2 303-4', 'B2 304-2|B2 304-2', 'B2 304-4|B2 304-4'
                                        , 'B2 305-2|B2 305-2', 'B2 305-4|B2 305-4', 'B2 306-2|B2 306-2', 'B2 306-4|B2 306-4', 'B2 307-2|B2 307-2', 'B2 307-4|B2 307-4', 'B2 308-2|B2 308-2', 'B2 308-4|B2 308-4', 'B2 309-2|B2 309-2', 'B2 309-4|B2 309-4', 'B2 310-2|B2 310-2', 'B2 310-4|B2 310-4'];
                        } else if (s1.value === "Ibnu Hibban" && s2.value === "4" && s3.value === "Triple Room") {
                            var optionArray = ['B2 401-2|B2 401-2', 'B2 401-4|B2 401-4', 'B2 402-2|B2 402-2', 'B2 402-4|B2 402-4', 'B2 403-2|B2 403-2', 'B2 403-4|B2 403-4', 'B2 404-2|B2 404-2', 'B2 404-4|B2 404-4'
                                        , 'B2 405-2|B2 405-2', 'B2 405-4|B2 405-4', 'B2 406-2|B2 406-2', 'B2 406-4|B2 406-4', 'B2 407-2|B2 407-2', 'B2 407-4|B2 407-4', 'B2 408-2|B2 408-2', 'B2 408-4|B2 408-4', 'B2 409-2|B2 409-2', 'B2 409-4|B2 409-4', 'B2 410-2|B2 410-2', 'B2 410-4|B2 410-4'];
                        } else if (s1.value === "Ibnu Hibban" && s2.value === "5" && s3.value === "Triple Room") {
                            var optionArray = ['B2 501-2|B2 501-2', 'B2 501-4|B2 501-4', 'B2 502-2|B2 502-2', 'B2 502-4|B2 502-4', 'B2 503-2|B2 503-2', 'B2 503-4|B2 503-4', 'B2 504-2|B2 504-2', 'B2 504-4|B2 504-4'
                                        , 'B2 505-2|B2 505-2', 'B2 505-4|B2 505-4', 'B2 506-2|B2 506-2', 'B2 506-4|B2 506-4', 'B2 507-2|B2 507-2', 'B2 507-4|B2 507-4', 'B2 508-2|B2 508-2', 'B2 508-4|B2 508-4', 'B2 509-2|B2 509-2', 'B2 509-4|B2 509-4', 'B2 510-2|B2 510-2', 'B2 510-4|B2 510-4'];
                        } else if (s1.value === "Ibnu Majah" && s2.value === "1") {
                            var optionArray = ['IM 101|IM 101', 'IM 102|IM 102', 'IM 103|IM 103', 'IM 104|IM 104', 'IM 105|IM 105', 'IM 106|IM 106', 'IM 107|IM 107', 'IM 108|IM 108', 'IM 109|IM 109', 'IM 110|IM 110'];
                        } else if (s1.value === "Ibnu Majah" && s2.value === "2") {
                            var optionArray = ['IM 201|IM 201', 'IM 202|IM 202', 'IM 203|IM 203', 'IM 204|IM 204', 'IM 205|IM 205', 'IM 206|IM 206', 'IM 207|IM 207', 'IM 208|IM 208', 'IM 209|IM 209', 'IM 210|IM 210'];
                        } else if (s1.value === "Ibnu Majah" && s2.value === "3") {
                            var optionArray = ['IM 301|IM 301', 'IM 302|IM 302', 'IM 303|IM 303', 'IM 304|IM 304', 'IM 305|IM 305', 'IM 306|IM 306', 'IM 307|IM 307', 'IM 308|IM 308', 'IM 309|IM 309', 'IM 310|IM 310'];
                        } else if (s1.value === "Ibnu Majah" && s2.value === "4") {
                            var optionArray = ['IM 401|IM 401', 'IM 402|IM 402', 'IM 403|IM 403', 'IM 404|IM 404', 'IM 405|IM 405', 'IM 406|IM 406', 'IM 407|IM 407', 'IM 408|IM 408', 'IM 409|IM 409', 'IM 410|IM 410'];
                        } else if (s1.value === "Ibnu Abbas" && s2.value === "1") {
                            var optionArray = ['IA 101|IA 101', 'IA 102|IA 102', 'IA 103|IA 103', 'IA 104|IA 104', 'IA 105|IA 105', 'IA 106|IA 106', 'IA 107|IA 107', 'IA 108|IA 108', 'IA 109|IA 109', 'IA 110|IA 110'];
                        } else if (s1.value === "Ibnu Abbas" && s2.value === "2") {
                            var optionArray = ['IA 201|IA 201', 'IA 202|IA 202', 'IA 203|IA 203', 'IA 204|IA 204', 'IA 205|IA 205', 'IA 206|IA 206', 'IA 207|IA 207', 'IA 208|IA 208', 'IA 209|IA 209', 'IA 210|IA 210'];
                        } else if (s1.value === "Ibnu Abbas" && s2.value === "3") {
                            var optionArray = ['IA 301|IA 301', 'IA 302|IA 302', 'IA 303|IA 303', 'IA 304|IA 304', 'IA 305|IA 305', 'IA 306|IA 306', 'IA 307|IA 307', 'IA 308|IA 308', 'IA 309|IA 309', 'IA 310|IA 310'];
                        } else if (s1.value === "Ibnu Abbas" && s2.value === "4") {
                            var optionArray = ['IA 401|IA 401', 'IA 402|IA 402', 'IA 403|IA 403', 'IA 404|IA 404', 'IA 405|IA 405', 'IA 406|IA 406', 'IA 407|IA 407', 'IA 408|IA 408', 'IA 409|IA 409', 'IA 410|IA 410'];
                        } else if (s1.value === "Ibnu Jarir" && s2.value === "1") {
                            var optionArray = ['IJ 101|IJ 101', 'IJ 102|IJ 102', 'IJ 103|IJ 103', 'IJ 104|IJ 104', 'IJ 105|IJ 105', 'IJ 106|IJ 106', 'IJ 107|IJ 107', 'IJ 108|IJ 108', 'IJ 109|IJ 109', 'IJ 110|IJ 110'];
                        } else if (s1.value === "Ibnu Jarir" && s2.value === "2") {
                            var optionArray = ['IJ 201|IJ 201', 'IJ 202|IJ 202', 'IJ 203|IJ 203', 'IJ 204|IJ 204', 'IJ 205|IJ 205', 'IJ 206|IJ 206', 'IJ 207|IJ 207', 'IJ 208|IJ 208', 'IJ 209|IJ 209', 'IJ 210|IJ 210'];
                        } else if (s1.value === "Ibnu Jarir" && s2.value === "3") {
                            var optionArray = ['IJ 301|IJ 301', 'IJ 302|IJ 302', 'IJ 303|IJ 303', 'IJ 304|IJ 304', 'IJ 305|IJ 305', 'IJ 306|IJ 306', 'IJ 307|IJ 307', 'IJ 308|IJ 308', 'IJ 309|IJ 309', 'IJ 310|IJ 310'];
                        } else if (s1.value === "Ibnu Jarir" && s2.value === "4") {
                            var optionArray = ['IJ 401|IJ 401', 'IJ 402|IJ 402', 'IJ 403|IJ 403', 'IJ 404|IJ 404', 'IJ 405|IJ 405', 'IJ 406|IJ 406', 'IJ 407|IJ 407', 'IJ 408|IJ 408', 'IJ 409|IJ 409', 'IJ 410|IJ 410'];
                        } else if (s1.value === "An-Nasai" && s2.value === "1") {
                            var optionArray = ['ANN 101|ANN 101', 'ANN 102|ANN 102', 'ANN 103|ANN 103', 'ANN 104|ANN 104', 'ANN 105|ANN 105', 'ANN 106|ANN 106', 'ANN 107|ANN 107', 'ANN 108|ANN 108', 'ANN 109|ANN 109', 'ANN 110|ANN 110'];
                        } else if (s1.value === "An-Nasai" && s2.value === "2") {
                            var optionArray = ['ANN 201|ANN 201', 'ANN 202|ANN 202', 'ANN 203|ANN 203', 'ANN 204|ANN 204', 'ANN 205|ANN 205', 'ANN 206|ANN 206', 'ANN 207|ANN 207', 'ANN 208|ANN 208', 'ANN 209|ANN 209', 'ANN 210|ANN 210'];
                        } else if (s1.value === "An-Nasai" && s2.value === "3") {
                            var optionArray = ['ANN 301|ANN 301', 'ANN 302|ANN 302', 'ANN 303|ANN 303', 'ANN 304|ANN 304', 'ANN 305|ANN 305', 'ANN 306|ANN 306', 'ANN 307|ANN 307', 'ANN 308|ANN 308', 'ANN 309|ANN 309', 'ANN 310|ANN 310'];
                        } else if (s1.value === "An-Nasai" && s2.value === "4") {
                            var optionArray = ['ANN 401|ANN 401', 'ANN 402|ANN 402', 'ANN 403|ANN 403', 'ANN 404|ANN 404', 'ANN 405|ANN 405', 'ANN 406|ANN 406', 'ANN 407|ANN 407', 'ANN 408|ANN 408', 'ANN 409|ANN 409', 'ANN 410|ANN 410'];
                        } else if (s1.value === "At-Thabrani" && s2.value === "1") {
                            var optionArray = ['ATB 101|ATB 101', 'ATB 102|ATB 102', 'ATB 103|ATB 103', 'ATB 104|ATB 104', 'ATB 105|ATB 105', 'ATB 106|ATB 106', 'ATB 107|ATB 107', 'ATB 108|ATB 108', 'ATB 109|ATB 109', 'ATB 110|ATB 110'];
                        } else if (s1.value === "At-Thabrani" && s2.value === "2") {
                            var optionArray = ['ATB 201|ATB 201', 'ATB 202|ATB 202', 'ATB 203|ATB 203', 'ATB 204|ATB 204', 'ATB 205|ATB 205', 'ATB 206|ATB 206', 'ATB 207|ATB 207', 'ATB 208|ATB 208', 'ATB 209|ATB 209', 'ATB 210|ATB 210'];
                        } else if (s1.value === "At-Thabrani" && s2.value === "3") {
                            var optionArray = ['ATB 301|ATB 301', 'ATB 302|ATB 302', 'ATB 303|ATB 303', 'ATB 304|ATB 304', 'ATB 305|ATB 305', 'ATB 306|ATB 306', 'ATB 307|ATB 307', 'ATB 308|ATB 308', 'ATB 309|ATB 309', 'ATB 310|ATB 310'];
                        } else if (s1.value === "At-Thabrani" && s2.value === "4") {
                            var optionArray = ['ATB 401|ATB 401', 'ATB 402|ATB 402', 'ATB 403|ATB 403', 'ATB 404|ATB 404', 'ATB 405|ATB 405', 'ATB 406|ATB 406', 'ATB 407|ATB 407', 'ATB 408|ATB 408', 'ATB 409|ATB 409', 'ATB 410|ATB 410'];
                        } else if (s1.value === "At-Tarmidzi" && s2.value === "1") {
                            var optionArray = ['ATT 101|ATT 101', 'ATT 102|ATT 102', 'ATT 103|ATT 103', 'ATT 104|ATT 104', 'ATT 105|ATT 105', 'ATT 106|ATT 106', 'ATT 107|ATT 107', 'ATT 108|ATT 108', 'ATT 109|ATT 109', 'ATT 110|ATT 110'];
                        } else if (s1.value === "At-Tarmidzi" && s2.value === "2") {
                            var optionArray = ['ATT 201|ATT 201', 'ATT 202|ATT 202', 'ATT 203|ATT 203', 'ATT 204|ATT 204', 'ATT 205|ATT 205', 'ATT 206|ATT 206', 'ATT 207|ATT 207', 'ATT 208|ATT 208', 'ATT 209|ATT 209', 'ATT 210|ATT 210'];
                        } else if (s1.value === "At-Tarmidzi" && s2.value === "3") {
                            var optionArray = ['ATT 301|ATT 301', 'ATT 302|ATT 302', 'ATT 303|ATT 303', 'ATT 304|ATT 304', 'ATT 305|ATT 305', 'ATT 306|ATT 306', 'ATT 307|ATT 307', 'ATT 308|ATT 308', 'ATT 309|ATT 309', 'ATT 310|ATT 310'];
                        } else if (s1.value === "At-Tarmidzi" && s2.value === "4") {
                            var optionArray = ['ATT 401|ATT 401', 'ATT 402|ATT 402', 'ATT 403|ATT 403', 'ATT 404|ATT 404', 'ATT 405|ATT 405', 'ATT 406|ATT 406', 'ATT 407|ATT 407', 'ATT 408|ATT 408', 'ATT 409|ATT 409', 'ATT 410|ATT 410'];
                        }

                        for (var option in optionArray) {
                            var pair = optionArray[option].split("|");
                            var newoption = document.createElement("option");

                            newoption.value = pair[0];
                            newoption.innerHTML = pair[1];
                            s4.options.add(newoption);
                        }

                    }


                </script>
                </body>
                         </html>