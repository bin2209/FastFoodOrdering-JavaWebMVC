<%-- 
    Document   : register
    Created on : Jan 17, 2024, 1:21:57 PM
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%@ page import="java.io.IOException" %>  
<%@ include file="include/navbar.jsp" %>

<%

%>0
<section class="why-choose-section">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-5">
                <div class="img-wrap">
                    <img src="${pageContext.request.contextPath}/static/images/register.jpg" alt="Image" class="img-fluid">
                </div>

            </div>  

            <div class="col-lg-5 container">
                <h2 class="section-title">Forgot your password?</h2>
                <p>Chúng tôi sẽ gửi cho bạn một email có liên kết để đặt lại mật khẩu của bạn.</p>
                <form action="" method="post">
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="user" class="form-control" placeholder="Enter your email" aria-describedby="emailHelp" required>
                    </div>



                    <button type="submit" class="btn btn-primary">Send email reset password</button>
                    <p><a class="link-opacity-100-hover" href="login">Trở về đăng nhập</a></p>
                    <p><a class="link-opacity-100-hover" href="?e=register">Đăng ký tài khoản</a></p>
                </form>
            </div>
        </div>
    </div>
</section>




<%@ include file="include/footer.jsp" %>