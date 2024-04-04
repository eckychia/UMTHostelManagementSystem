<%-- 
    Document   : loginInterface
    Created on : Jun 4, 2023, 4:54:35 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, intial-scale=1.0">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">

        <!--font-family-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Rowdies&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Cormorant+Infant:wght@500&family=EB+Garamond:wght@500&family=IM+Fell+Great+Primer&family=Monoton&family=NTR&family=Original+Surfer&family=Rowdies&family=Yantramanav&family=Zilla+Slab+Highlight&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
        <style>
            body {
                background: url('https://assets.nst.com.my/images/articles/MUTLAH_1591158422.jpg') no-repeat center center fixed;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                background-size: cover;
                -o-background-size: cover;
            }
        </style>
    </head>
    <body>

        <section id="admission" class="admission section-padding">
            <div class="container">
                <div class="row" style=color:black;">
                    <div class="col-md-12">
                        <div class="section-header text-center pb-5">
                            <br><br>
                            <h1 style="font-family: 'Rowdies', cursive; color:white;">User Login</h1>
                        </div>
                    </div>
                </div>

                <br><br>


                <div class="row" style="color:black;">
                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="card text-center bg-light bg-opacity-75 pb-2">
                            <div class="card-body text-dark">
                                <div class="img-area mb-4">
                                    <br><br><br>
                                    <a href="#" style="font-size:50px; color:#5D0AC8;"><i class="bi bi-person-bounding-box"></i></a>
                                </div>
                                <h3 class="card-title" style="font-family: 'IM Fell Great Primer', serif;">Administrator</h3>
                                <p class="lead" style="font-family: 'NTR', sans-serif;"><br>Login As Admin
                                </p>
                                <br>
                                <form action="login.jsp" method="POST">
                                    <input type="hidden" name="type" value="admin">
                                    <button type="submit" class="btn" style="background-color:#5D0AC8;color:white">Login</button>
                                </form>

                                <br><br><br>
                            </div>
                        </div>
                    </div>


                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="card text-center bg-light bg-opacity-75 pb-2">
                            <div class="card-body text-dark">
                                <div class="img-area mb-4">
                                    <br><br><br>
                                    <a href="#" style="font-size:50px; color:#5D0AC8;"><i class="bi bi-person-bounding-box"></i></a>
                                </div>
                                <h3 class="card-title" style="font-family: 'IM Fell Great Primer', serif;">Hostel Staff</h3>
                                <p class="lead" style="font-family: 'NTR', sans-serif;"><br>Login As Hostel Staff
                                </p>
                                <br>
                                <form action="login.jsp" method="POST">
                                    <input type="hidden" name="type" value="staff">
                                    <button type="submit" class="btn" style="background-color:#5D0AC8;color:white">Login</button>
                                </form>
                                <br><br><br>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="card text-center bg-light bg-opacity-75 pb-2">
                            <div class="card-body text-dark">
                                <div class="img-area mb-4">
                                    <br><br><br>
                                    <a href="#" style="font-size:50px; color:#5D0AC8;"><i class="bi bi-person-bounding-box"></i></a>
                                </div>
                                <h3 class="card-title" style="font-family: 'IM Fell Great Primer', serif;">Student</h3>
                                <p class="lead" style="font-family: 'NTR', sans-serif;"><br>Login As Student
                                </p>
                                <br>
                                <form action="login.jsp" method="POST">
                                    <input type="hidden" name="type" value="student">
                                    <button type="submit" class="btn" style="background-color:#5D0AC8;color:white">Login</button>
                                </form>
                                <br><br><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
