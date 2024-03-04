<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="custom-navbar navbar navbar-expand-md navbar-dark bg-dark" aria-label="Furni navigation bar">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}">
            <img class="logo" src="${pageContext.request.contextPath}/static/images/logo.png" alt="alt"/>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsFurni">
            <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                <li><a class="nav-link" href="${pageContext.request.contextPath}">Home</a></li>
                <li><a class="nav-link active" href="${pageContext.request.contextPath}/menu">Menu</a></li>
                <li><a class="nav-link" href="${pageContext.request.contextPath}/service">Services</a></li>
                <li><a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact us</a></li>
            </ul>

            <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                <%// HttpSession session = request.getSession(false);
                    if (session != null && session.getAttribute("USER") != null) {
                %>
                <li>
                    <a class="nav-link dropdown-toggle"  id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="${pageContext.request.contextPath}/static/images/user.svg">
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="account">Account Detail</a>
                        <a class="dropdown-item" href="logout">Logout</a>
                    </div>
                </li>
                <% } else { %>
                <li><a class="nav-link" href="${pageContext.request.contextPath}/login"><img src="${pageContext.request.contextPath}/static/images/user.svg"></a></li>

                <% }%>
                
               
                <li><a class="nav-link" href="${pageContext.request.contextPath}/ordermanager"><img src="${pageContext.request.contextPath}/static/images/cart.svg"></a></li>
            </ul>
            
            
        </div>
    </div>
</nav>
