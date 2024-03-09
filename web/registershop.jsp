<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%@ page import="java.io.IOException" %>  
<%@ include file="include/navbar.jsp" %>
<section class="why-choose-section">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-5">
                <div class="img-wrap">
                    <img src="${pageContext.request.contextPath}/static/images/shop.jpg" alt="Image" class="img-fluid">
                </div>

            </div>
            <div class="col-lg-5 container">
                <h2 class="section-title">Create Online Shop</h2>
                <form action="workingpage" method="post" oninput="repass.setCustomValidity(repass.value != userPass.value ? 'Passwords do not match.' : '')">
                    <div class="mb-3">
                        <label class="form-label">Shop Name</label>
                        <input type="text" name="shopname" class="form-control" aria-describedby="emailHelp" required>
                    </div>



                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input type="text" name="shopphone" class="form-control" aria-describedby="emailHelp" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">TAX CODE</label>
                        <input type="text" name="shoptaxcode" class="form-control" aria-describedby="emailHelp" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Shop Decription</label>
                        <textarea name="shopdecription" class="form-control" aria-label="With textarea"></textarea>
                    </div> 

                    <div class="mb-3">
                        <label class="form-label">Conscious</label>
                        <select class="form-select form-control" aria-label="ConsciousSelect" id="consciousSelect" onchange="loadDistricts()">
                            <c:forEach var="conscious" items="${consciouss}">
                                <option value="${conscious.consciousID}">${conscious.name}</option>
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
                        <label class="form-label">Address</label>
                        <input type="text" name="shopaddress" class="form-control" aria-describedby="emailHelp" required>
                    </div>

                    <script>
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
                                        })
                                        .catch(error => console.error('Error loading data.json:', error));
                            } else {
                                // If no Conscious is selected, hide the District select
                                districtSelectDiv.style.display = "none";
                            }
                        }

                        // Trigger initial load
                        loadDistricts();
                    </script>

                    <div>${message}</div>
                    <button type="submit" class="btn btn-primary">Create</button>
                </form>
            </div>
        </div>
    </div>
</section>
<%@ include file="include/footer.jsp" %>