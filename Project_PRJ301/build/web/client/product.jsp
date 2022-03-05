<%-- 
    Document   : product
    Created on : Oct 18, 2021, 9:28:39 PM
    Author     : quocb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <section id="advertisement">
            <div class="container">
                <img src="static/images/shop/advertisement.jpg" alt="" />
            </div>
        </section>

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            
                            
                            <!--category-products-->
                            <h2>Category</h2>
                            <div class="panel-group category-products" id="accordian">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Shoes
                                            </a>
                                        </h4>
                                    </div>
                                    
                                    <!--/ load tên brands shop-->
                                    <div id="sportswear" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul> 
                                                <c:forEach items="${listCategory}" var="o">
                                                        <li><a href="category?Category_id=${o.id}">${o.categoryName}</a></li> 
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>


                            </div><!--/category-products-->

                            <div class="brands_products"><!--brands_products-->
                                <h2>Brands</h2>
                                
                                <div class="brands-name">
                                    <ul class="nav nav-pills nav-stacked">
                                        <c:forEach items="${listCategory}" var="o">
                                        <li><a href="#"> <span class="pull-right">(${o.totalC})</span>${o.categoryName}</a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                               
                            </div><!--/category-productsr-->



                            <div class="price-range"><!--price-range-->
                                <h2>Price Range</h2>
                                <div class="well">
                                    <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
                                    <b>$ 0</b> <b class="pull-right">$ 600</b>
                                </div>
                            </div><!--/price-range-->

                            <div class="shipping text-center"><!--shipping-->
                                <img src="static/images/home/shipping.jpg" alt="" />
                            </div><!--/shipping-->

                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Features Items</h2>
                            
                            <c:forEach items="${listProduct}" var="product">
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="detail?id=${product.id}"><img src="${product.imageUrl}"/></a>
                                            <h2>${product.price}</h2>
                                            <a href="detail?id=${product.id}"><p>${product.name}</p></a>
                                            <a href="add-to-cart?productId=${product.id}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>
<!--                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>${product.price}</h2>
                                                <p>${product.description}</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                        </div>-->
                                    </div>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>          
                            </c:forEach>
                        
                              
                            <c:if test="${totalPage>1}">
                            <ul class="pagination" >
                                <li class ="${page<=1?"disabled":""}">
                                    <a href="product?page=${page-1}">&laquo;</a>
                                </li>
                                
                                <c:forEach begin="1" end="${totalPage}" var="p">
                                    <li class="${p==page?"active":""}"><a href="product?page=${p}">${p}</a></li>
                                </c:forEach>
                               
                                <li class ="${page>=2?"disabled":""}">
                                    <a href="product?page=${page+1}">&raquo;</a>
                                </li>
                            </ul>
                            </c:if>
                        </div><!--features_items-->
                    </div>
                </div>
            </div>
        </section>

        <%@include file="../components/footer.jsp" %>
    </body>
</html>
