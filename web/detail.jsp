<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%@ page import="java.io.IOException" %>  
<%@ include file="include/navbar.jsp" %>

<div class="blog-section">
    <style>
    .card img{
        width: 100%;
    }
</style>
    <div class="container">
        <div class="row">
            <div class="container mt-5 mb-5">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10">
                        <div class="card">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="images p-3">
                                        <img src="/fastfood/static/${pro.imagePath}"/> 
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="product p-4">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="d-flex align-items-center"><a href="javascript:history.back()" class="text-body"> <i class="fa fa-long-arrow-left"></i> <span class="ml-1">Back</span></a> </div> <i class="fa fa-shopping-cart text-muted"></i>
                                        </div>
                                        <div class="mt-4 mb-3"> <span class="text-uppercase text-muted brand">${shop.name}</span>
                                            <h5 class="text-uppercase">${pro.name}</h5>
                                            <div class="price d-flex flex-row align-items-center"> <span class="act-price">${pro.price}</span>
                                            </div>
                                        </div>
                                        <p class="about"> ${pro.productDescription}</p>
                                        <div class="sizes mt-2">
                                            <h6 class="text-uppercase">So luong</h6> 
                                            <input type="number" name="email" value="1" class="form-control " min="1" max="5" required="">
                                        </div>
                                        <div class="cart mt-4 align-items-center"> <button class="btn btn-danger text-uppercase mr-2 px-4">Add to cart</button> <i class="fa fa-heart text-muted"></i> <i class="fa fa-share-alt text-muted"></i> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="include/footer.jsp" %>