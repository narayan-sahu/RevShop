<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/navbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f3f3f3; /* Amazon's light grey background */
            margin: 0;
            padding: 0;
        }

        .order-success-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #28a745; /* Green color for success messages */
            font-size: 2rem;
            margin-bottom: 20px;
            font-weight: bold;
        }

        p {
            color: #333;
            font-size: 1.2rem;
            margin-bottom: 30px;
        }

        .btn-primary {
            background-color: #ff9900; /* Amazon's orange */
            border-color: #ff9900;
            color: #ffffff;
            font-weight: bold;
            border-radius: 4px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #e47911; /* Darker orange on hover */
            border-color: #e47911;
        }
    </style>
</head>
<body>
    <div class="container order-success-container">
        <h2>Order Confirmation</h2>
        <p>Your order has been placed successfully! Thank you for shopping with us.</p>
        <a href="Index.jsp" class="btn btn-primary">Continue Shopping</a>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
