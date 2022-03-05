<%-- 
    Document   : forgot-password
    Created on : Oct 30, 2021, 3:00:16 PM
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

        <div class="signup-form" >
            <h1 style="text-align: center; color: rgb(254,152,15)">Check your email</h1>
            <form action="sendmail" method="POST"> 
                <input type="text" required autofocus name="name" placeholder="Username" style="width: 30%; margin: 0 auto">
                <input  type="email" required autofocus name="email" placeholder="Email address" style="width: 30%; margin: 0 auto; margin-top: 10px">
                <input class="text" type="submit" name="recover-submit" value="Continue" style="width: 10%; margin: 0 auto; margin-top: 10px; background-color: rgb(254,152,15); color: white">
            </form>

        </div>
    </body>
</html> 
