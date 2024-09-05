<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shoppingcart.connection.DBconnection"%>
<%@ page import="com.shoppingcart.usermodel.*"%>
	<%@ include file="includes/navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RevShop</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
body {
	background-color: #f3f3f3; /* Light gray background similar to Amazon */
	font-family: 'Arial', sans-serif;
	color: #333;
}

.navbar {
	background-color: #232F3E; /* Amazon's dark blue color */
	padding: 10px;
}

.navbar-brand, .navbar-nav .nav-link {
	color: #ffffff;
	font-weight: bold;
}

.product-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr); /* 3 columns per row */
	gap: 20px;
	margin: 20px auto;
	padding: 0 15px;
	max-width: 1200px;
}

.product-card {
	position: relative; /* Ensure positioning context for favorite icon */
	background-color: white;
	border: 1px solid #ddd; /* Light gray border */
	border-radius: 4px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow */
	text-align: center;
	padding: 15px;
	transition: box-shadow 0.3s;
}

.product-card:hover {
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
	/* Slightly stronger shadow on hover */
}

.product-card img {
	width: 100%;
	height: 250px; /* Increase the image height */
	object-fit: contain;
	/* Contain the image within the specified height */
	margin-bottom: 15px;
}

.product-card h3 {
	font-size: 1.1em;
	color: #007185; /* Amazon's link color */
	margin-bottom: 10px;
}

.price-quantity-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
}

.price {
	color: #B12704; /* Amazon's price color */
	font-size: 1.2em;
	font-weight: bold;
}

.quantity-input {
	width: 60px;
	border-radius: 4px;
	border: 1px solid #ddd;
	padding: 5px;
	text-align: center;
}

.button-group {
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
}

.add-to-cart-btn, .buy-btn {
	width: 48%;
	padding: 10px;
	border-radius: 4px;
	font-size: 1em;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s;
}

.add-to-cart-btn {
	background-color: #FFD814; /* Amazon's "Add to Cart" button color */
	color: #111;
	border: 1px solid #FCD200;
}

.add-to-cart-btn:hover {
	background-color: #F7CA00; /* Darken on hover */
}

.buy-btn {
	background-color: #FF9900; /* Amazon's "Buy Now" button color */
	color: white;
	border: 1px solid #E47911;
}

.buy-btn:hover {
	background-color: #E68A00; /* Darken on hover */
}

.favorite-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    color: #ffffff; /* White color for the heart icon */
    font-size: 1.5em;
    cursor: pointer;
    background: none;
    border: none;
    outline: none;
    padding: 0;
    transition: color 0.3s ease;
}

.favorite-btn i {
    -webkit-text-stroke: 1px #000000; /* Thin black outline around the heart icon */
}

.favorite-btn.active {
    color: #ff0000; /* Red color when active */
    -webkit-text-stroke: 0px; /* Remove outline when active */
}
</style>
</head>
<body>


    <!-- Slider Carousel -->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="slides/1.png" class="d-block w-100" alt="Image 1">
            </div>
            <div class="carousel-item">
                <img src="slides/2.png" class="d-block w-100" alt="Image 2">
            </div>
            <div class="carousel-item">
                <img src="slides/3.png" class="d-block w-100" alt="Image 3">
            </div>
            <div class="carousel-item">
                <img src="slides/4.png" class="d-block w-100" alt="Image 4">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

	<div class="container product-container">
		<div class="product-grid">
			<%
			UserModel user = (UserModel) session.getAttribute("auth");
			String email = (user != null) ? user.getEmail() : null;

			try (Connection conn = DBconnection.getConnection(); Statement stmt = conn.createStatement()) {

				String query = "SELECT * FROM revshop.product";
				ResultSet rs = stmt.executeQuery(query);

				while (rs.next()) {
					String productId = rs.getString("productId");
					String productName = rs.getString("productName");
					String productImage = rs.getString("imageUrl");
					String productPrice = rs.getString("price");
					int stock = rs.getInt("stockQuantity");

					// Check if the product is in the user's wishlist
					boolean isFavorite = false;
					if (email != null) {
						try (Statement wishlistStmt = conn.createStatement()) { // Use a new Statement for the wishlist query
							String wishlistQuery = "SELECT * FROM revshop.wishlist WHERE email = '" + email + "' AND productId = '"
									+ productId + "'";
							try (ResultSet wishlistRs = wishlistStmt.executeQuery(wishlistQuery)) {
								if (wishlistRs.next()) {
									isFavorite = true;
								}
							}
						}
					}
			%>
			<div class="product-card">
				<%
				if (email != null) {
				%>
				<form
					action="<%=isFavorite ? "RemoveFromWishlistServlet" : "AddToWishlistServlet"%>"
					method="post" class="favorite-form">
					<input type="hidden" name="productId" value="<%=productId%>" />
					<button type="submit"
						class="favorite-btn <%=isFavorite ? "active" : ""%>">
						<i class="fas fa-heart"></i>
					</button>
				</form>
				<%
				} else {
				%>
				<button class="favorite-btn"
					onclick="location.href='login_buyer.jsp'">
					<i class="fas fa-heart"></i>
				</button>
				<%
				}
				%>
				<a href="ProductDetailsServlet?productId=<%=productId%>"> <img
					src="<%=productImage%>" alt="<%=productName%>" />
				</a>
				<h3><%=productName%></h3>
				<form
					action="<%=email != null ? "AddToCartServlet" : "login_buyer.jsp"%>"
					method="post">
					<input type="hidden" name="productId" value="<%=productId%>" />
					<div class="price-quantity-row">
						<p class="price">
							Rs.<%=productPrice%></p>
						<div class="quantity-control">
							<input type="number" name="quantity" value="1" min="1"
								max="<%=stock%>" required class="quantity-input" />
						</div>
						<p class="price">
							Stock.<%=stock%></p>
					</div>
					<div class="button-group">
						<input type="submit" value="Add to Cart" class="add-to-cart-btn" />
						<input type="submit" value="Buy" class="buy-btn" />
					</div>
				</form>
			</div>
			<%
			}
			rs.close(); // Close the ResultSet
			} catch (SQLException e) {
			e.printStackTrace();
			out.println("<div class='alert alert-danger' role='alert'>Failed to connect to the database.</div>");
			}
			%>
		</div>
	</div>

	<%@ include file="includes/footer.jsp"%>

	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
