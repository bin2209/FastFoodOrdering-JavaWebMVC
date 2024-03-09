<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/navbar.jsp" %>
<%@page  contentType="text/html" pageEncoding="utf-8" %>
<%@page import="java.util.ArrayList,model.*"%>


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
            <form action="account" method="post" class="col-md-6 mb-5 mb-md-0">
                <div class="p-3 p-lg-5 rounded-5 bg-white">
                    <h2 style="text-align: center;">Account Update</h2>

                    <div class="mb-3" hidden>
                        <label class="form-label" >ID</label>
                        <input type="text" class="form-control" name="id" value="${USER.staffID}">
                    </div>

                    <div class="mb-3" hidden>
                        <label class="form-label" >PassWord</label>
                        <input type="password" class="form-control" name="pass" value="${USER.password}">
                    </div>

                    <div class="mb-3" hidden>
                        <label class="form-label" >Role</label>
                        <input type="text" class="form-control" name="role" value="${USER.role}">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Full name</label>
                        <input type="text" class="form-control" name="name" value="${USER.name}">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone number </label>
                        <input type="text" class="form-control" name="phone" value="${USER.phone}">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email address</label>
                        <input type="email" class="form-control" name="mail" value="${USER.email}" readonly>
                    </div>


                    <c:set var="gender" value="${USER.gender}" />

                    <c:set var="checkedMale" value=""/>
                    <c:set var="checkedFemale" value=""/>
                    <c:set var="checkedLesbian" value=""/>
                    <c:set var="checkedNA" value=""/>

                    <c:choose>
                        <c:when test="${'Male' eq gender}">
                            <c:set var="checkedMale" value="checked" />
                        </c:when>
                        <c:when test="${'Female' eq gender}">
                            <c:set var="checkedFemale" value="checked" />
                        </c:when>
                        <c:when test="${'Lesbian' eq gender}">
                            <c:set var="checkedLesbian" value="checked" />
                        </c:when>
                        <c:when test="${'NA' eq gender}">
                            <c:set var="checkedNA" value="checked" />
                        </c:when>
                        <c:otherwise>
                            <!-- If gender is null or has no value -->
                            <c:set var="checkedMale" value="" />
                            <c:set var="checkedFemale" value="" />
                            <c:set var="checkedLesbian" value="" />
                            <c:set var="checkedNA" value="" />
                        </c:otherwise>
                    </c:choose>

                    <div class="mb-3">
                        <label>Gender:</label>
                        <label><input type="radio" name="gender" value="M" <c:out value="${checkedMale}" /> required> Nam</label>
                        <label><input type="radio" name="gender" value="F" <c:out value="${checkedFemale}" /> required> Nữ</label>
                        <label><input type="radio" name="gender" value="L" <c:out value="${checkedLesbian}" /> required> Lesbian</label>
                        <label><input type="radio" name="gender" value="NA" <c:out value="${checkedNA}" /> required> NA</label>
                    </div>
                    



                    <div class="mb-3">
                        <label class="form-label">Role</label>
                        <c:if test="${USER.role == 1}">
                            <input type="text" class="form-control" name="role" value="OWNER" readonly>
                        </c:if>
                        <c:if test="${USER.role == 2}">
                            <input type="text" class="form-control" name="role" value="SHIPPER" readonly>
                        </c:if>
                        <!-- Thêm các điều kiện khác nếu cần -->
                    </div>


                    <div class="mb-3">
                        <label class="form-label">Conscious</label>
                        <select class="form-select form-control" aria-label="ConsciousSelect" id="consciousSelect" onchange="loadDistricts()">
                            <c:forEach var="conscious" items="${consciouss}">
                                <option value="${conscious.consciousID}" <c:if test="${conscious.consciousID == con1}">selected</c:if>>${conscious.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3" id="districtSelectDiv" style="display:none;">
                        <label class="form-label">District</label>
                        <select name="district" class="form-select form-control" aria-label="DistrictSelect" id="districtSelect">
                            <!-- District options will be populated dynamically using JavaScript -->
                        </select>
                    </div>



                    <div class="mb-3">
                        <label class="form-label">Address </label>
                        <input type="text" class="form-control" name="address" value="${USER.address}">
                    </div>

                    <button href="#" class="my-4 btn">Update</button>

                    <div>${message}</div>
                </div>
            </form>
        </div>
    </div>
</section>

<script>
    // Set default value for District select
    var defaultDistrictID = "${dis}"; // Assuming USER has districtID property

    // Function to load Districts
    function loadDistricts() {
        var selectedConsciousID = consciousSelect.value;

        // Clear previous options
        districtSelect.innerHTML = "";

        // Check if a Conscious is selected
        if (selectedConsciousID) {
            // Make an AJAX request to fetch Districts based on the selected ConsciousID
            var url = "${pageContext.request.contextPath}/static/json/data.json"; // Update the path accordingly

            // Assume you have a function fetchDistrictsFromServer(url) to handle the AJAX request
            fetch(url)
                    .then(response => response.json())
                    .then(data => {
                        var districts = data.District.filter(d => d.ConsciousID == selectedConsciousID);

                        // Populate District options
                        districts.forEach(function (district) {
                            var option = document.createElement("option");
                            option.value = district.DistrictID;
                            option.text = district.Name;
                            districtSelect.appendChild(option);
                        });

                        // Display the District select
                        districtSelectDiv.style.display = "block";

                        // Set default value if available
                        if (defaultDistrictID) {
                            districtSelect.value = defaultDistrictID;
                        }
                    })
                    .catch(error => console.error('Error loading data.json:', error));
        } else {
            // If no Conscious is selected, hide the District select
            districtSelectDiv.style.display = "none";
        }
    }

    // Trigger initial load and set default value
    loadDistricts();
</script>


<%@ include file="include/footer.jsp" %>