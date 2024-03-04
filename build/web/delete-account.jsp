<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/navbar.jsp" %>


<title>${pageTitle}</title>


<section class="untree_co-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mb-5 mb-md-0">
                <div class="p-3 p-lg-5 rounded-5 bg-white">
                    <h2 class="h3 mb-3 text-black"> Hi ${USER.name}!</h2>
                    <p><a href="logout">Logout</a></p>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="account">Account Detail</a></li>
                        <li class="list-group-item"><a href="account?e=billing-setting">Billing settings</a></li>
                        <li class="list-group-item"><a href="account?e=change-pass">Change password</a></li>
                        <li class="list-group-item"><a href="account?e=delete-account">Delete account</a></li>
                    </ul>
                </div>
            </div>
                    
                    
                    
            <form action="update" method="post" class="col-md-6 mb-5 mb-md-0">
                <div class="p-3 p-lg-5 rounded-5 bg-white">
                    <h2 style="text-align: center;">Delete Account</h2>

                    <div class="mb-3">
                        <p class="form-label">Are you sure you want to delete your account?</p>
                       
                    </div>
                    <div>${message}</div>
                    <button href="#" class="my-4 btn">Delete</button>
                </div>
            </form>
        </div>
    </div>
</section>

<%@ include file="include/footer.jsp" %>