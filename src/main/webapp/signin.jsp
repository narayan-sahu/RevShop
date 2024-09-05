<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign In</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f3f3f3; /* Amazon's light grey background */
            font-family: Arial, sans-serif; /* Amazon's font */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
            transition: transform 0.3s;
        }
        .container:hover {
            transform: translateY(-5px);
        }
        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 30px;
        }
        .btn-custom {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            color: #ffffff;
            background-color: #ff9900; /* Amazon's orange */
            border: none;
            border-radius: 4px;
            margin: 10px 0;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-custom:hover {
            background-color: #e68a00; /* Darker orange on hover */
            transform: scale(1.05);
        }
        .btn-custom-seller {
            background-color: #ffa41c; /* Amazon's alternative orange for secondary actions */
        }
        .btn-custom-seller:hover {
            background-color: #ff8c00; /* Slightly darker on hover */
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Sign In</h1>
        <form action="SignInServlet" method="post">
            <button type="submit" name="role" value="buyer" class="btn-custom">Buyer</button>
            <button type="submit" name="role" value="seller" class="btn-custom btn-custom-seller">Seller</button>
        </form>
    </div>
</body>
</html>