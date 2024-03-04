<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%@ page import="java.io.IOException" %>  
<%@ include file="include/navbar.jsp" %>
<!--HOME PAGE-->
<section class="hero">
    <div class="container button-banner">
        <div class="row justify-content-between">
            <div class="col-lg-5">
                <div class="intro-excerpt">
                   
                    <p><a href="" class="btn btn-secondary me-2">Đặt Ngay</a><a href="#" class="btn btn-white-outline">Xem Thêm</a></p>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="hero-img-wrap">
              
                </div>
            </div>
        </div>
    </div>
</section>


<section class="we-help-section">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-7 mb-5 mb-lg-0">
                <div class="imgs-grid">
                    <div class="grid grid-1"><img src="${pageContext.request.contextPath}/upload/post-1.jpeg"></div>
                    <div class="grid grid-2"><img src="${pageContext.request.contextPath}/upload/post-2.jpeg"></div>
                    <div class="grid grid-3"><img src="${pageContext.request.contextPath}/upload/post-3.jpeg"></div>
                </div>
            </div>
            <div class="col-lg-5 ps-lg-5">
                <h2 class="section-title mb-4">OI# - Hệ Thống Cung Cấp Đồ Ăn Nhanh Toàn Quốc</h2>
                <p>Hệ thống shipper trải dài bắc vào </p>

                <ul class="list-unstyled custom-list my-4">
                    <li>Nhận ưu đãi đặc biệt, dịch vụ chăm sóc tận tâm</li>
                    <li>Tiết kiệm chi phí mua hàng và giao hàng</li>
                    <li>An tâm mua sắm với dịch vụ chăm sóc</li>
                    <li>Tiện lợi, an toàn, trả tiền khi nhận hàng</li>
                </ul>
                <p><a href="#" class="btn">Explore</a></p>
            </div>
        </div>
    </div>
</section>

<section class="popular-product">
    <div class="container">
        <div class="row">

            <div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
                <div class="product-item-sm d-flex">
                    <div class="thumbnail">
                        <img src="${pageContext.request.contextPath}/static/images/khuyenmai.jpeg" class="img-fluid">
                    </div>
                    <div class="pt-3">
                        <h3>Khuyến mãi</h3>
                        <p>Khám phá cơ hội tuyệt vời với chương trình khuyến mãi đặc biệt của chúng tôi </p>
                        <p><a href="${pageContext.request.contextPath}/menu?s=promotion">Khám phá</a></p>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
                <div class="product-item-sm d-flex">
                    <div class="thumbnail">
                        <img src="${pageContext.request.contextPath}/static/images/monmoi.jpeg" class="img-fluid">
                    </div>
                    <div class="pt-3">
                        <h3>Món mới</h3>
                        <p>Hân hạnh giới thiệu đến bạn một trải nghiệm ẩm thực mới tuyệt vời với món ăn mới nhất </p>
                        <p><a href="${pageContext.request.contextPath}/menu?s=newest">Khám phá</a></p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<%@ include file="include/footer.jsp" %>