<%-- 
    Document   : thank
    Created on : Oct 29, 2021, 10:16:19 PM
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
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->
    <body>
        <%@include file="../components/header.jsp" %>
        <div class="container">
            <div class="alert alert-warning" role="alert">
                Quý khách đã đặt hàng thành công! Cảm ơn quý khách đã mua hàng!
            </div>
            <a href="product" class="btn btn-outline-success" style="border: 1px solid #FAEBCC; background-color: rgb(252,248,227); color: rgb(164,141,98); margin-bottom: 30px" >Tiếp tục mua hàng ...</a>

        </div>

        <%@include file="../components/footer.jsp" %>

    </body>
</html>



