<%-- 
    Document   : adminLogin
    Created on : Jun 4, 2023, 4:55:25 PM
    Author     : admin
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            .box {
                width: 500px;
                margin: 200px 0;
            }

            .shape1{
                position: relative;
                height: 150px;
                width: 150px;
                background-color: #5D0AC8;
                border-radius: 80px;
                float: left;
                margin-right: -50px;
            }
            .shape2 {
                position: relative;
                height: 150px;
                width: 150px;
                background-color: #5D0AC8;
                border-radius: 80px;
                margin-top: -30px;
                float: left;
            }
            .shape3 {
                position: relative;
                height: 150px;
                width: 150px;
                background-color: #5D0AC8;
                border-radius: 80px;
                margin-top: -30px;
                float: left;
                margin-left: -31px;
            }
            .shape4 {
                position: relative;
                height: 150px;
                width: 150px;
                background-color: #5D0AC8;
                border-radius: 80px;
                margin-top: -25px;
                float: left;
                margin-left: -32px;
            }
            .shape5 {
                position: relative;
                height: 150px;
                width: 150px;
                background-color: #5D0AC8;
                border-radius: 80px;
                float: left;
                margin-right: -48px;
                margin-left: -32px;
                margin-top: -30px;
            }
            .shape6 {
                position: relative;
                height: 150px;
                width: 150px;
                background-color: #5D0AC8;
                border-radius: 80px;
                float: left;
                margin-right: -20px;
                margin-top: -35px;
            }
            .shape7 {
                position: relative;
                height: 150px;
                width: 150px;
                background-color: #5D0AC8;
                border-radius: 80px;
                float: left;
                margin-right: -20px;
                margin-top: -57px;
            }
            .float {
                position: absolute;
                z-index: 2;
            }

            .form {
                margin-left: 145px;
            }
        </style>

    </head>
    <body style="background-color:#E3E4FA;">
        <%
                session.setAttribute("type", request.getParameter("type"));
        %>

        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">

                    <div class="box">                        
                        <div class="shape1"></div>
                        <div class="shape2"></div>
                        <div class="shape3"></div>
                        <div class="shape4"></div>
                        <div class="shape5"></div>
                        <div class="shape6"></div>
                        <div class="shape7"></div>
                        <div class="float">
                            <form class="form" action="validateLogin" method="post">
                                <input type="hidden" name="type" value="<%=session.getAttribute("type") %>">
                                <div class="form-group">
                                    <label for="username" class="text-white">Username:</label><br>
                                    <input type="text" name="name" id="name" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="password" class="text-white">Password:</label><br>
                                    <input type="password" name="password" id="password" class="form-control">
                                </div>
                                <div class="form-group">

                                    <input type="submit" name="submit" class="btn btn-warning btn-md" value="Login">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
