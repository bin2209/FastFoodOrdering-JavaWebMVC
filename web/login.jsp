<%-- 
    Document   : login.jsp
    Created on : Jan 13, 2024, 7:35:58 PM
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
                <h2 class="section-title">Login</h2>

                <form action="login" method="post">
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="text" name="email"  value="${cookie["user"].value}" class="form-control" aria-describedby="emailHelp" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control"  required>
                    </div>    
                    <div>${message}</div>
                    <button type="submit" class="btn btn-primary">Login</button>
                    <input class="remember" type="checkbox" name="rm" value="1">Remember me</input>
                    <p><a class="link-opacity-100-hover" href="login?e=register">Trở thành thành viên của ÔI#</a></p>
                    <p><a class="link-opacity-100-hover" href="login?e=lostaccount">Quên mật khẩu?</a></p>
                </form>
            </div>
        </div>
    </div>
</section>




<%@ include file="include/footer.jsp" %>