# RevShop - Java Fullstack E-commerce Website

## Overview

**RevShop** is a fully functional e-commerce website built using Java, JSP (JavaServer Pages), Servlets, SQL, HTML, CSS, and other related technologies. This project aims to provide a comprehensive platform for online shopping, offering features such as product browsing, user authentication, shopping cart management, order processing, and more. It is designed to serve as a learning project for understanding the integration of front-end and back-end technologies in a full-stack Java application.

## Features

### Buyer User Account:

As a buyer, you will be able to:

1. **Register on the platform**: Create a new account with your email and password.
2. **Login into the application**: Access your account using your email and password.
3. **View product details**: See images, prices, descriptions, and user reviews for each product.
4. **Browse products**: Search for products by category or keywords.
5. **Manage Cart**: Add or remove products from the cart and specify the desired quantity.
6. **Checkout**: Enter shipping and billing information to complete your purchase.
7. **Order Notifications**: Receive email notifications when an order is placed.
8. **Order History**: View a record of all your past orders.
9. **Product Reviews**: Leave reviews for products you’ve purchased.
10. **Save Favorites**: Save products as favorites for easy access later.
11. **Make Payments**: Use the integrated payment gateway to complete your transactions.

### Seller Account:

As a seller, you will be able to:

1. **Register as a seller**: Sign up with your email, password, and business details.
2. **Login into the application**: Access your seller account using your email and password.
3. **Manage Inventory**: Keep track of your product inventory and update it as needed.
4. **Add New Products**: List new products by providing the price, description, and other details.
5. **Order Management**: View orders placed by buyers and manage them.
6. **Order Notifications**: Receive email notifications whenever a user places an order.
7. **Discount Management**: Set a discounted price along with the maximum retail price (MRP).
8. **View Product Reviews**: See reviews left by buyers for your products.
9. **Low Stock Alerts**: Get web notifications when a product’s quantity falls below a set threshold (threshold set by the seller).


## Technologies Used

### Backend
- **Java**: Core language for server-side logic.
- **JSP (JavaServer Pages)**: For dynamic web content and UI rendering.
- **Servlets**: For handling HTTP requests and responses.
- **SQL**: For database management and querying.

### Frontend
- **HTML**: Markup language for structuring web pages.
- **CSS**: Styling for web pages to ensure a responsive and visually appealing UI.
- **JavaScript**: For client-side interactions and dynamic behavior.

### Database
- **MySQL**: Relational database management system for storing and managing data.

## Project Structure

- **src/**: Contains all the Java source files, including Servlets and utility classes.
- **web/**: Contains JSP files, HTML templates, CSS stylesheets, and JavaScript files.
- **WEB-INF/**: Configuration files, including `web.xml` for servlet mapping and application settings.
- **lib/**: External libraries and dependencies required for the project.
- **sql/**: Database scripts for creating tables and populating initial data.

## Setup and Installation

### Prerequisites

- JDK (Java Development Kit) 8 or higher
- Apache Tomcat (or any other servlet container)
- MySQL Database Server
- IDE (Eclipse, IntelliJ IDEA, or NetBeans)

### Steps to Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/RevShop.git 
   ```
2. **Import the Project:**

  - Open your IDE and import the project as a Maven/Gradle project.

### Set up the Database:

   - Create a new MySQL database.
   - Run the SQL scripts provided in the `sql/` directory to create the required tables and populate initial data.

### Configure Database Connection:

   - Update the database connection settings in the `dbconfig.properties` file located in the `WEB-INF` directory.

### Deploy to Tomcat:

   - Deploy the project to your Apache Tomcat server.

### Run the Application:

   - Start the Tomcat server and navigate to `http://localhost:8080/RevShop` to access the application.

## Usage

### User:

   - Register for a new account or log in with existing credentials.
   - Browse products, add items to the shopping cart, and proceed to checkout.
   - View and manage orders from the user dashboard.

### Admin:

   - Access the admin panel to manage users, products, and orders.
   - Add new products, update existing ones, or remove products from the catalog.

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request for any bug fixes or feature enhancements. Make sure to follow the project's coding guidelines and provide clear commit messages.

## License

This project is licensed under the Unlicense. See the [LICENSE](https://github.com/narayan-sahu/RevShop/blob/main/LICENSE) file for details.

