<%-- 
    Document   : login
    Created on : Oct 26, 2021, 3:53:39 PM
    Author     : quocb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Shop | QB-Shopper</title>

        <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="static/css/bootstrap.min.css" rel="stylesheet">
        <link href="static/css/font-awesome.min.css" rel="stylesheet">
        <link href="static/css/prettyPhoto.css" rel="stylesheet">
        <link href="static/css/price-range.css" rel="stylesheet">
        <link href="static/css/animate.css" rel="stylesheet">
        <link href="static/css/main.css" rel="stylesheet">
        <link href="static/css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="static/js/html5shiv.js"></script>
        <script src="static/js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->

    <body>
        <%@include file="../components/header.jsp" %>

        <section id="form"><!--form-->
            <div class="container">
                        <div class="login-form"><!--login form-->
                            <h2>Login to your account</h2>
                            <form action="login" method="POST">
                                <input name="username" type="text" placeholder="UserName" />
                                <input name="password" type="password" placeholder="Password" />
                                <p class="text-danger">${err}</p>
                                <span>
                                    <input name="remember" value="true" type="checkbox" class="checkbox"> 
                                    Keep me signed in
                                </span>

                                <a style="margin-left: 50px; color: rgb(66,66,66)" href="fogot-password"> Forgot Password</a>
                                
                                <a style="margin-left: 50px; color: rgb(66,66,66)" href="loadsignup"> Signup</a>
                                <button type="submit" class="btn btn-default">Login</button>
                              
                            </form>
                        </div><!--/login form-->
                  
            </div>
        </section><!--/form-->

        <%@include file="../components/footer.jsp" %>
    </body>
</html>
