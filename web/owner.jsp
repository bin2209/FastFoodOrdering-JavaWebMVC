<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%@ page import="java.io.IOException" %>  
<%@ include file="include/navbar.jsp" %>
<%@page import="java.util.ArrayList,model.*"%>

<section style="background-color: #eee;">
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
<!--                        <img src="${pageContext.request.contextPath}/static/images/user-default.webp" alt="avatar"
                             class="rounded-circle img-fluid" style="width: 140px; border: 4px solid #007bff; padding: 8px;">-->
                        <h5 class="my-3">${SHOP.name}</h5>
                        <p class="text-muted mb-1">${SHOP.phone}</p>
                        <p class="text-muted mb-4">${SHOPaddress}</p>
                        <p class="text-muted mb-4">${SHOP.description}</p>

                    </div>
                </div>

                <div class="card mb-4 mb-lg-0">
                    <div class="card-body p-0">
                        <ul class="list-group list-group-flush rounded-3">
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fas fa-globe fa-lg text-warning"></i>
                                <a class="mb-0" href="">Edit brand information</a>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fas fa-globe fa-lg text-warning"></i>
                                <a class="mb-0" href="">View History</a>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fas fa-globe fa-lg text-warning"></i>
                                <a class="mb-0" href="">Create Discount</a>
                            </li>

                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fas fa-globe fa-lg text-warning"></i>
                                <a class="mb-0"  data-toggle="modal" data-target="#deleteShop">Delete shop</a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Full Name</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">${USER.name}</p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Email</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">${USER.email}</p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Phone</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">${USER.phone}</p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Address</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">${USERaddress}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card mb-4 mb-md-0">
                            <div class="card-body">
                                <p class="mb-4"><span class="text-primary font-italic me-1">All Product</span></p>

                                <c:if test="${not empty products}">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <!--<th>ID</th>-->
                                                <th>Name Product</th>
                                                <th>Price</th>
                                                <th>Show</th>
                                                <th>Edit</th>
                                                <th>Remove</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="product" items="${products}">
                                                <tr>
                                                    <!--<td>${product.productId}</td>-->
                                                    <td>${product.name}</td>
                                                    <td>${product.price}</td>
                                                    <td>
                                                        <input type="hidden" name="name" value="${product.name}">
                                                        <a class="btn btn-primary" data-toggle="modal" data-target="#show${product.productId}">Show</a>

                                                    </td>
                                                    <td>
                                                        <input type="hidden" name="name" value="${product.name}">
                                                        <a class="btn btn-primary" data-toggle="modal" data-target="#editProduct${product.productId}">Edit</a>

                                                    </td>
                                                    <td>
                                                        <input type="hidden" name="name" value="${product.name}">
                                                        <a class="btn btn-primary" data-toggle="modal" data-target="#deleteProduct${product.productId}">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>

                                <div class="d-flex justify-content-end mb-2">
                                    <a class="btn btn-primary" data-toggle="modal" data-target="#addProduct">Add new product</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

                            
                            
                            
                            
                            
                            
                            

        <!--loop modal to show-->
        <c:forEach var="product" items="${products}">
            <div class="modal fade" id="show${product.productId}" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Show Product</h5>
                            <button class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <img style="width:100%; max-height: 250px" scr="${pageContext.request.contextPath}/upload/${product.imagePath}"/>
                            </div>
                            <div class="form-group">
                                <label for="productNameInput">Product Name:</label>
                                <input type="text" class="form-control" id="productNameInput" value="${product.name}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="productPriceInput">Product Price:</label>
                                <input type="text"  class="form-control" value="${product.price} VND" disabled>
                            </div>
                            <div class="form-group">
                                <label for="productDescriptionInput">Product Description:</label>
                                <textarea class="form-control" id="productDescriptionInput" value="${product.productDescription}" disabled></textarea>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>





        <!--loop modal to edit-->
        <c:forEach var="product" items="${products}">
            <div class="modal fade" id="editProduct${product.productId}" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit Product #${product.productId}</h5>
                            <button class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <form action="addnewproduct" method="post" enctype="multipart/form-data">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="productNameInput">Product Name:</label>
                                    <input type="text" class="form-control" id="productNameInput" name="productName" value="${product.name}" required>
                                </div>
                                <div class="form-group">
                                    <label for="productPriceInput">Product Price:</label>
                                    <input type="number"  class="form-control" id="productPriceInput" name="productPrice" value="${product.price}" required>
                                </div>
                                <div class="form-group">
                                    <label for="productDescriptionInput">Product Description:</label>
                                    <textarea class="form-control" id="productDescriptionInput" name="productDescription" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="fileInput">Choose Image File:</label>
                                    <input multiple type="file" class="form-control-file" id="fileInput" name="file" accept="image/*" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Edit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>


        <!--loop modal to DELETE-->
        <c:forEach var="product" items="${products}">
            <div class="modal fade" id="deleteProduct${product.productId}" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form action="workingpage"  method="post">
                            <div class="modal-header">
                                <h5 class="modal-title">Delete Product #${product.productId}</h5>
                                <button class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">                   
                                <input type="text" name="action" value="deleteProduct" hiden style="display: none">
                                <input type="text" name="productID" value="${product.productId}" hiden style="display: none">

                                <div class="form-row">
                                    <p>Do you want to Delete product #${product.productId}?</p>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="submit">Delete</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>







        <!--UPLOAD PRODUCT-->
        <div class="modal fade" id="addProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add New Product</h5>
                        <button class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <form action="addnewproduct" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="productNameInput">Product Name:</label>
                                <input type="text" class="form-control" id="productNameInput" name="productName" required>
                            </div>
                            <div class="form-group">
                                <label for="productPriceInput">Product Price:</label>
                                <input type="number"  class="form-control" id="productPriceInput" name="productPrice" required>
                            </div>
                            <div class="form-group">
                                <label for="productDescriptionInput">Product Description:</label>
                                <textarea class="form-control" id="productDescriptionInput" name="productDescription" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="fileInput">Choose Image File:</label>
                                <input multiple type="file" class="form-control-file" id="fileInput" name="file" accept="image/*" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Add New</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--SHOP IS SINGLE--> 
        <!--DELETE SHOP-->
        <div class="modal fade" id="deleteShop" tabindex="-1" role="dialog"     aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form action="workingpage"  method="post">
                        <div class="modal-header">
                            <h5 class="modal-title">Delete Shop</h5>
                            <button class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">                   
                            <input type="text" name="action" value="deleteshop" hiden style="display: none">
                            <input type="text" name="shopID" value="${SHOP.shopID}" hiden style="display: none">

                            <div class="form-row">
                                <p>Do you want to Delete shop?</p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="submit">Delete</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>



</section>
<%@ include file="include/footer.jsp" %>