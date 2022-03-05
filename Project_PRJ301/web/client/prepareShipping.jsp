<%-- 
    Document   : prepareShipping
    Created on : Oct 27, 2021, 9:09:39 PM
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
        <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Product Details | QB-Shopper</title>
        <link href="static/css/bootstrap.min.css" rel="stylesheet">
        <link href="static/css/font-awesome.min.css" rel="stylesheet">
        <link href="static/css/prettyPhoto.css" rel="stylesheet">
        <link href="static/css/price-range.css" rel="stylesheet">
        <link href="static/css/animate.css" rel="stylesheet">
        <link href="static/css/main.css" rel="stylesheet">
        <link href="static/css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->
    <body>
        <%@include file="../components/header.jsp" %>
        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">Shipping</li>
                    </ol>
                </div><!--/breadcrums-->
                <div class="review-payment">
                    <h2>List of Product</h2>
                </div>

                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Item</td>
                                <td class="description"></td>
                                <td class="price">Price</td>
                                <td class="quantity">Quantity</td>
                                <td class="total">Total</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${carts}" var="cart">
                                <tr>
                                    <td class="cart_product">
                                        <a href="detail"><img src="${cart.value.product.imageUrl}" alt=""></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4><a href="detail">${cart.value.product.name}</a></h4>
                                        <p>${cart.value.product.code}</p>
                                    </td>
                                    <td class="cart_price">
                                        <p>$${cart.value.product.price}</p>
                                    </td>
                                    <td class="cart_quantity" style="color: #696763; font-size: 18px; text-align: center" >
                                        ${cart.value.quantity}
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">$${cart.value.product.price * cart.value.quantity}</p>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                    <div class="text-right" style="margin-left: 70%">
                        <h4>Tổng tiền:$${totalMoney}</h4>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-3">
                        <div class="mt-5"><a onclick="document.getElementById('inf').submit()" class="btn btn-outline-success ml-auto w-100" style="border: 1px solid rgb(238,162,54); background-color: rgb(254,152,15); color: white; margin-bottom: 10px; padding-left: 22px">Shipping
                                to this address ...</a></div>
                        <div class="mt-3"><a onclick="document.getElementById('address').style.display = 'block'"
                                             class="btn btn-outline-info ml-auto w-100" style="border: 1px solid rgb(238,162,54); background-color: rgb(254,152,15); color: white">Shipping to another address</a></div>
                    </div>

                    <div class="col-md-9 mt-3">
                        <form id="inf" action="prepare-shipping" method="post"
                              style="border: 1px solid #ced4da !important; border-radius: 5px !important">
                            <div class="card">
                                <div class="card-body" style="margin: 10px 10px">
                                    <h4 style="color: orange">Địa chỉ giao hàng</h4>
                                    <h6 style="overflow: visible !important">Sản phẩm sẽ được giao tới địa chỉ dưới đây</h6><br>
                                    <div>Họ và tên:<span class="ml-4"> <b>${name}</b><span></span></span></div>
                                    <input type="hidden" name="name" value="${name}">
                                    <input type="hidden" name="phone" value="${phone}">
                                    <input type="hidden" name="address" value="${address}">
                                    <input type="hidden" name="note" value="${note}">
                                    <div>Số điện thoại: <span class="ml-4">${phone}<span></span></span></div>
                                    <div>Địa chỉ: <span class="ml-4">${address}</span></div>
                                    <div>Ghi chú:  <span class="ml-4">${note}</span></div>
                                </div>
                            </div>
                        </form>
                    </div>


                </div>
                <div class="row" style="margin-bottom: 50px">
                    <div class="col-md-3">

                    </div>
                    <div id="address" class="col-md-9 mt-5" style="display: none; margin-top: 30px">
                        <div class="card">
                            <div class="card-body" style="  border-radius: 5px !important">
                                <h4 class="mt-3" style="color: orange">Infomation of Customer</h4>
                                <div class="card mt-3">
                                    <div class="card-body">
                                        <form action="checkout" method="POST">
                                            <div class="form-group">
                                                <label for="name">Full Name</label>
                                                <input type="text" name="name" class="form-control"
                                                       placeholder="Enter name">
                                                <small id="emailHelp" class="form-text text-muted">Hiii</small>
                                            </div>
                                            <div class="form-group">
                                                <label for="sdt">Phone number</label>
                                                <input type="number" name="phone" class="form-control"
                                                       placeholder="enter phone number">
                                            </div>
                                            <div class="form-group">
                                                <label for="address">Address</label>
                                                <textarea class="form-control" rows="3" name="address"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="address">Note</label>
                                                <textarea class="form-control" rows="3" name="note"></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-success w-100" style="background-color: rgb(254,152,15); border: 1px solid rgb(238,162,54)">Accept</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section> <!--/#cart_items-->

        <%@include file="../components/footer.jsp" %>
    </body>
</html>
