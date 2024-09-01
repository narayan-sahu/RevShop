<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Buyer Account</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f3f3f3; /* Amazon's light grey background */
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif; /* Amazon's font */
        }
        .card {
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-width: 500px;
            width: 100%;
            margin: auto;
        }
        .card-header {
            background-color: #232F3E; /* Amazon's dark blue */
            color: white;
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            padding: 20px;
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
        }
        .btn-primary:hover {
            background-color: #e47911; /* Darker orange on hover */
            border-color: #e47911;
        }
        @media (max-width: 768px) {
            .card-header {
                font-size: 1.25rem;
            }
            .btn-primary {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>
    <br>
    <br>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Create Buyer Account</div>
                    <div class="card-body">
                        <form action="CreateAccountServlet" method="post">
                            <div class="form-group">
                                <label for="first_name">First Name</label>
                                <input type="text" class="form-control" id="first_name" name="first_name" placeholder="Enter your first name" required>
                            </div>
                            <div class="form-group">
                                <label for="last_name">Last Name</label>
                                <input type="text" class="form-control" id="last_name" name="last_name" placeholder="Enter your last name" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter a strong password" required>
                            </div>
                            <div class="form-group">
                                <label for="phone_number">Phone Number</label>
                                <input type="tel" class="form-control" id="phone_number" name="phone_number" placeholder="Enter your phone number" required>
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" class="form-control" id="address" name="address" placeholder="Enter your address" required>
                            </div>
                            <div class="form-group">
                                <label for="city">City</label>
                                <input type="text" class="form-control" id="city" name="city" placeholder="Enter your city" required>
                            </div>
                            <div class="form-group">
                                <label for="state">State</label>
                                <input type="text" class="form-control" id="state" name="state" placeholder="Enter your state" required>
                            </div>
                            <div class="form-group">
                                <label for="zip_code">ZIP Code</label>
                                <input type="text" class="form-control" id="zip_code" name="zip_code" placeholder="Enter your ZIP code" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block mt-4">Create Account</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<br>
    <br>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>