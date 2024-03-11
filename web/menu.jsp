<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%@ page import="java.io.IOException" %>  
<%@ include file="include/navbar.jsp" %>

<div class="blog-section">
    <style>
        .post-entry img{
            width: 100%;
            max-height: 250px;
        }
    </style>


    <div class="container">
        <form action="menu" method="post"> <!-- Thay "search" bằng đường dẫn xử lý tìm kiếm của bạn -->
            <div class="row">


                <div class="input-group mb-3 col-md-4">
                    <div style="margin: 0 10px 0 0">
                        <select name="conscious" class="form-select form-control" aria-label="ConsciousSelect" id="consciousSelect" onchange="loadDistricts()">
                            <c:forEach var="conscious" items="${consciouss}">
                                <option value="${conscious.consciousID}">${conscious.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div  id="districtSelectDiv" style="display:none; margin: 0 10px 0 0">
                        <select name="district" class="form-select form-control" aria-label="DistrictSelect" id="districtSelect">
                            <!-- District options will be populated dynamically using JavaScript -->
                        </select>
                    </div>

                    <input type="text" name="searchTerm" class="form-control" placeholder="Hôm nay bạn muốn ăn gì?" style="border-radius: 10px 0 0 10px;
    border: 1px solid #eee;">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit" style="border-radius:0px 8px 8px 0;">Tìm kiếm</button>
                    </div>
                </div>
                <div>${message}</div>
            </div>
        </form>








        <div class="row">
            <c:if test="${not empty products}">
                <c:forEach var="product" items="${products}">
                    <div class="col-12 col-sm-6 col-md-4 mb-5">
                        <div class="post-entry">
                            <a href="detail?id=${product.productId}" class="post-thumbnail"><img src="/fastfood/static/${product.imagePath}" alt="Image" class="img-fluid"></a>
                            <div class="post-content-entry">
                                <h3><a href="detail?id=${product.productId}}">${product.name}</a></h3>
                                <div class="meta">
                                    <span>with Price: <a href="detail?id=${product.productId}}">${product.price}</a></span>
                                    <br>
                                    <span> <a href="detail?=id=${product.productId}">BUY NOW</a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>








    </div>
</div>
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



<%@ include file="include/footer.jsp" %>