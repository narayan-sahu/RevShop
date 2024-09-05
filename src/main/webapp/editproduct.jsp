<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shoppingcart.connection.DBconnection" %>
<%@ include file="includes/navbarseller.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f3f3f3; /* Amazon's light grey background */
            font-family: Arial, sans-serif; /* Amazon's font */
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 50px;
            max-width: 800px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #232F3E; /* Amazon's dark blue */
            margin-bottom: 30px;
            text-align: center;
        }
        .form-group label {
            font-weight: bold;
            color: #333333; /* Dark text for labels */
        }
        .form-control {
            border-radius: 4px;
            border-color: #dddddd;
            box-shadow: none;
        }
        .form-control:focus {
            border-color: #ff9900; /* Amazon's orange */
            box-shadow: 0 0 5px rgba(255, 153, 0, 0.5);
        }
        .btn-primary {
            background-color: #ff9900; /* Amazon's orange */
            border-color: #ff9900;
            color: #ffffff;
            font-weight: bold;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            width: 100%;
            padding: 10px;
            margin-top: 20px;
        }
        .btn-primary:hover {
            background-color: #e47911; /* Darker orange on hover */
            border-color: #e47911;
        }
        .alert {
            margin-top: 20px;
            font-size: 1rem;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Edit Product</h2>
    <%
        String productId = request.getParameter("productId");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBconnection.getConnection();
            ps = conn.prepareStatement("SELECT * FROM revshop.product WHERE productId = ?");
            ps.setString(1, productId);
            rs = ps.executeQuery();
            if (rs.next()) {
    %>
                <form action="EditProductServlet" method="post">
                    <input type="hidden" name="productId" value="<%= productId %>">

                    <div class="form-group">
                        <label for="productName">Product Name</label>
                        <input type="text" class="form-control" id="productName" name="productName" value="<%= rs.getString("productName") %>" required>
                    </div>

                    <div class="form-group">
                        <label for="productDescription">Product Description</label>
                        <textarea class="form-control" id="productDescription" name="productDescription" rows="4" required><%= rs.getString("description") %></textarea>
                    </div>

                    <div class="form-group">
                        <label for="productPrice">Price</label>
                        <input type="number" class="form-control" id="productPrice" name="productPrice" value="<%= rs.getString("price") %>" min="1" required>
                    </div>

                    <div class="form-group">
                        <label for="stockQuantity">Stock Quantity</label>
                        <input type="number" class="form-control" id="stockQuantity" name="stockQuantity" value="<%= rs.getInt("stockQuantity") %>" min="1" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </form>
    <%
            } else {
                out.println("<div class='alert alert-danger' role='alert'>Product not found.</div>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<div class='alert alert-danger' role='alert'>Error retrieving product details.</div>");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    %>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>