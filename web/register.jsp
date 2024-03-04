<%-- 
    Document   : register
    Created on : Jan 17, 2024, 1:21:57 PM
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%@ page import="java.io.IOException" %>  
<%@ include file="include/navbar.jsp" %>



<section class="why-choose-section">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-5">
                <div class="img-wrap">
                    <img src="${pageContext.request.contextPath}/static/images/register.jpg" alt="Image" class="img-fluid">
                </div>

            </div>

            <div class="col-lg-5 container">
                <h2 class="section-title">Register</h2>
                <form action="register" method="post" oninput="repass.setCustomValidity(repass.value != userPass.value ? 'Passwords do not match.' : '')">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="userFullName" class="form-control" aria-describedby="emailHelp" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="userEmail" class="form-control" required>
                    </div>    

                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="userPass" class="form-control" required>
                    </div> 

                    <div class="mb-3">
                        <label class="form-label">Retype Password</label>
                        <input type="password" name="repass" class="form-control" required>
                    </div>    

                    <label>Role:</label>
                    <label><input type="radio" name="role" value="1" required> OWNER</label>
                    <label><input type="radio" name="role" value="2" required> SHIPPER</label>

                    <button type="submit" class="btn btn-primary">Register</button>
                    <div>${message}</div>
                    <p><a class="link-opacity-100-hover" href="login"> Đã là thành viên Fast Food</a></p>
                    <p><a class="link-opacity-100-hover" href="login?e=lostaccount">Quên mật khẩu?</a></p>
                </form>
            </div>
        </div>
    </div>
</section>




<%@ include file="include/footer.jsp" %>