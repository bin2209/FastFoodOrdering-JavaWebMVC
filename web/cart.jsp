<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%@ page import="java.io.IOException" %>  
<%@ include file="include/navbar.jsp" %>





<section class="untree_co-section">
    <div class="container">
        <div class="row d-flex justify-content-center align-items-center h-100 card">
            <div class="card-body p-4">
                <div class="row">
                    <div class="col-lg-7">
                        <h5 class="mb-3"><a href="javascript:history.back()" class="text-body"><i
                                    class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                        <hr>
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div>
                                <p class="mb-0">You have 4 items in your cart</p>
                            </div>
                        </div>

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex flex-row align-items-center">
                                        <div>
                                            <img src="${pageContext.request.contextPath}/upload/post-1.jpeg" class="img-fluid rounded-3" style="width: 65px;">
                                        </div>
                                        <div class="ms-3">
                                            <h5>Bun mam</h5>
                                            <p class="small mb-0">Nguoi ban , Mo ta</p> 
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center">
                                        <div style="width: 50px;">
                                            <h5 class="fw-normal mb-0">2</h5>
                                        </div>
                                        <div style="width: 80px;">
                                            <h5 class="mb-0">$900</h5>
                                        </div>
                                        <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex flex-row align-items-center">
                                        <div>
                                            <img src="${pageContext.request.contextPath}/upload/post-1.jpeg" class="img-fluid rounded-3" style="width: 65px;">
                                        </div>
                                        <div class="ms-3">
                                            <h5>Bun mam</h5>
                                            <p class="small mb-0">Nguoi ban , Mo ta</p> 
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center">
                                        <div style="width: 50px;">
                                            <h5 class="fw-normal mb-0">2</h5>
                                        </div>
                                        <div style="width: 80px;">
                                            <h5 class="mb-0">$900</h5>
                                        </div>
                                        <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex flex-row align-items-center">
                                        <div>
                                            <img src="${pageContext.request.contextPath}/upload/post-1.jpeg" class="img-fluid rounded-3" style="width: 65px;">
                                        </div>
                                        <div class="ms-3">
                                            <h5>Bun mam</h5>
                                            <p class="small mb-0">Nguoi ban , Mo ta</p> 
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center">
                                        <div style="width: 50px;">
                                            <h5 class="fw-normal mb-0">1</h5>
                                        </div>
                                        <div style="width: 80px;">
                                            <h5 class="mb-0">$1199</h5>
                                        </div>
                                        <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-3 mb-lg-0">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex flex-row align-items-center">
                                        <div>
                                            <img src="${pageContext.request.contextPath}/upload/post-1.jpeg" class="img-fluid rounded-3" style="width: 65px;">
                                        </div>
                                        <div class="ms-3">
                                            <h5>Bun mam</h5>
                                            <p class="small mb-0">Nguoi ban , Mo ta</p> 
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center">
                                        <div style="width: 50px;">
                                            <h5 class="fw-normal mb-0">1</h5>
                                        </div>
                                        <div style="width: 80px;">
                                            <h5 class="mb-0">$1799</h5>
                                        </div>
                                        <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-5">
                        <div class="card bg-primary text-white rounded-3">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <h5 class="mb-0">My Cart</h5>
                                </div>
                                <p class="small mb-2">Available in new update 2025</p>
                                
                                <i class="fab fa-cc-mastercard fa-2x me-2"></i>
                                <i  class="fab fa-cc-visa fa-2x me-2"></i>
                                <i class="fab fa-cc-amex fa-2x me-2"></i>
                                <i class="fab fa-cc-paypal fa-2x"></i>

                                <form >
                                    <div class="col-md-12">
                                        <div class="form-outline form-white">
                                            <label class="form-label" for="typeText">Payment Method </label>
                                            <select class="form-control form-control-lg" />
                                            <option value="value" selected>Cash On Receipt</option>
                                            </select>
                                        </div>
                                    </div>  
                                </form>

                                <hr class="my-4">

                                <div class="d-flex justify-content-between">
                                    <p class="mb-2">Tam tinh</p>
                                    <p class="mb-2">100 VND</p>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <p class="mb-2">Phi ship</p>
                                    <p class="mb-2">20 VND</p>
                                </div>

                                <div class="d-flex justify-content-between mb-4">
                                    <p class="mb-2">Tong</p>
                                    <p class="mb-2">120 VND</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <button type="button" class="btn btn-info btn-block btn-lg">
                                        <span>120 VND</span>
                                        <span>Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                    </button>                                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="include/footer.jsp" %>