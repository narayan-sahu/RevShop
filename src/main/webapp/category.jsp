<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.shoppingcart.dao.ProductDAO" %>
<%@ page import="com.shoppingcart.usermodel.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Products</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
           body {
            background-color: #f3f3f3;
            font-family: 'Arial', sans-serif;
            color: #333;
        }
        .container h2 {
            color: #ff9900;
            margin-top: 20px;
            margin-bottom: 30px;
            font-weight: bold;
            text-align: center;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin: 0 auto;
            padding: 0 15px;
            max-width: 1200px;
            box-sizing: border-box;
        }
        .product-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 15px;
            height: 100%;
            box-sizing: border-box;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }
        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: contain;
            border-radius: 10px;
            margin-bottom: 15px;
        }
        .product-card h3 {
            font-size: 1.2em;
            margin-bottom: 10px;
            color: #333;
            min-height: 50px;
        }
        .product-card p {
            flex-grow: 1;
            margin-bottom: 10px;
            font-size: 0.9em;
            color: #777;
        }
        .price-quantity-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        .price {
            color: #ff9900;
            font-size: 1.1em;
            margin: 0;
            font-weight: bold;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
        }
        .add-to-cart-btn, .buy-btn {
            background-color: #ff9900;
            color: white;
            border: none;
            padding: 10px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.8em;
            transition: background-color 0.3s, transform 0.2s;
            width: 48%;
            text-transform: uppercase;
            display: flex;
            justify-content: center; /* Ensure text stays centered */
            align-items: center; /* Ensure text stays centered */
        }
        .add-to-cart-btn:hover {
            background-color: #e47911;
        }
        .buy-btn {
            background-color: #ff9900; /* Make buy button the same orange color */
        }
        .buy-btn:hover {
            background-color: #e47911;
        }
        @media (max-width: 1200px) {
            .product-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }
        @media (max-width: 992px) {
            .product-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        @media (max-width: 576px) {
            .product-grid {
                grid-template-columns: 1fr;
            }
        }
        .no-products-message {
            text-align: center;
            font-size: 1.2em;
            margin: 50px 0;
            color: #777;
        }
    </style>
</head>
<body>
    <!-- Navbar inclusion -->
    <%@ include file="includes/navbar.jsp" %>

    <div class="container">
        <h2>Products in <%= request.getParameter("category") %> Category</h2>
        <div class="product-grid">
            <%
                String category = request.getParameter("category");
                List<Product> productList = null;
                try {
                    ProductDAO productDAO = new ProductDAO();
                    productList = productDAO.getProductsByCategory(category);
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
                if (productList != null && !productList.isEmpty()) {
                    for (Product product : productList) {
            %>
            <div class="product-card">
                <a href="ProductDetailsServlet?productId=<%= product.getProductId() %>">
                    <img src="<%= product.getImageUrl() %>" alt="<%= product.getProductName() %>" />
                </a>
                <h3><%= product.getProductName() %></h3>
                <p><%= product.getDescription() %></p>
                <div class="price-quantity-row">
                    <p class="price">Rs.<%= product.getPrice() %></p>
                </div>
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productId" value="<%= product.getProductId() %>" />
                    <div class="button-group">
                        <input type="submit" value="Add to Cart" class="add-to-cart-btn" />
                        <input type="submit" value="Buy" class="buy-btn"/>
                    </div>
                </form>
            </div>
            <%
                    }
                } else {
            %>
            <p class="no-products-message">No products found in this category.</p>
            <%
                }
            %>
        </div>
    </div>
<br>
<br>
    <!-- Footer inclusion -->
    <%@ include file="includes/footer.jsp" %>
</body>
</html>