<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/navbar.jsp" %>
<%@ page import="com.shoppingcart.usermodel.Product" %>
<%@ page import="com.shoppingcart.usermodel.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>

<%
    Product product = (Product) request.getAttribute("product");
    
    List<Review> reviews = null;
    Object reviewsObj = request.getAttribute("reviews");
    
    if (reviewsObj instanceof List<?>) {
        reviews = (List<Review>) reviewsObj;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= (product != null ? product.getProductName() : "Product Details") %> - Product Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #f3f3f3;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }
        .product-container,
        .review-section {
            max-width: 1200px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .product-image {
            width: 100%;
            max-width: 400px;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .product-details {
            margin-left: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        h1 {
            color: #333;
            font-size: 2rem;
            margin-bottom: 20px;
        }
        .price {
            color: #B12704;
            font-size: 1.5rem;
            margin-bottom: 20px;
        }
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        .btn {
            font-size: 1rem;
            padding: 10px 20px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .btn-add-to-cart,
        .btn-buy-now,
        .btn-primary {
            background-color: #ff9900;
            border-color: #ff9900;
            color: #ffffff;
        }
        .btn-add-to-cart:hover,
        .btn-buy-now:hover,
        .btn-primary:hover {
            background-color: #e68a00;
            border-color: #e68a00;
        }
        .review-item {
            background-color: #f9f9f9;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .review-form {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }
        .review-form textarea {
            resize: none;
            min-height: 120px;
        }
        .side-by-side {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .side-by-side .product-container {
            flex: 1;
            min-width: 300px;
        }
        .side-by-side .review-section {
            flex: 1;
            min-width: 300px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="side-by-side">
            <div class="product-container">
                <div class="row">
                    <div class="col-md-6 text-center">
                        <img src="<%= (product != null && product.getImageUrl() != null && !product.getImageUrl().isEmpty()) ? product.getImageUrl() : "images/default.jpg" %>" alt="<%= product != null ? product.getProductName() : "Product Image" %>" class="product-image">
                    </div>
                    <div class="col-md-6 product-details">
                        <h1><%= product != null ? product.getProductName() : "Product Name" %></h1>
                        <p><%= product != null ? product.getDescription() : "Product Description" %></p>

                        <%
                            if (product != null) {
                                BigDecimal price = product.getPrice() != null ? product.getPrice() : BigDecimal.ZERO;
                                BigDecimal discount = product.getDiscount() != null ? product.getDiscount() : BigDecimal.ZERO;
                                BigDecimal discountAmount = price.multiply(discount).divide(new BigDecimal(100));
                                BigDecimal finalPrice = price.subtract(discountAmount);
                        %>
                        <div class="price">Price: Rs.<%= finalPrice %></div>

                        <div class="button-group">
                            <form action="AddToCartServlet" method="post" style="display: inline;">
                                <input type="hidden" name="productId" value="<%= product.getProductId() %>" />
                                <button type="submit" class="btn btn-add-to-cart">Add to Cart</button>
                            </form>
                            <form action="BuyNowServlet" method="post" style="display: inline;">
                                <input type="hidden" name="productId" value="<%= product.getProductId() %>" />
                                <button type="submit" class="btn btn-buy-now">Buy Now</button>
                            </form>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="review-section">
                <h3>Customer Reviews</h3>
                <% if (reviews != null && !reviews.isEmpty()) {
                    for (Review review : reviews) { %>
                    <div class="review-item">
                        <div class="rating">
                            <% for (int i = 1; i <= review.getRating(); i++) { %>
                            <span class="fas fa-star text-warning"></span>
                            <% } %>
                        </div>
                        <p><%= review.getComment() %></p>
                        <small>- <%= review.getReviewerName() %></small>
                    </div>
                <% } } else { %>
                <p>No reviews yet. Be the first to review this product!</p>
                <% } %>

                <div class="review-form">
                    <h4>Leave a Review</h4>
                    <form action="SubmitReviewServlet" method="post">
                        <input type="hidden" name="productId" value="<%= product != null ? product.getProductId() : "" %>" />
                        <div class="form-group">
                            <label for="reviewerName">Your Name:</label>
                            <input type="text" class="form-control" name="reviewerName" id="reviewerName" required>
                        </div>
                        <div class="form-group">
                            <label for="rating">Rating:</label>
                            <select name="rating" id="rating" class="form-control">
                                <option value="5">5 - Excellent</option>
                                <option value="4">4 - Good</option>
                                <option value="3">3 - Average</option>
                                <option value="2">2 - Poor</option>
                                <option value="1">1 - Terrible</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="comment">Your Review:</label>
                            <textarea name="comment" id="comment" class="form-control" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Submit Review</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
