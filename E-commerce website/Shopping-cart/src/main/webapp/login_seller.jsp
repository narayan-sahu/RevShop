<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f3f3f3; /* Amazon's light grey background */
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            width: 100%;
            max-width: 450px; /* Increased max-width for a larger container */
            padding: 40px; /* Added more padding for better spacing */
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            text-align: center;
        }

        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
        }

        .login-container h2 {
            margin-bottom: 20px;
            font-size: 1.75rem; /* Slightly increased font size */
            color: #232F3E; /* Amazon's dark blue */
            font-weight: bold;
        }

        .form-group label {
            font-weight: bold;
            color: #333333;
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
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #e47911; /* Darker orange on hover */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .text-center a {
            color: #007bff;
            font-size: 0.9rem;
            text-decoration: none;
        }

        .text-center a:hover {
            color: #0056b3;
            text-decoration: underline;
        }

        .btn-forgot {
            background: none;
            border: none;
            color: #007bff;
            cursor: pointer;
            padding: 0;
            font-size: 0.875rem;
            transition: color 0.3s ease;
        }

        .btn-forgot:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Seller Login</h2>
        <form action="SellerLoginServlet" method="post">
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
            <div class="text-center mt-3">
                <a href="createselleraccount.jsp">Create an Account</a><br>
                <button type="button" class="btn-forgot" onclick="window.location.href='forgotpassword.jsp'">Forgot Password?</button>
            </div>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
