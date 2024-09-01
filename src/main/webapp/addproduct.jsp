<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product - RevShop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f3f3f3; /* Amazon's light grey background */
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin-top: 100px; /* Increased spacing from the navbar */
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for a polished look */
            border-radius: 8px; /* Slightly rounded corners */
        }
        h2 {
            color: #ff9900; /* Amazon's orange color for headings */
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center; /* Center the heading */
        }
        label {
            font-weight: bold;
            color: #555555; /* Slightly darker grey for labels */
        }
        .form-control {
            border-radius: 4px;
            border-color: #ddd;
            box-shadow: none;
        }
        .form-control:focus {
            border-color: #ff9900; /* Amazon's orange */
            box-shadow: 0 0 8px rgba(255, 153, 0, 0.3);
        }
        .btn-primary {
            background-color: #ff9900 !important; /* Amazon's orange color for the button */
            border-color: #ff9900 !important; /* Same color for the border */
            color: #ffffff !important; /* White text color */
            text-decoration: none; /* Remove underline from text */
            font-weight: bold;
            transition: background-color 0.3s ease, color 0.3s ease;
            display: block; /* Make the button block-level */
            margin: 20px auto 0 auto; /* Center the button with some margin */
            text-align: center;
            width: 50%; /* Set a width for better alignment */
        }
        .btn-primary:hover {
            background-color: #e47911 !important; /* Darker orange on hover */
            border-color: #e47911 !important; /* Darker border on hover */
            color: #ffffff !important; /* Keep text white on hover */
        }
        .modal-header {
            background-color: #ff9900; /* Amazon's orange color for modal header */
            color: #ffffff; /* White text */
            border-bottom: none;
        }
        .modal-footer .btn-primary {
            background-color: #ff9900; /* Amazon's orange color */
            border-color: #ff9900;
        }
        .modal-footer .btn-primary:hover {
            background-color: #e47911; /* Darker orange on hover */
            border-color: #e47911;
        }
        .alert-warning {
            background-color: #fffbcc; /* Light yellow background for the alert */
            color: #555555; /* Darker grey text */
            border-color: #ffd700; /* Gold border */
        }
        .alert-warning a {
            color: #007185; /* Amazon's blue for links */
            text-decoration: none;
        }
        .alert-warning a:hover {
            color: #ff9900; /* Amazon's orange on hover */
            text-decoration: none; /* Ensure underline does not appear on hover */
        }
    </style>
</head>
<body>
<%@ include file="includes/navbarseller.jsp" %>

<div class="container mt-4">
    <% if (session.getAttribute("auth") != null) { %>
        <h2>Add a New Product</h2>

        <!-- Modal for success message -->
        <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="successModalLabel">Success</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <%= request.getAttribute("success") %>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for error message -->
        <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="errorModalLabel">Error</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <%= request.getAttribute("error") %>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>

        <form action="AddProductServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="vendorId">Vendor ID:</label>
                <input type="text" class="form-control" id="vendorId" name="vendorId" required>
            </div>
            <div class="form-group">
                <label for="productName">Product Name:</label>
                <input type="text" class="form-control" id="productName" name="productName" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" name="price" step="0.1" min="1" required>
            </div>
            <div class="form-group">
                <label for="imageFile">Upload Image:</label>
                <input type="file" class="form-control" id="imageFile" name="imageFile" accept="image/*" required>
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <select class="form-control" id="category" name="category" required>
                    <option value="Electronics">Electronic and Accessories</option>
                    <option value="Clothing">Clothing and Accessories</option>
                    <option value="Home">Home and Kitchen</option>
                    <option value="Grocery">Grocery</option>
                </select>
            </div>
            <div class="form-group">
                <label for="stockQuantity">Stock Quantity:</label>
                <input type="number" class="form-control" id="stockQuantity" name="stockQuantity" min="1" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>

    <% } else { %>
        <div class="alert alert-warning" role="alert">
            Please <a href="login_seller.jsp">login</a> to add products.
        </div>
    <% } %>
</div>
<br>
<script>
// Show the appropriate modal if the 'success' or 'error' attribute is present
$(document).ready(function() {
    <% if (request.getAttribute("success") != null) { %>
        $('#successModal').modal('show');
    <% } else if (request.getAttribute("error") != null) { %>
        $('#errorModal').modal('show');
    <% } %>
});
</script>

</body>

</html>