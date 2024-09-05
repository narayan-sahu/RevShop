<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shoppingcart.usermodel.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.shoppingcart.connection.DBconnection"%>
<%@ page import="com.shoppingcart.dao.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RevShop - Seller</title>
    <!-- CSS and other head content -->
</head>
<body>
    <%@ include file="includes/navbarseller.jsp"%>

    <div class="container mt-4">
        <h2>Products</h2>

        <!-- Low stock warning section -->
        <%
            // Assuming `auth` is a UserModel object, adjust if `auth` is a String or other type
            UserModel user = (UserModel) session.getAttribute("auth");
            if (user == null) {
                response.sendRedirect("login_seller.jsp");
                return;
            }
            String sellerEmail = user.getEmail(); // assuming UserModel has a getEmail() method
        %>

        <%
            ProductDAO productDAO = new ProductDAO();
            try {
                List<Product> lowStockProducts = productDAO.getLowStockProducts(sellerEmail);
                if (!lowStockProducts.isEmpty()) {
                    out.println("<div class='alert alert-warning' role='alert'>");
                    out.println("<h4>Low Stock Warning</h4>");
                    out.println("<ul>");
                    for (Product product : lowStockProducts) {
                        out.println("<li>" + product.getProductName() + " - Only " + product.getStock() + " left in stock!</li>");
                    }
                    out.println("</ul>");
                    out.println("</div>");
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                out.println("<div class='alert alert-danger' role='alert'>Failed to retrieve low stock products.</div>");
            }
        %>

        <div class="product-grid">
            <!-- Existing code to display products -->
            <%
                try (Connection conn = DBconnection.getConnection();
                     PreparedStatement ps = conn.prepareStatement("SELECT * FROM revshop.product WHERE sellerEmail = ?")) {
                    
                    ps.setString(1, sellerEmail);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (!rs.isBeforeFirst()) {
            %>
            <p class="empty-product-message">You have not added any products yet.</p>
            <%
                        } else {
                            while (rs.next()) {
                                String productId = rs.getString("productId");
                                String productName = rs.getString("productName");
                                String productImage = rs.getString("imageUrl");
                                String productPrice = rs.getString("price");
                                int stockQuantity = rs.getInt("stockQuantity");
            %>
            <div class="product-card" data-product-id="<%= productId %>">
                <img id="img" src="<%= productImage %>" alt="<%= productName %>">
                <h3><%= productName %></h3>
                <p class="price">Rs.<%= productPrice %></p>
                <p>Stock: <%= stockQuantity %></p>

                <!-- Edit and Remove buttons -->
                <form action="editproduct.jsp" method="get" style="display: inline;">
                    <input type="hidden" name="productId" value="<%= productId %>" />
                    <button type="submit" class="btn btn-warning">Edit</button>
                </form>
                <br>
                <form action="RemoveProductServlet" method="post" style="display: inline;">
                    <input type="hidden" name="productId" value="<%= productId %>" />
                    <button type="submit" class="btn btn-danger">Remove</button>
                </form>
            </div>
            <%
                            } // end while
                        } // end if-else
                    } // end try with ResultSet
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<div class='alert alert-danger' role='alert'>Failed to connect to the database.</div>");
                }
            %>
        </div>
    </div>
    <br>
    <br>
    <%@ include file="includes/footer.jsp"%>
</body>
</html>
