<%-- 
    Document   : cart
    Created on : Oct 24, 2021, 3:55:39 PM
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
        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">Shopping Cart</li>
                    </ol>
                </div>
                <c:choose>       
                    <c:when test="${carts==null||carts.size()==0}">
                        <div class="alert alert-warning" role="alert">
                            Giỏ hàng trống!!!
                        </div>
                        <a href="product" class="btn btn-outline-success" style="border: 1px solid #FAEBCC; background-color: rgb(252,248,227); color: rgb(164,141,98)" >Shopping Now ...</a>
                    </c:when>
                    <c:otherwise>
                    <div class="table-responsive cart_info">
                            
                        <form id="formQuantity" action="update-cart" method="GET">
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
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button"> <!-- mỗi lần thay đổi giá trị gọi về svlet cập nhật quantity-->

                                            <input onchange="this.form.submit()" type="number" min="1" max="${cart.value.product.quantity}" class="cart_quantity_input" name="quantity${cart.value.product.id}" value="${cart.value.quantity}"
                                                       style="width: 50px">
                                    
                                        </div>  
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">$${cart.value.product.price * cart.value.quantity}</p>
                                    </td>
                                    <td class="cart_delete">
                                        <a class="cart_quantity_delete" href="cart-delete?productId=${cart.value.product.id}"><i class="fa fa-times"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>
                        </form>
                        <div class="text-right">
                            <a href="cart-delete?productId=-1" class="btn btn-warning" style="margin: 20px 20px">Delete Cart</a>
                        </div>
                </div>
                    </c:otherwise>
            </c:choose>
              
            </div>
        </section> <!--/#cart_items-->

        <section id="do_action">
            <div class="container">
                <div class="heading">
                    <h3>What would you like to do next?</h3>
                    <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="chose_area">
                            <ul class="user_option">
                                <li>
                                    <input type="checkbox">
                                    <label>Use Coupon Code</label>
                                </li>
                                <li>
                                    <input type="checkbox">
                                    <label>Use Gift Voucher</label>
                                </li>
                                <li>
                                    <input type="checkbox">
                                    <label>Estimate Shipping & Taxes</label>
                                </li>
                            </ul>
                            <ul class="user_info">
                                <li class="single_field">
                                    <label>Country:</label>
                                    <select>
                                        <option>United States</option>
                                        <option>Bangladesh</option>
                                        <option>UK</option>
                                        <option>India</option>
                                        <option>Pakistan</option>
                                        <option>Ucrane</option>
                                        <option>Canada</option>
                                        <option>Dubai</option>
                                    </select>

                                </li>
                                <li class="single_field">
                                    <label>Region / State:</label>
                                    <select>
                                        <option>Select</option>
                                        <option>Dhaka</option>
                                        <option>London</option>
                                        <option>Dillih</option>
                                        <option>Lahore</option>
                                        <option>Alaska</option>
                                        <option>Canada</option>
                                        <option>Dubai</option>
                                    </select>

                                </li>
                                <li class="single_field zip-field">
                                    <label>Zip Code:</label>
                                    <input type="text">
                                </li>
                            </ul>
                            <a class="btn btn-default update" href="">Get Quotes</a>
                            <a class="btn btn-default check_out" href="">Continue</a>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="total_area">
                            <ul>
                                <li>Shipping Cost <span>Free</span></li>
                                <li>Total <span>${totalMoney}</span></li>
                            </ul>
                            <a class="btn btn-default check_out" href="checkout" style="margin-left: 40px">Check Out</a>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--/#do_action-->
        <%@include file="../components/footer.jsp" %>

    </body>
</html>



