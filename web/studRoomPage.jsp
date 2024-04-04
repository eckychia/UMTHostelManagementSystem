<%-- 
    Document   : studRoomPage
    Created on : 6 Jun 2023, 11:00:47 pm
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

        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" integrity="sha512-UTNP5BXLIptsaj5WdKFrkFov94lDx+eBvbKyoe1YAfjeRPC+gT5kyZ10kOHCfNZqEui1sxmqvodNUx3KbuYI/A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>

    </head>
    <body>
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
                        <li><a href="#double">Double</a></li>
                        <li><a href="#triple">Triple</a></li>
                        <li><a href="#quadruple">Quadruple</a></li>
                        <li><a href="#extensions">Extensions</a></li>
                            <%if (session.getAttribute("count").equals(0)) {%>
                        <a href="studHostelApplication.jsp" class="btn">Apply Hostel</a>
                        <%} else {%>
                        <button class="btn" disabled="disabled">Apply Hostel</button>
                        <%}%>
                    </ul>
                </nav>
                <h3 style="font-size:3rem; color:var(--primary); padding:2rem 0; margin-top: 40px; text-align: center;">ACCOMMODATION</h3>
            </div>
        </header>

        <!--end header--> 

        <!--start counter--> 
        <section class="counter top">
            <div class="container grid">
                <div class="box">
                    <h1>8</h1>
                    <hr>
                    <span>Residential Block</span>
                </div>

                <div class="box">
                    <h1>1,341</h1>
                    <hr>
                    <span>Room Unit</span>
                </div>

                <div class="box">
                    <h1>4,424</h1>
                    <hr>
                    <span>Total Inhabitants</span>
                </div>

                <div class="box">
                    <h1>666</h1>
                    <hr>
                    <span>Total Management</span>
                </div>

            </div>
        </section>
        <!--end counter--> 

        <!--start room--> 

        <section class="news top rooms" id="double" >
            <div class="container">
                <div class="heading">
                    <h1>ROOMS</h1>
                    <h2>Our Rooms</h2>
                    <p>In the Residential College, there are 2 blocks for male students(At-Tarmizi and Ibnu Hibbah) and 6 blocks for female students (Ibnu Majah, Ibnu Abbas, Ibnu Jarir, An-Nasai, At-Thebrani and Ibnu Sina)</p>
                </div>

                <div class="content flex">
                    <div class="left grid2">
                        <div class="items">
                            <div class="image">
                                <img style="width:500px;" src="images/room1.jpg" alt="">
                            </div>
                            <div class="text">
                                <h2>Double room</h2>
                                <div class="admin flex">
                                    <i class="fa fa-user"></i>
                                    <label>2 girls</label>
                                    <i class="fa fa-star"></i>
                                    <label>5</label>
                                    <i class="fa fa-comments"></i>
                                </div>
                                <p>Twins room are only available in Ibnu Sina(B1) & Ibnu Hibbah(B2) blocks. All the facilities are provide for 2 set.</p>
                            </div>
                        </div>

                        <div class="items">
                            <div class="image">
                                <img style="width:500px;" src="images/room2.jpg" alt="">
                            </div>
                            <div class="text">
                                <h2>Double room</h2>
                                <div class="admin flex">
                                    <i class="fa fa-user"></i>
                                    <label>2 boys</label>
                                    <i class="fa fa-star"></i>
                                    <label>5</label>
                                    <i class="fa fa-comments"></i>
                                </div>
                                <p>Twins room are only available in Ibnu Sina(B1) & Ibnu Hibbah(B2) blocks. All the facilities are provide for 2 set.</p>
                            </div>
                        </div>
                    </div>


                    <div class="right">
                        <div class="box flex">
                            <div class="img1">
                                <img src="images/facility1-1.png" alt="">
                            </div>
                            <div class="stext">
                                <h2>Single Bed</h2>
                                <p> Each room will have 2 single bed</p>
                            </div>
                        </div>

                        <div class="box flex">
                            <div class="img1">
                                <img src="images/facility1-2.png" alt="desk">
                            </div>
                            <div class="stext">
                                <h2>Desk & Chair</h2>
                                <p> Each room will have 2 set of desk & chair</p>
                            </div>
                        </div>

                        <div class="box flex">
                            <div class="img1">
                                <img src="images/facility1-3.jpg" alt="">
                            </div>
                            <div class="stext">
                                <h2>Wardrobe</h2>
                                <p> Each room will have 2 wardrobe</p>
                            </div>
                        </div>
                    </div>
                </div>
        </section>

        <section class="news top rooms" id="triple" >
            <div class="container">
                <div class="content flex">
                    <div class="left grid2">
                        <div class="items">
                            <div class="image">
                                <img style="width:500px;" src="images/room3.jpg" alt="">
                            </div>
                            <div class="text">
                                <h2>Triple room</h2>
                                <div class="admin flex">
                                    <i class="fa fa-user"></i>
                                    <label>3 girls</label>
                                    <i class="fa fa-star"></i>
                                    <label>4.5</label>
                                    <i class="fa fa-comments"></i>
                                </div>
                                <p>Triples room are only available in Ibnu Sina(B1) & Ibnu Hibbah(B2) blocks. All the facilities are provide for 3 set.</p>
                            </div>
                        </div>

                        <div class="items">
                            <div class="image">
                                <img style="width:500px;" src="images/room4.jpg" alt="">
                            </div>
                            <div class="text">
                                <h2>Triple room</h2>
                                <div class="admin flex">
                                    <i class="fa fa-user"></i>
                                    <label>3 boys</label>
                                    <i class="fa fa-star"></i>
                                    <label>4.5</label>
                                    <i class="fa fa-comments"></i>
                                </div>
                                <p>Triples room are only available in Ibnu Sina(B1) & Ibnu Hibbah(B2) blocks. All the facilities are provide for 3 set.</p>
                            </div>
                        </div>
                    </div>

                    <div class="right">
                        <div class="box flex">
                            <div class="img1">
                                <img src="images/facility3-1.jpg" alt="">
                            </div>
                            <div class="stext">
                                <h2>3 Single Bed or Double Decker Bed</h2>
                                <p> Each room will have either  3 single or 1 single & 1 double decker</p>
                            </div>
                        </div>

                        <div class="box flex">
                            <div class="img1">
                                <img src="images/facility3-2.jpg" alt="desk">
                            </div>
                            <div class="stext">
                                <h2>Desk & Chair</h2>
                                <p> Each room will have 3 set of desk & chair</p>
                            </div>
                        </div>

                        <div class="box flex">
                            <div class="img1">
                                <img src="images/facility3-3.jpg" alt="">
                            </div>
                            <div class="stext">
                                <h2>Wardrobe</h2>
                                <p> Each room will have 3 wardrobe</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="news top rooms" id="quadruple">
            <div class="container">
                <div class="content flex">
                    <div class="left grid2">
                        <div class="items">
                            <div class="image">
                                <img style="width:500px;" src="images/room5.jpg" alt="">
                            </div>
                            <div class="text">
                                <h2>Quadruple room</h2>
                                <div class="admin flex">
                                    <i class="fa fa-user"></i>
                                    <label>4 girls</label>
                                    <i class="fa fa-star"></i>
                                    <label>3.5</label>
                                    <i class="fa fa-comments"></i>
                                </div>
                                <p>Quadruple room are available in At-Tarmizi(ATT),Ibnu Majah(IM), Ibnu Abbas(IA), Ibnu Jarir(IJ), An-Nasai(ANN), At-Thebrani(ATB) blocks. All the facilities are provide for 4 set.</p>
                            </div>
                        </div>

                        <div class="items">
                            <div class="image">
                                <img style="width:500px;" src="images/room6.jpg" alt="">
                            </div>
                            <div class="text">
                                <h2>Quadruple room</h2>
                                <div class="admin flex">
                                    <i class="fa fa-user"></i>
                                    <label>4 boys</label>
                                    <i class="fa fa-star"></i>
                                    <label>3.5</label>
                                    <i class="fa fa-comments"></i>
                                </div>
                                <p>Quadruple room are available in At-Tarmizi(ATT),Ibnu Majah(IM), Ibnu Abbas(IA), Ibnu Jarir(IJ), An-Nasai(ANN), At-Thebrani(ATB) blocks. All the facilities are provide for 4 set.</p>
                            </div>
                        </div>
                    </div>

                    <div class="right">
                        <div class="box flex">
                            <div class="img1">
                                <img src="images/facility5-1.jpg" alt="">
                            </div>
                            <div class="stext">
                                <h2>2 Double Decker Bed</h2>
                                <p> Each room will have 2 double decker bed</p>
                            </div>
                        </div>

                        <div class="box flex">
                            <div class="img1">
                                <img src="images/facility5-2.png" alt="desk">
                            </div>
                            <div class="stext">
                                <h2>Desk & Chair</h2>
                                <p> Each room will have 4 set of desk and chair</p>
                            </div>
                        </div>

                        <div class="box flex">
                            <div class="img1">
                                <img src="images/facility5-3.jpg" alt="">
                            </div>
                            <div class="stext">
                                <h2>Wardrobe</h2>
                                <p> Each room will have 4 wardrobe</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <!--end room--> 

        <!--start extensions-->

        <section class="extensions" id="extensions">
            <div class="container top">
                <div class="heading">
                    <h1>EXTENSIONS</h1>
                    <h2>Other Facilities</h2>
                    <p>The Residential College has provide students with the convenience and comfort to enjoys the study life in University Malaysia Terengganu(UMT)</p>
                </div>
            </div>

            <div class="content mtop">
                <div class="owl-carousel owl-carousel1 owl-theme">
                    <div class="items">
                        <div class="img">
                            <img src="images/facilities1.jpg" alt="">
                        </div>
                        <div class="overlay">

                            <h3>Football Court</h3>
                        </div>
                    </div>

                    <div class="items">
                        <div class="img">
                            <img src="images/facilities2.jpg" alt="">
                        </div>
                        <div class="overlay">

                            <h3>Activity Room</h3>
                        </div>
                    </div>

                    <div class="items">
                        <div class="img">
                            <img src="images/facilities3.jpg" alt="">
                        </div>
                        <div class="overlay">

                            <h3>Meeting Room</h3>
                        </div>
                    </div>

                    <div class="items">
                        <div class="img">
                            <img src="images/facilities4.jpg" alt="">
                        </div>
                        <div class="overlay">

                            <h3>Prayer Room</h3>
                        </div>
                    </div>

                    <div class="items">
                        <div class="img">
                            <img src="images/facilities5.jpg" alt="">
                        </div>
                        <div class="overlay">

                            <h3>Clothesline</h3>
                        </div>
                    </div>

                    <div class="items">
                        <div class="img">
                            <img src="images/facilities6.jpg" alt="">
                        </div>
                        <div class="overlay">
                            <h3>Small Pavillion</h3>
                        </div>
                    </div>

                    <div class="items">
                        <div class="img">
                            <img src="images/facilities7.jpg" alt="">
                        </div>
                        <div class="overlay">

                            <h3>Limbong Cafeteria</h3>
                        </div>
                    </div>

                    <div class="items">
                        <div class="img">
                            <img src="images/facilities8.jpg" alt="">
                        </div>
                        <div class="overlay">

                            <h3>Study Room</h3>
                        </div>
                    </div>


                </div>
            </div>
            <br><br>
        </section>

        <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
        <script src="script.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js" integrity="sha512-gY25nC63ddE0LcLPhxUJGFxa2GoIyA5FLym4UJqHDEMHjp8RET6Zn/SHo1sltt3WuVtqfyxECP38/daUc/WVEA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
                            $('.owl-carousel').owlCarousel({
                                loop: true,
                                margin: 0,
                                nav: true,
                                dots: false,
                                autoplay: true,
                                autoplayTimeout: 1000,
                                autoplayHoverPause: true,
                                navText: ["<i class='fa fa-chevron-right'></i>", "<i class='fa fa-chevron-left'></i>"],
                                responsive: {
                                    0: {
                                        items: 1
                                    },
                                    768: {
                                        items: 4
                                    },
                                    1000: {
                                        items: 6
                                    }
                                }
                            });
        </script>
        <script>
            let subMenu = document.getElementById("subMenu");
            function toggleMenu() {
                subMenu.classList.toggle("open-menu");
            }

        </script>
    </body>
</html> 
