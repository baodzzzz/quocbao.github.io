<%-- 
    Document   : home-admin
    Created on : Oct 30, 2021, 8:53:55 AM
    Author     : quocb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Language" content="en">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
        <meta name="description" content="This is an example dashboard created using build-in elements and components.">
        <meta name="msapplication-tap-highlight" content="no">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
        <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="static/css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="static/css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="static/css/templatemo-style.css">
    <body>
        <div class="container mt-5">
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <div class="tm-product-table-container">
                            <table class="table table-hover tm-table-small tm-product-table" id="grid">
                                <thead>
                                    <tr>
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">ID</th>
                                        <th scope="col">CODE</th>
                                        <th scope="col" data-type="string">PRODUCT NAME</th>
                                        <th scope="col" data-type="number">image</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Action</th>
                                        <th scope="col">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listproduct}" var="product">

                                        <tr >
                                            <th scope="row"></th>
                                            <td>${product.id}</td>

                                            <td>${product.code}</td>
                                            <td class="tm-product-name" onclick="document.location = 'edit-product?id=${product.id}'">${product.name}</td>
                                            <td><img src="${product.imageUrl}" alt="" /></td>
                                            <td>${product.price}</td>
                                            <td>${product.quantity}</td>
                                            <td>
                                                <a href="loadProduct?pid=${product.id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                <a href="delete?pid=${product.id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                        <a  href="#addEmployeeModal"  class="btn btn-primary btn-block text-uppercase mb-3" data-toggle="modal">Add new product</a>
                        <button class="btn btn-primary btn-block text-uppercase">
                            Delete selected products
                        </button>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-product-categories">
                        <h2 class="tm-block-title">Product Categories</h2>
                        <div class="tm-product-table-container">
                            <table class="table tm-table-small tm-product-table">
                                <tbody>
                                    <c:forEach items="${listCategories}" var="category">
                                        <tr>
                                            <td class="tm-product-name">${category.categoryName}</td>
                                            <td class="text-center">
                                                <a href="#" class="tm-product-delete-link">
                                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                       
                    </div>
                </div>

                <div id="addEmployeeModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="add" method="POST">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Add Product</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">
                                     <div class="form-group">
                                        <label>Code</label>
                                        <input name="code" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input name="name" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Quantity</label>
                                        <input name="quantity" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Price</label>
                                        <input name="price" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="description" class="form-control" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Image</label>
                                        <input name="image" type="text" class="form-control" required>
                                    </div>
                                  
                                    <div class="form-group">
                                        <label>CategoryID</label>
                                        <input name="cid" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Category</label>
                                        <select name="category" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${listCategories}" var="category">
                                                <option value="${category.id}">${category.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                    <input type="submit" class="btn btn-success" value="Add">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
                                                grid.onclick = function (e) {
                                                    if (e.target.tagName != 'TH')
                                                        return;

                                                    let th = e.target;
                                                    // if TH, then sort
                                                    // cellIndex is the number of th:
                                                    //   0 for the first column
                                                    //   1 for the second column, etc
                                                    sortGrid(th.cellIndex, th.dataset.type);
                                                };

                                                function sortGrid(colNum, type) {
                                                    let tbody = grid.querySelector('tbody');

                                                    let rowsArray = Array.from(tbody.rows);

                                                    // compare(a, b) compares two rows, need for sorting
                                                    let compare;

                                                    switch (type) {
                                                        case 'number':
                                                            compare = function (rowA, rowB) {
                                                                return rowA.cells[colNum].innerHTML - rowB.cells[colNum].innerHTML;
                                                            };
                                                            break;
                                                        case 'string':
                                                            compare = function (rowA, rowB) {
                                                                return rowA.cells[colNum].innerHTML > rowB.cells[colNum].innerHTML ? 1 : -1;
                                                            };
                                                            break;
                                                    }

                                                    // sort
                                                    rowsArray.sort(compare);

                                                    tbody.append(...rowsArray);
                                                }
        </script>
    </body>
</html>

