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
                                <a class="mb-0" href="">Remove shop</a>
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
                                <ul class="list-group list-group-flush rounded-3">
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <p class="mb-0">#001</p>
                                        <p class="mb-0">Name product</p>
                                        <p class="mb-0">Price</p>
                                        <p class="mb-0"><a href="">Show</a> | <a href="">Edit</a> | <a href="">Remove</a></p>

                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <p class="mb-0">#002</p>
                                        <p class="mb-0">Name product</p>
                                        <p class="mb-0">Price</p>
                                        <p class="mb-0"><a href="">Show</a> | <a href="">Edit</a> | <a href="">Remove</a></p>

                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <p class="mb-0">#003</p>
                                        <p class="mb-0">Name product</p>
                                        <p class="mb-0">Price</p>
                                        <p class="mb-0"><a href="">Show</a> | <a href="">Edit</a> | <a href="">Remove</a></p>
                                    </li>
                                </ul>
                                <div class="d-flex mb-2" style="justify-content: right">
                                    <a class="btn btn-primary" data-toggle="modal" data-target="#addProduct">Add new product</a>
                                </div>





                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="addProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add New Product</h5>
                        <button class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>

                    <form action="uploadproduct"  method="post" enctype="multipart/form-data">
                        <div class="modal-body">

                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="inputEmail4">Product Name</label>
                                    <input type="text" name="productname" class="form-control" id="inputEmail4" placeholder="Product Name">
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="inputEmail4">Price</label>
                                    <input type="text" name="productprice" class="form-control" id="inputPassword4" placeholder="Price">
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="inputPassword4">Description</label>
                                    <input type="text" name="productdescription" class="form-control" id="inputPassword4" placeholder="Description">
                                </div>

                                <hr>
                                <div class="form-group col-md-12">
                                    <label for="fileInput">Product image</label>
                                    <input multiple type="file"  id="fileInput" name="file" accept="image/*" required>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="submit" data-dismiss="modal">Add New</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</section>
<%@ include file="include/footer.jsp" %>