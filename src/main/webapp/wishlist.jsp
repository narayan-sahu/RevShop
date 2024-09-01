<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Wishlist</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f3f3f3; /* Amazon's light grey background */
            font-family: Arial, sans-serif; /* Amazon's font */
        }
        .container {
            margin-top: 30px;
        }
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            background-color: #fff;
            padding: 15px;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
        .card img {
            border-radius: 8px;
            margin-bottom: 15px;
        }
        .card h5 {
            font-size: 1.25rem;
            color: #333;
            margin-bottom: 10px;
        }
        .card p {
            font-size: 1rem;
            color: #B12704; /* Amazon's price color */
            margin-bottom: 10px;
        }
        .favorite-btn {
            background-color: transparent;
            border: none;
            color: #ff9900; /* Amazon's orange */
            font-size: 1.5rem;
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            transition: color 0.3s ease;
        }
        .favorite-btn.active {
            color: red;
        }
        .btn-success {
            background-color: #ff9900; /* Amazon's orange */
            border-color: #ff9900;
            color: white;
            width: 48%;
            font-size: 0.9rem;
            padding: 8px;
            border-radius: 4px;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn-success:hover {
            background-color: #e68a00; /* Darker orange on hover */
            border-color: #e68a00;
            transform: translateY(-2px);
        }
        .btn-danger {
            background-color: #B12704; /* Amazon's red */
            border-color: #B12704;
            color: white;
            width: 48%;
            font-size: 0.9rem;
            padding: 8px;
            border-radius: 4px;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn-danger:hover {
            background-color: #A31E02; /* Darker red on hover */
            border-color: #A31E02;
            transform: translateY(-2px);
        }
        .d-flex {
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container mt-5">
        <h1>Your Wishlist</h1>
        <div class="row">
            <%
                String email = (String) session.getAttribute("email");
                Set<String> wishlist = (Set<String>) session.getAttribute("wishlist");
                if (email == null && (wishlist == null || wishlist.isEmpty())) {
                    out.println("<p>Your wishlist is empty. Please add some products.</p>");
                    return;
                }
                try (Connection conn = DBconnection.getConnection();
                     Statement stmt = conn.createStatement()) {
                    String query;
                    if (email != null) {
                        // Query for logged-in users, getting items from the database
                        query = "SELECT p.productId, p.productName, p.imageUrl, p.price " +
                                "FROM revshop.product p " +
                                "JOIN revshop.wishlist w ON p.productId = w.productId " +
                                "WHERE w.email = '" + email + "'";
                    } else {
                        // Query for non-logged-in users, getting items from session-stored wishlist
                        if (wishlist != null && !wishlist.isEmpty()) {
                            String productIds = wishlist.stream()
                                                        .map(id -> "'" + id + "'")
                                                        .collect(Collectors.joining(","));
                            query = "SELECT productId, productName, imageUrl, price FROM revshop.product WHERE productId IN (" + productIds + ")";
                        } else {
                            query = ""; // No need to query if wishlist is empty
                        }
                    }
                    if (!query.isEmpty()) {
                        ResultSet rs = stmt.executeQuery(query);
                        while (rs.next()) {
                            String productId = rs.getString("productId");
                            String productName = rs.getString("productName");
                            String productImage = rs.getString("imageUrl");
                            String productPrice = rs.getString("price");
                            boolean isInWishlist = wishlist != null && wishlist.contains(productId);
            %>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img src="<%= productImage %>" class="card-img-top" alt="<%= productName %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= productName %></h5>
                        <p class="card-text">Rs.<%= productPrice %></p>
                        <form class="favorite-form" method="post" action="<%= isInWishlist ? "RemoveFromWishlistServlet" : "AddToWishlistServlet" %>">
                            <input type="hidden" name="productId" value="<%= productId %>" />
                            <button type="submit" class="favorite-btn <%= isInWishlist ? "active" : "" %>">
                                <i class="fas fa-heart"></i>
                            </button>
                        </form>
                        <div class="d-flex justify-content-between mt-3">
                            <form action="AddToCartServlet" method="post" style="flex-grow: 1; margin-right: 5px;">
                                <input type="hidden" name="productId" value="<%= productId %>" />
                                <button type="submit" class="btn btn-success btn-block">Buy Now</button>
                            </form>
                            <form action="RemoveFromWishlistServlet" method="post" style="flex-grow: 1; margin-left: 5px;">
                                <input type="hidden" name="productId" value="<%= productId %>" />
                                <button type="submit" class="btn btn-danger btn-block">Remove</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%
                        }
                    } else {
                        out.println("<p>Your wishlist is empty. Please add some products.</p>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<div class='alert alert-danger' role='alert'>Failed to load wishlist items.</div>");
                }
            %>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>