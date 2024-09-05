<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.shoppingcart.usermodel.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f3f3f3; /* Amazon's light grey background */
            font-family: 'Arial', sans-serif; /* Modern font */
            color: #333; /* Darker text color for better contrast */
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 20px;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4 columns for larger screens */
            gap: 20px;
            margin-top: 20px;
        }
        .product-card {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 15px;
            transition: transform 0.3s ease;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }
        .product-card img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 15px;
        }
        .product-card h3 {
            font-size: 1.2em;
            margin-bottom: 10px;
            color: #333;
        }
        .price-quantity-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        .price {
            color: #B12704; /* Amazon's price color */
            font-size: 1.1em;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }
        .btn {
            font-size: 0.9em;
            padding: 10px;
            border-radius: 5px;
            width: 48%;
            transition: background-color 0.3s ease;
        }
        .btn-add-to-cart {
            background-color: #ff9900; /* Amazon's orange */
            border: none;
            color: #fff;
        }
        .btn-add-to-cart:hover {
            background-color: #e68a00;
        }
        .btn-buy-now {
            background-color: #007bff; /* Amazon's blue */
            border: none;
            color: #fff;
        }
        .btn-buy-now:hover {
            background-color: #0056b3;
        }
        @media (max-width: 1200px) {
            .product-grid {
                grid-template-columns: repeat(3, 1fr); /* 3 products per row for medium screens */
            }
        }
        @media (max-width: 992px) {
            .product-grid {
                grid-template-columns: repeat(2, 1fr); /* 2 products per row for tablets */
            }
        }
        @media (max-width: 768px) {
            .product-grid {
                grid-template-columns: 1fr; /* 1 product per row for small screens */
            }
        }
    </style>
</head>
<body>
    <!-- Navbar inclusion -->
    <%@ include file="includes/navbar.jsp" %>

    <div class="container">
        <h2>Search Results</h2>
        <div class="product-grid">
            <%
                List<Product> productList = (List<Product>) request.getAttribute("productList");
                if (productList != null && !productList.isEmpty()) {
                    for (Product product : productList) {
            %>
            <div class="product-card">
                <a href="ProductDetailsServlet?productId=<%= product.getProductId() %>">
                    <img src="<%= product.getImageUrl() %>" alt="<%= product.getProductName() %>">
                </a>
                <h3><%= product.getProductName() %></h3>
                <div class="price-quantity-row">
                    <p class="price">Rs.<%= product.getPrice() %></p>
                </div>
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productId" value="<%= product.getProductId() %>" />
                    <div class="button-group">
                        <button type="submit" class="btn btn-add-to-cart">Add to Cart</button>
                        <button type="submit" class="btn btn-buy-now">Buy Now</button>
                    </div>
                </form>
            </div>
            <%
                    }
                } else {
            %>
            <p>No products found matching your search criteria.</p>
            <%
                }
            %>
        </div>
    </div>

    <!-- Footer inclusion -->
    <%@ include file="includes/footer.jsp" %>
</body>
</html>