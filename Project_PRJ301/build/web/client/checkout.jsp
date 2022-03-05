<%-- 
    Document   : checkout
    Created on : Oct 25, 2021, 11:13:47 PM
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
                        <li class="active">Check out</li>
                    </ol>
                </div><!--/breadcrums-->
                <div class="review-payment">
                    <h2>Review & Payment</h2>
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
                            <tr>
                                <td colspan="4">&nbsp;</td>
                                <td colspan="2">
                                    <table class="table table-condensed total-result">
                                        <tr class="shipping-cost">
                                            <td>Shipping Cost</td>
                                            <td>Free</td>										
                                        </tr>
                                        <tr>
                                            <td>Total</td>
                                            <td><span>$${totalMoney}</span></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>

                <div class="shopper-informations">
                    <div class="row">

                        <div class="col-sm-5 clearfix">
                            <div class="bill-to">
                                <p>Bill To</p>
                                <form action="checkout" method="POST">
                                    <div class="form-one">
                                        <input type="text" name="name" placeholder="Full Name" style=" background: #F0F0E9;
                                               border: 0 none;
                                               margin-bottom: 10px;
                                               padding: 10px;
                                               width: 100%;
                                               font-weight: 300;">
                                        <input type="email" name="email" placeholder="Email" style=" background: #F0F0E9;
                                               border: 0 none;
                                               margin-bottom: 10px;
                                               padding: 10px;
                                               width: 100%;
                                               font-weight: 300;">
                                        <input type="text" name="phone" placeholder="PhoneNumber" style=" background: #F0F0E9;
                                               border: 0 none;
                                               margin-bottom: 10px;
                                               padding: 10px;
                                               width: 100%;
                                               font-weight: 300;">
                                        <textarea name="address"  placeholder="Address" rows="5"></textarea>
                                        <textarea name="note"  placeholder="Note" rows="5" style="margin-top: 10px"></textarea>
                                        <button href="checkout" class="btn btn-warning" style="margin-right: 26%; margin-bottom: 20px; margin-top: 10px;">Continue</button>
                                </form>			
                            </div>

                        </div>


                    </div>
                    </section> <!--/#cart_items-->

                    <%@include file="../components/footer.jsp" %>
                    </body>
                    </html>