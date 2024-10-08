<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/navbar.jsp" %>
<%@ page import="java.math.*"  %>
<%@ page import="java.util.List"  %>
<%@ page import="java.sql.*"  %>
<%@ page import="com.shoppingcart.dao.*"  %>
<%@ page import="com.shoppingcart.usermodel.*"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f3f3f3; /* Amazon's light grey background */
            margin: 0;
            padding: 0;
        }
        .confirmation-container {
            max-width: 700px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }
        .confirmation-header {
            color: #333;
            font-size: 2rem;
            margin-bottom: 30px;
            text-align: center;
            font-weight: bold;
        }
        .form-group label {
            font-weight: bold;
            color: #555;
        }
        .form-control {
            border-radius: 4px;
            border-color: #ddd;
            box-shadow: none;
            padding: 12px;
        }
        .form-control:focus {
            border-color: #ff9900; /* Amazon's orange */
            box-shadow: 0 0 5px rgba(255, 153, 0, 0.3);
        }
        .btn-submit {
            background-color: #ff9900; /* Amazon's orange */
            border-color: #ff9900;
            color: #ffffff;
            font-weight: bold;
            border-radius: 2px;
            font-size: 1.2rem;
            padding: 10px;
            transition: background-color 0.3s ease;
            width: 50%; /* Reduced width */
            margin: 20px auto; /* Center the button horizontally */
            display: block; /* Ensure the button is centered */
        }
        .btn-submit:hover {
            background-color: #e47911; /* Darker orange on hover */
            border-color: #e47911;
        }
    </style>
</head>
<body>
    <div class="container confirmation-container">
        <h2 class="confirmation-header">Order Confirmation</h2>

        <form id="orderForm" action="ProcessOrderServlet" method="post">
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter your full name" required>
            </div>

            <div class="form-group">
                <label for="address">Delivery Address:</label>
                <textarea class="form-control" id="address" name="address" rows="3" placeholder="Enter your delivery address" required></textarea>
            </div>

            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" class="form-control" id="city" name="city" placeholder="Enter your city" required>
            </div>

            <div class="form-group">
                <label for="state">State:</label>
                <input type="text" class="form-control" id="state" name="state" placeholder="Enter your state" required>
            </div>

            <div class="form-group">
                <label for="zipCode">Zip Code:</label>
                <input type="text" class="form-control" id="zipCode" name="zipCode" placeholder="Enter your zip code" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" required>
            </div>

<div class="form-group">
    <label for="paymentMethod">Payment Method:</label>
    <select class="form-control" id="paymentMethod" name="paymentMethod" required style="color: #555; height: 45px; padding: 8px;">
        <option value="" disabled selected hidden="hidden">Select Payment Method</option>
        <option value="Credit Card" <%= "Credit Card".equals(request.getParameter("paymentMethod")) ? "selected" : "" %>>Credit Card</option>
        <option value="Debit Card" <%= "Debit Card".equals(request.getParameter("paymentMethod")) ? "selected" : "" %>>Debit Card</option>
        <option value="Net Banking" <%= "Net Banking".equals(request.getParameter("paymentMethod")) ? "selected" : "" %>>Net Banking</option>
        <option value="UPI" <%= "UPI".equals(request.getParameter("paymentMethod")) ? "selected" : "" %>>UPI</option>
    </select>
</div>



            <input type="hidden" name="cartId" value="<%= request.getParameter("cartId") %>" />

            <button type="button" id="payButton" class="btn btn-submit">Confirm Order</button>
        </form>

        <%
            String userEmail = (String) session.getAttribute("email");
            BigDecimal totalAmount = BigDecimal.ZERO;
            int quantity = 0;
            List<Order> orders = null;
            try {
                OrderDAO orderDAO = new OrderDAO();
                orders = orderDAO.getOrdersByUser(userEmail);
                if (orders != null && !orders.isEmpty()) {
                    for (Order order : orders) {
                        totalAmount = order.getPrice().setScale(2, RoundingMode.HALF_UP);
                        quantity = order.getQuantity();
                    }
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
                return;
            }
        %>

    </div>
    <!-- Razorpay JavaScript SDK -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <script>
        document.getElementById('payButton').onclick = function(e){
            var options = {
                "key": "rzp_test_dChgnE1vVIlVnK", // Replace with your Razorpay API Key
                "amount": "<%= totalAmount.multiply(new BigDecimal(100)) %>", // Amount in paise
                "currency": "INR",
                "name": "Your Company Name",
                "description": "Order #123456",
                "image": "https://your_company_logo_url", // Replace with your company logo URL
                "handler": function (response){
                    alert("Payment successful. Payment ID: " + response.razorpay_payment_id);
                    document.getElementById('orderForm').submit();
                },
                "prefill": {
                    "name": document.getElementById('fullName').value,
                    "email": "<%= userEmail != null ? userEmail : "customer@example.com" %>",
                    "contact": document.getElementById('phone').value
                },
                "notes": {
                    "address": document.getElementById('address').value
                },
                "theme": {
                    "color": "#3399cc"
                },
                "modal": {
                    "ondismiss": function(){
                        alert('Payment was not completed. Please try again.');
                    }
                }
            };
            var rzp1 = new Razorpay(options);
            rzp1.open();
            e.preventDefault();
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
