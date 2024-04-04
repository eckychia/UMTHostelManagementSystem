<%-- 
    Document   : studHostelPage
    Created on : 6 Jun 2023, 11:02:37 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>UMT Hostel Management System</title>
        <!-- font awesome cdn link-->
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="s2.css">
    </head>
    <body>
        <%
            if (request.getAttribute("user") != null) {
                session.setAttribute("user", request.getAttribute("user"));

            }
            if (request.getAttribute("count") != null) {
                session.setAttribute("count", request.getAttribute("count"));

            }
            if (request.getAttribute("action") != null) {
                session.setAttribute("action", request.getAttribute("action"));

            }
            if (request.getAttribute("roomApplication") != null) {
                session.setAttribute("roomApplication", request.getAttribute("roomApplication"));

            }

        %>
        <header class="header">
            <!-- As a heading -->
            <div class="hero">
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
                        <li><a href="#about">About</a></li>
                        <li><a href="#block">Block</a></li>
                        <li><a href="#facility">Facility</a></li>
                        <li><a href="#gallery">Gallery</a></li>
                        <li><a href="#faq">Faq</a></li>
                        <li><a href="studHostelApplication" class="btn">Apply hostel</a></li>
                    </ul>
                </nav>
                <h3 style="font-size:3rem; color:var(--primary); padding:2rem 0; margin-top: 40px; text-align: center;"> Welcome to Hostel UMT</h3>
            </div>
        </header>

        <!--end header--> 

        <!--start home--> 
        <section class="home" id="home">
            <div class="swiper home-slider">
                <div class="swiper-wrapper">
                    <div class="swiper-slide slide" style="background: url(images/slide1.jpg) no-repeat;">
                        <div class="content">

                        </div>      
                    </div>

                    <div class="swiper-slide slide" style="background: url(images/slide2.jpg) no-repeat;">
                        <div class="content">


                        </div>      
                    </div>

                    <div class="swiper-slide slide" style="background: url(images/slide3.jpg) no-repeat;">
                        <div class="content">


                        </div>      
                    </div>

                    <div class="swiper-slide slide" style="background: url(images/slide4.jpeg) no-repeat;">
                        <div class="content">


                        </div>      
                    </div>
                    <div class="swiper-slide slide" style="background: url(images/slide5.jpg) no-repeat;">
                        <div class="content">


                        </div>      
                    </div>
                    <div class="swiper-slide slide" style="background: url(images/slide6.jpg) no-repeat;">
                        <div class="content">


                        </div>      
                    </div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
        </section>

        <!--start about-->
        <section class="about" id="about">
            <div class="about" id="about">
                <div class="row">
                    <div class="image">
                        <img src="images/about.jpg" alt="about">
                    </div>
                    <div class="content">
                        <h3> About Hostel UMT</h3>
                        <p>The Residential College (KK) is one of the management components in student development that is responsible for managing placement and student facilities to create a comfortable and safe residential environment.</p>
                        <p>The rebranding of Kolej Siswa to Kolej Kediaman (KK) has started on 20 August 2020 where this branding is in line with the proposal of the leadership led by the Director of Kolej Kediaman which is Ts. Dr. Nik Aziz Bin Nik Ali and assisted by Deputy Director On Campus Dr. Zarihan Binti Abdul Halim and Deputy Director Off Campus, Mr. Fadli Bin Mamat.</p>
                        <p>Therefore, the Residential College has been responsible for playing an important role as a second learning center for students staying at the Residential College. </p>

                    </div>
                </div>
            </div>
            <div><br><br><br></div>
        </section>
        <!--end about-->

        <!--start hostel-->
        <section class="hostel" id="block">
            <br><br>
            <h3 class="heading" font-size:3.5rem;>8 Block of Hostel</h3>
            <div class="swiper hostel-slider">
                <div class="swiper-wrapper">
                    <div class="swiper-slide slide">
                        <div class="image">

                            <img src="images/hostel1.png" alt="hostel B1">
                            <a href="studRoomPage.jsp" class="btn1">Details</a>
                        </div>
                        <div class="content">
                            <h3>Ibnu Hibbah(B2)</h3>
                            <p>Block for boys(room type: double & triple room)</p>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>

                        </div>
                    </div>


                    <div class="swiper-slide slide">
                        <div class="image">

                            <img src="images/hostel2.png" alt="hostel B2">
                            <a href="studRoomPage.jsp" class="btn1">Details</a>
                        </div>
                        <div class="content">
                            <h3>Ibnu Sina(B1)</h3>
                            <p>Block for girls(room type: double & triple room)</p>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>

                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <div class="image">

                            <img src="images/hostel3.png" alt="hostel IM">
                            <a href="studRoomPage.jsp" class="btn1">Details</a>
                        </div>
                        <div class="content">
                            <h3>Ibnu Majah(IM)</h3>
                            <p>Block for girls(room type:fourth room)</p>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>

                        </div>
                    </div>


                    <div class="swiper-slide slide">
                        <div class="image">

                            <img src="images/hostel4.png" alt="hostel IA">
                            <a href="studRoomPage.jsp" class="btn1">Details</a>
                        </div>
                        <div class="content">
                            <h3>Ibnu Abbas(IA)</h3>
                            <p>Block for girls(room type:fourth room)</p>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>

                        </div>
                    </div>


                    <div class="swiper-slide slide">
                        <div class="image">

                            <img src="images/hostel5.png" alt="hostel IJ">
                            <a href="studRoomPage.jsp" class="btn1">Details</a>
                        </div>
                        <div class="content">
                            <h3>Ibnu Jarir(IJ)</h3>
                            <p>Block for boys(room type:fourth room)</p>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>

                        </div>
                    </div>


                    <div class="swiper-slide slide">
                        <div class="image">

                            <img src="images/hostel6.png" alt="hostel ANN">
                            <a href="studRoomPage.jsp" class="btn1">Details</a>
                        </div>
                        <div class="content">
                            <h3>Ann Nasai(ANN)</h3>
                            <p>Block for girls(room type:fourth room)</p>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>

                        </div>
                    </div>


                    <div class="swiper-slide slide">
                        <div class="image">

                            <img src="images/hostel7.png" alt="hostel ATT">
                            <a href="studRoomPage.jsp" class="btn1">Details</a>
                        </div>
                        <div class="content">
                            <h3>At-Tarmidzi(ATT)</h3>
                            <p>Block for boys(room type:fourth room)</p>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>

                        </div>
                    </div>


                    <div class="swiper-slide slide">
                        <div class="image">

                            <img src="images/hostel8.png" alt="hostel ATB">
                            <a href="studRoomPage.jsp" class="btn1">Details</a>
                        </div>
                        <div class="content">
                            <h3>At-Thabrani(ATB)</h3>
                            <p>Block for girls(room type:fourth room)</p>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="swiper-pagination"></div>
            </div>
            <br><br>
        </section>

        <!--end hostel-->

        <!--start facility-->

        <section class="facility" id="facility">
            <br><br>
            <h3 class="heading" font-size:3.5rem;>Facilities & Conveniences</h3>
            <div class="box-container">
                <div class="box">
                    <img src="images/facility1.png" alt="CAFETERIA">
                    <h3>CAFETERIA</h3>
                </div>

                <div class="box">
                    <img src="images/facility2.png" alt="CENTRAL STORE">
                    <h3>CENTRAL STORE</h3>
                </div>

                <div class="box">
                    <img src="images/facility3.png" alt="MINI GYMNASIUM">
                    <h3>MINI GYMNASIUM</h3>
                </div>

                <div class="box">
                    <img src="images/facility4.png" alt="AL IRFAN HALL">
                    <h3>AL IRFAN HALL</h3>
                </div>

                <div class="box">
                    <img src="images/facility5.png" alt="AL FALAH HALL">
                    <h3>AL FALAH HALL</h3>
                </div>

                <div class="box">
                    <img src="images/facility6.png" alt="RELAX ZON">
                    <h3>RELAX ZONE</h3>
                </div>

                <div class="box">
                    <img src="images/facility7.png" alt="MEETING ROOM">
                    <h3>MEETING ROOM</h3>
                </div>

                <div class="box">
                    <img src="images/facility8.png" alt="TEFLON">
                    <h3>TEFLON</h3>
                </div>

                <div class="box">
                    <img src="images/facility9.png" alt="CAFETERIA LOBBY">
                    <h3>CAFETERIA LOBBY</h3>
                </div>

                <div class="box">
                    <img src="images/facility10.png" alt="COURT">
                    <h3>COURT</h3>
                </div>
                <div class="box">
                    <img src="images/facility11.png" alt="COURT">
                    <h3>B1 BLOCK COURT</h3>
                </div>
                <div class="box">
                    <img src="images/facility12.png" alt="COURT">
                    <h3>UMT Vehicle</h3>
                </div>
            </div>
            <br><br>
        </section>

        <!--end facility-->

        <!--start gallery-->
        <section class="gallery" id="gallery">
            <br><br>
            <h1 class="heading">Our Gallery</h1>
            <div class="swiper gallery-slider">
                <div class="swiper-wrapper">
                    <div class="swiper-slide slide">
                        <img src="images/gallery1.jpg" alt="">
                        <div class="icon">
                            <i class="fas fa-magnifying-glass-plus"></i>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <img src="images/gallery2.jpg" alt="">
                        <div class="icon">
                            <i class="fas fa-magnifying-glass-plus"></i>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <img src="images/gallery3.jpg" alt="">
                        <div class="icon">
                            <i class="fas fa-magnifying-glass-plus"></i>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <img src="images/gallery4.jpg" alt="">
                        <div class="icon">
                            <i class="fas fa-magnifying-glass-plus"></i>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <img src="images/gallery5.jpg" alt="">
                        <div class="icon">
                            <i class="fas fa-magnifying-glass-plus"></i>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <img src="images/gallery6.jpg" alt="">
                        <div class="icon">
                            <i class="fas fa-magnifying-glass-plus"></i>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <img src="images/gallery7.jpg" alt="">
                        <div class="icon">
                            <i class="fas fa-magnifying-glass-plus"></i>
                        </div>
                    </div>
                </div>
            </div>
            <br><br><br><br>
        </section>
        <!--end gallery-->

        <!--start faq-->
        <section class="faqs" id="faq">
            <br><br>
            <h1 class="heading">frequently asked questions</h1>
            <div class="row">
                <div class="image">
                    <img src="images/FAQs.gif" alt="faq">
                </div>
                <div class="content">
                    <div class="box active">
                        <h3> Are the hostel distribute based on the student merit Mystar?</h3>
                        <p>Yes, student who have the higher marks of merit Mystar can choose their desired block and room.</p>
                    </div>

                    <div class="box">
                        <h3> Are the student need to clear the room after finished study of sem 2?</h3>
                        <p>Yes, student need to clean up the room after finished sem 2 except for having short sem student.</p>
                    </div>

                    <div class="box">
                        <h3> If the student only want to stay the hostel for single sem, it's possible?</h3>
                        <p>Yes, student can just return back the room key when they are not willing to stay at hostel anymore.</p>
                    </div>

                    <div class="box">
                        <h3> For student who have health problem can 100% get hostel?</h3>
                        <p>Yes,student who have health problem need to show the providence once taking the room key.</p>
                    </div>

                    <div class="box">
                        <h3> The room is distribute by staff or student can choose themselves?</h3>
                        <p>Student can choose their desired block and room once his/her merit is enough for staying at hostel.</p>
                    </div>

                </div>
            </div>
            <br><br>
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

