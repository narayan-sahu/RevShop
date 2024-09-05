<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.shoppingcart.dao.CartDAO" %>
<%@ page import="com.shoppingcart.usermodel.CartItem" %>
<%@ page import="java.math.BigDecimal" %>

<%@ include file="includes/navbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f3f3f3; /* Amazon's light grey background */
            font-family: 'Arial', sans-serif;
        }
        .cart-container {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for a polished look */
        }
        .cart-table {
            width: 100%;
            border-collapse: collapse;
        }
        .cart-table th, .cart-table td {
            padding: 12px;
            border-bottom: 1px solid #e7e7e7;
            text-align: center;
            vertical-align: middle;
        }
        .cart-table th {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #555555;
        }
        .cart-table td img {
            max-width: 100px;
        }
        .cart-total {
            text-align: right;
            padding: 15px;
            font-size: 1.2em;
            font-weight: bold;
            color: #ff9900; /* Amazon's orange color for the total */
        }
        .empty-cart-message {
            text-align: center;
            font-size: 1.2em;
            margin: 50px 0;
            color: #555555;
        }
        .btn-success {
            background-color: #ff9900; /* Amazon's orange color for the buy button */
            border-color: #ff9900;
            color: #ffffff;
            font-weight: bold;
        }
        .btn-success:hover {
            background-color: #e47911; /* Darker orange on hover */
            border-color: #e47911;
        }
        .btn-danger {
            background-color: #d9534f; /* Bootstrap's red for the remove button */
            border-color: #d43f3a;
            color: #ffffff;
        }
        .btn-danger:hover {
            background-color: #c9302c;
            border-color: #ac2925;
        }
    </style>
</head>
<body>
    <div class="container cart-container">
        <%
            if (session.getAttribute("auth") == null) {
                response.sendRedirect("login_buyer.jsp");
                return;
            }
            String userEmail = (String) session.getAttribute("email");
            CartDAO cartDAO = new CartDAO();
            List<CartItem> cartItems = null;
            try {
                cartItems = cartDAO.getCartItemsByUser(userEmail);
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
            if (cartItems == null || cartItems.isEmpty()) {
        %>
            <p class="empty-cart-message">Your cart is empty.</p>
        <%
            } else {
                BigDecimal total = new BigDecimal("0");
        %>
            <table class="cart-table table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (CartItem item : cartItems) {
                            BigDecimal itemTotal = item.getPrice().multiply(new BigDecimal(item.getQuantity()));
                            total = total.add(itemTotal);
                    %>
                    <tr>
                        <td><%= item.getProductName() %></td>
                        <td><%= item.getQuantity() %></td>
                        <td>Rs.<%= item.getPrice() %></td>
                        <td>Rs.<%= String.format("%.2f", itemTotal) %></td>
                        <td>
                            <!-- Form for the Buy button -->
                            <form action="ConfirmOrderServlet" method="post" style="display: inline;">
                                <input type="hidden" name="cartId" value="<%= item.getCartId() %>" />
                                <button type="submit" class="btn btn-success">Buy</button>
                            </form>

                            <!-- Form for the Remove button -->
                            <form action="RemoveCartServlet" method="post" style="display: inline;">
                                <input type="hidden" name="cartId" value="<%= item.getCartId() %>" />
                                <button type="submit" class="btn btn-danger">Remove</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                        BigDecimal totalRounded = total.setScale(2, BigDecimal.ROUND_HALF_UP);
                    %>
                    <tr>
                        <td colspan="3" class="cart-total">Total</td>
                        <td colspan="2" class="cart-total">Rs.<%= String.format("%.2f", totalRounded) %></td>
                    </tr>
                </tbody>
            </table>
        <%
            }
        %>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>