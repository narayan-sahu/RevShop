<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shoppingcart.dao.OrderDAO" %>
<%@ page import="com.shoppingcart.usermodel.Order" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders Received</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f3f3f3; /* Amazon's light grey background */
            font-family: 'Arial', sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 20px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            font-size: 2rem;
            margin-bottom: 20px;
            text-align: center;
        }
        .table {
            margin-bottom: 0;
            background-color: #fff;
        }
        .table thead th {
            background-color: #f8f9fa;
            color: #333;
            border-bottom: 2px solid #dee2e6;
        }
        .table tbody tr {
            transition: background-color 0.3s ease;
        }
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
        .table td, .table th {
            vertical-align: middle;
            padding: 12px;
            border-top: 1px solid #dee2e6;
        }
        .form-control {
            font-size: 0.9rem;
            border-radius: 4px;
        }
        .pagination-container {
            text-align: center;
            margin: 20px 0;
        }
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
            .table td, .table th {
                font-size: 0.85rem;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
<%@ include file="includes/navbarseller.jsp" %>
    <div class="container">
        <h2>Orders Received</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Order Date</th>
                    <th>Buyer Email</th>
                    <th>Buyer Name</th>
                    <th>Shipping Address</th>
                    <th>Payment Method</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Retrieve the seller's email from session
                    Object authObject = session.getAttribute("auth");
                    String sellerEmail = authObject != null ? authObject.toString() : null;
                    if (sellerEmail != null && !sellerEmail.isEmpty()) {
                        List<Order> ordersList = null;
                        try {
                            OrderDAO orderDAO = new OrderDAO();
                            ordersList = orderDAO.getOrdersBySellerEmail(sellerEmail); // Fetch orders by seller's email
                        } catch (SQLException | ClassNotFoundException e) {
                            e.printStackTrace();
                        }
                        if (ordersList != null && !ordersList.isEmpty()) {
                            for (Order order : ordersList) {
                %>
                <tr>
                    <td><%= order.getProductName() %></td>
                    <td><%= order.getQuantity() %></td>
                    <td>Rs.<%= order.getPrice() %></td>
                    <td><%= order.getOrderDate() %></td>
                    <td><%= order.getEmail() %></td>
                    <td><%= order.getFullName() %></td>
                    <td><%= order.getAddress() %>, <%= order.getCity() %>, <%= order.getState() %>, <%= order.getZipCode() %></td>
                    <td><%= order.getPaymentMethod() %></td>
                </tr>
                <%
                            }
                        } else {
                %>
                <tr>
                    <td colspan="8" class="text-center">No orders received.</td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="8" class="text-center">Seller email not found in session. Please <a href="login_seller.jsp">login</a>.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
