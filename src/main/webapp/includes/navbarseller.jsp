<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
    /* Navbar Styles */
    .navbar {
        background-color: #232F3E; /* Amazon's dark blue background color */
        padding: 0.5rem 1rem;
    }
    .navbar .navbar-brand {
        color: #ffffff;
        font-weight: bold;
        font-size: 1.25rem;
        margin-right: 15px;
    }
    .navbar .nav-link {
        color: #ffffff; /* White text for all navbar items */
        font-size: 1rem;
        margin: 0 15px;
    }
    .navbar .nav-link.active {
        background-color: #ff9900; /* Amazon's orange for active link */
        color: #ffffff;
        font-weight: bold;
    }
    .navbar .dropdown-menu {
        background-color: #232F3E; /* Dark blue background for the dropdown to match the navbar */
        border-radius: 4px; /* Slightly rounded corners */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        margin-top: 10px;
    }
    .navbar .dropdown-item {
        color: #ffffff; /* White text for dropdown items */
        padding: 10px 20px;
        transition: background-color 0.3s ease, color 0.3s ease;
    }
    .navbar .dropdown-item:hover, .navbar .dropdown-item:focus {
        background-color: #ff9900; /* Amazon's orange color on hover */
        color: #ffffff; /* White text on hover */
    }
    .btn-outline-success {
        border-color: #ff9900; /* Amazon's gold border */
        color: #ff9900;
        transition: background-color 0.3s ease, color 0.3s ease;
        font-size: 1rem;
        margin-left: 10px;
    }
    .btn-outline-success:hover, .btn-outline-success:focus {
        background-color: #ff9900; /* Gold background on hover */
        color: #ffffff; /* White text on hover */
    }
    .form-control {
        border-radius: 0;
        border-color: #ddd;
    }
    @media (max-width: 768px) {
        .navbar .navbar-brand {
            font-size: 1rem;
        }
        .navbar .nav-link {
            font-size: 0.875rem;
        }
        .btn-outline-success {
            font-size: 0.875rem;
        }
        .form-control {
            width: 100%;
        }
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
        <!-- Left Section: RevShop Brand -->
        <a class="navbar-brand" href="sellerHomepage.jsp">RevShop</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#responsiveNavbar" aria-controls="responsiveNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Right Section: Links -->
        <div class="collapse navbar-collapse" id="responsiveNavbar">
            <ul class="navbar-nav ml-auto">
                <% if (session.getAttribute("auth") != null) { %>
                    <!-- User is logged in -->
                    <li class="nav-item <%= request.getRequestURI().contains("addproduct.jsp") ? "active" : "" %>">
                        <a class="nav-link" href="addproduct.jsp"><i class="fas fa-box"></i> Add Products</a>
                    </li>
                    <li class="nav-item <%= request.getRequestURI().contains("sellerorders.jsp") ? "active" : "" %>">
                        <a class="nav-link" href="sellerorders.jsp"><i class="fas fa-box"></i> Orders</a>
                    </li>
                    <li class="nav-item <%= request.getRequestURI().contains("reviews.jsp") ? "active" : "" %>">
                        <a class="nav-link" href="reviews.jsp"><i class="fas fa-star"></i> Reviews</a>
                    </li>
                    <li class="nav-item <%= request.getRequestURI().contains("logout.jsp") ? "active" : "" %>">
                        <a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </li>
                <% } else { %>
                    <!-- User is not logged in -->
                    <li class="nav-item <%= request.getRequestURI().contains("login_seller.jsp") ? "active" : "" %>">
                        <a class="nav-link" href="login_seller.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
                    </li>
                    <li class="nav-item <%= request.getRequestURI().contains("createselleraccount.jsp") ? "active" : "" %>">
                        <a class="nav-link" href="createselleraccount.jsp"><i class="fas fa-user-plus"></i> Sign Up</a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
<br><br><br>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>