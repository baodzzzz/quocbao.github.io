<%-- 
    Document   : header
    Created on : Oct 19, 2021, 10:49:21 PM
    Author     : quocb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header"><!--header-->
    <div class="header_top"><!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="#"><i class="fa fa-phone"></i> +99999999</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i> QB@gmail.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header_top-->

    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-md-4 clearfix">
                    <div class="logo pull-left">
                        <a href="index.html"><img src="static/images/home/oke.png" alt="" /></a>
                    </div>
                    <div class="btn-group pull-right clearfix">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                USA
                                <span class="caret"></span>
                            </button>
                           
                        </div>

                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                DOLLAR
                                <span class="caret"></span>
                            </button>
                            
                        </div>
                    </div>
                </div>
                <div class="col-md-8 clearfix">
                    <div class="shop-menu clearfix pull-right">
                        <ul class="nav navbar-nav">

                            <c:if test="${sessionScope.account.roleId == 1}">
                            <li><a href="admin"><i class="fa fa-crosshairs"></i> Admin</a></li>
                            </c:if>
                            <li><a href="carts"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                            
                                <c:choose>
                                    <c:when test="${sessionScope.account==null}">
                                    <li><a href="login"><i class="fa fa-lock"></i> Login</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li><a href=""><i class="fa fa-user"></i> ${sessionScope.account.username}</a></li>
                                    <li><a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
                                    </c:otherwise>
                                </c:choose>
                                   
                            
                                    
                            </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->

    <div class="header-bottom"><!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">

                            <li><a href="HomeController" >Home</a></li>
                            <li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="product">Products</a></li>
                                    <li><a href="product-details.html">Product Details</a></li> 
                                    <li><a href="checkout.html">Checkout</a></li> 
                                    <li><a href="cart.html">Cart</a></li> 
                                    <li><a href="login.html">Login</a></li> 
                                </ul>
                            </li> 
                           
                            <li><a href="contact-us.html">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <form action="search" method="POST">
                <div class="col-sm-3">
                    <div class="search_box pull-right">
                        <input name="txt" value="${txtS}" type="text" placeholder="Search"/>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div><!--/header-bottom-->
</header><!--/header-->
